use database SNOWPARK_SAMPLE_DATA;

create schema if not exists MART;

-- Suspend the graph before replacing task definitions on a rerun.
alter task if exists PUBLIC.TASK_L13_REFRESH_VEHICLE_PRICES suspend;
alter task if exists PUBLIC.TASK_L14_NORMALIZE_EXTRAS suspend;
alter task if exists PUBLIC.TASK_L15_OPTIONAL_EXTERNAL_ENRICHMENT suspend;
alter task if exists PUBLIC.TASK_L16_REFRESH_CAR_SALES_MART suspend;

-- Lesson 16 is multi-statement SQL. Promote it to a callable Snowflake object
-- before putting it behind a task.
create or replace procedure MART.REFRESH_CAR_SALES_STAR_SCHEMA()
returns string
language sql
execute as owner
as
$$
begin
  create or replace table MART.DIM_SALES_PERSONS as
  with sales_persons as (
    select
      case
        when SRC:salesperson.id is null then null
        else md5(
          upper(coalesce(SRC:dealership::string, '')) || '|' ||
          coalesce(SRC:salesperson.id::string, '')
        )
      end as SALES_PERSON_KEY,
      SRC:salesperson.id::string as SALES_PERSON_ID,
      SRC:salesperson.name::string as SALES_PERSON_NAME,
      SRC:dealership::string as DEALERSHIP
    from PUBLIC.CAR_SALES
    where SRC:salesperson.id is not null
  )
  select
    SALES_PERSON_KEY,
    SALES_PERSON_ID,
    SALES_PERSON_NAME,
    DEALERSHIP
  from sales_persons
  qualify row_number() over (
    partition by SALES_PERSON_KEY
    order by SALES_PERSON_ID, SALES_PERSON_NAME, DEALERSHIP
  ) = 1;

  create or replace table MART.DIM_CUSTOMERS as
  with customers as (
    select
      case
        when customer.value:name is null then null
        else md5(
          upper(coalesce(customer.value:name::string, '')) || '|' ||
          coalesce(customer.value:phone::string, '') || '|' ||
          upper(coalesce(customer.value:address::string, ''))
        )
      end as CUSTOMER_KEY,
      customer.value:name::string as CUSTOMER_NAME,
      customer.value:phone::string as CUSTOMER_PHONE,
      customer.value:address::string as CUSTOMER_ADDRESS
    from PUBLIC.CAR_SALES cs,
      lateral flatten(input => cs.SRC:customer) customer
    where customer.value is not null
  )
  select
    CUSTOMER_KEY,
    CUSTOMER_NAME,
    CUSTOMER_PHONE,
    CUSTOMER_ADDRESS
  from customers
  qualify row_number() over (
    partition by CUSTOMER_KEY
    order by CUSTOMER_NAME, CUSTOMER_PHONE, CUSTOMER_ADDRESS
  ) = 1;

  create or replace table MART.DIM_VEHICLES as
  with vehicles as (
    select
      case
        when car.value:make is null then null
        else md5(
          upper(coalesce(car.value:make::string, '')) || '|' ||
          upper(coalesce(car.value:model::string, '')) || '|' ||
          coalesce(car.value:year::string, '')
        )
      end as VEHICLE_KEY,
      car.value:make::string as MAKE,
      car.value:model::string as MODEL,
      car.value:year::number as YEAR
    from PUBLIC.CAR_SALES cs,
      lateral flatten(input => cs.SRC:vehicle) car
    where car.value is not null
  )
  select
    VEHICLE_KEY,
    MAKE,
    MODEL,
    YEAR
  from vehicles
  qualify row_number() over (
    partition by VEHICLE_KEY
    order by MAKE, MODEL, YEAR
  ) = 1;

  create or replace table MART.FACT_VEHICLE_SALES as
  select
    md5(
      cs.SRC::string || '|' ||
      customer.index::string || '|' ||
      car.index::string
    ) as SALE_KEY,
    cs.SRC:date::date as SALE_DATE,
    cs.SRC:dealership::string as DEALERSHIP,
    case
      when cs.SRC:salesperson.id is null then null
      else md5(
        upper(coalesce(cs.SRC:dealership::string, '')) || '|' ||
        coalesce(cs.SRC:salesperson.id::string, '')
      )
    end as SALES_PERSON_KEY,
    case
      when customer.value:name is null then null
      else md5(
        upper(coalesce(customer.value:name::string, '')) || '|' ||
        coalesce(customer.value:phone::string, '') || '|' ||
        upper(coalesce(customer.value:address::string, ''))
      )
    end as CUSTOMER_KEY,
    case
      when car.value:make is null then null
      else md5(
        upper(coalesce(car.value:make::string, '')) || '|' ||
        upper(coalesce(car.value:model::string, '')) || '|' ||
        coalesce(car.value:year::string, '')
      )
    end as VEHICLE_KEY,
    car.value:price::number as SALE_PRICE,
    1 as VEHICLE_COUNT
  from PUBLIC.CAR_SALES cs,
    lateral flatten(input => cs.SRC:customer) customer,
    lateral flatten(input => cs.SRC:vehicle) car
  where car.value is not null;

  create or replace table MART.BRIDGE_VEHICLE_SALE_EXTRAS as
  select distinct
    md5(
      cs.SRC::string || '|' ||
      customer.index::string || '|' ||
      vehicle.index::string
    ) as SALE_KEY,
    extra.value::string as EXTRA
  from PUBLIC.CAR_SALES cs,
    lateral flatten(input => cs.SRC:customer) customer,
    lateral flatten(input => cs.SRC:vehicle) vehicle,
    lateral flatten(input => vehicle.value:extras) extra
  where extra.value is not null;

  return 'CAR_SALES star schema refreshed';
end;
$$;

create or replace task PUBLIC.TASK_L13_REFRESH_VEHICLE_PRICES
  warehouse = COMPUTE_WH
  schedule = 'USING CRON 0 7 * * * Australia/Sydney'
as
  call PUBLIC.REFRESH_VEHICLE_PRICES();

create or replace task PUBLIC.TASK_L14_NORMALIZE_EXTRAS
  warehouse = COMPUTE_WH
  after PUBLIC.TASK_L13_REFRESH_VEHICLE_PRICES
as
  create or replace table PUBLIC.VEHICLE_EXTRAS_NORMALIZED as
  select
    DEALERSHIP,
    MAKE,
    MODEL,
    EXTRA,
    PUBLIC.NORMALIZE_EXTRA(EXTRA) as NORMALIZED_EXTRA
  from PUBLIC.VEHICLE_EXTRAS;

-- Keep this task as a no-op until the Lesson 15 external function is deployed
-- and tested. Replace the select with a query that calls ENRICH_VEHICLE(...).
create or replace task PUBLIC.TASK_L15_OPTIONAL_EXTERNAL_ENRICHMENT
  warehouse = COMPUTE_WH
  after PUBLIC.TASK_L14_NORMALIZE_EXTRAS
as
  select 'external function not scheduled yet' as STATUS;

create or replace task PUBLIC.TASK_L16_REFRESH_CAR_SALES_MART
  warehouse = COMPUTE_WH
  after PUBLIC.TASK_L15_OPTIONAL_EXTERNAL_ENRICHMENT
as
  call MART.REFRESH_CAR_SALES_STAR_SCHEMA();

-- Resume child tasks before the scheduled root task.
alter task PUBLIC.TASK_L16_REFRESH_CAR_SALES_MART resume;
alter task PUBLIC.TASK_L15_OPTIONAL_EXTERNAL_ENRICHMENT resume;
alter task PUBLIC.TASK_L14_NORMALIZE_EXTRAS resume;
alter task PUBLIC.TASK_L13_REFRESH_VEHICLE_PRICES resume;

-- Optional manual smoke run for the root task after review:
-- execute task PUBLIC.TASK_L13_REFRESH_VEHICLE_PRICES;
