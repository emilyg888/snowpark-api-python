-- Convert SNOWPARK_SAMPLE_DATA.PUBLIC.CAR_SALES into a small star-schema model.
-- Grain:
--   FACT_VEHICLE_SALES: one row per source sale + customer + vehicle combination.
--   BRIDGE_VEHICLE_SALE_EXTRAS: one row per fact sale + extra combination.
CREATE OR REPLACE SCHEMA SNOWPARK_SAMPLE_DATA.MART;
USE SCHEMA SNOWPARK_SAMPLE_DATA.MART;

create or replace table DIM_SALES_PERSONS as
with sales_persons as (
select
case
    when SRC:salesperson.id is null then null
    else md5(
        upper(coalesce(SRC:dealership::string, '')) || '|' ||
        coalesce(SRC:salesperson.id::string, '')) 
    end as SALES_PERSON_KEY,
  SRC:salesperson.id::string as SALES_PERSON_ID,
  SRC:salesperson.name::string as SALES_PERSON_NAME,
  SRC:dealership::string as DEALERSHIP
from SNOWPARK_SAMPLE_DATA.PUBLIC.CAR_SALES
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

create or replace table DIM_CUSTOMERS as
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
  from SNOWPARK_SAMPLE_DATA.PUBLIC.CAR_SALES cs,
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

create or replace table DIM_VEHICLES as
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
  from SNOWPARK_SAMPLE_DATA.PUBLIC.CAR_SALES cs,
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


--FACT_VEHICLE_SALES: one row per source sale + customer + vehicle combination.

create or replace table FACT_VEHICLE_SALES as
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
from SNOWPARK_SAMPLE_DATA.PUBLIC.CAR_SALES cs,
  lateral flatten(input => cs.SRC:customer) customer,
  lateral flatten(input => cs.SRC:vehicle) car
where car.value is not null;

create or replace table BRIDGE_VEHICLE_SALE_EXTRAS as
select distinct
  md5(
    cs.SRC::string || '|' ||
    customer.index::string || '|' ||
    vehicle.index::string
  ) as SALE_KEY,
  extra.value::string as EXTRA
from SNOWPARK_SAMPLE_DATA.PUBLIC.CAR_SALES cs,
  lateral flatten(input => cs.SRC:customer) customer,
  lateral flatten(input => cs.SRC:vehicle) vehicle,
  lateral flatten(input => vehicle.value:extras) extra
where extra.value is not null;

-- Check key uniqueness or orphaned fact keys.
select SALES_PERSON_KEY, count(*)
from DIM_SALES_PERSONS
group by SALES_PERSON_KEY
having count(*) > 1;

select CUSTOMER_KEY, count(*)
from DIM_CUSTOMERS
group by CUSTOMER_KEY
having count(*) > 1;

select VEHICLE_KEY, count(*)
from DIM_VEHICLES
group by VEHICLE_KEY
having count(*) > 1;

SELECT DISTINCT cs.SALES_PERSON_KEY FROM FACT_VEHICLE_SALES cs
left join DIM_SALES_PERSONS dsp on cs.SALES_PERSON_KEY = dsp.SALES_PERSON_KEY
where cs.SALES_PERSON_KEY is not null
  and dsp.SALES_PERSON_KEY is null;

SELECT DISTINCT cs.CUSTOMER_KEY FROM FACT_VEHICLE_SALES cs
left join DIM_CUSTOMERS dc on cs.CUSTOMER_KEY = dc.CUSTOMER_KEY
where cs.CUSTOMER_KEY is not null
  and dc.CUSTOMER_KEY is null;

SELECT DISTINCT cs.VEHICLE_KEY FROM FACT_VEHICLE_SALES cs
left join DIM_VEHICLES dv on cs.VEHICLE_KEY = dv.VEHICLE_KEY
where cs.VEHICLE_KEY is not null
  and dv.VEHICLE_KEY is null;



-- Validation: row counts.
select 'DIM_SALES_PERSONS' as TABLE_NAME, count(*) as ROW_COUNT
from DIM_SALES_PERSONS
union all
select 'DIM_CUSTOMERS', count(*)
from DIM_CUSTOMERS
union all
select 'DIM_VEHICLES', count(*)
from DIM_VEHICLES
union all
select 'FACT_VEHICLE_SALES', count(*)
from FACT_VEHICLE_SALES
union all
select 'BRIDGE_VEHICLE_SALE_EXTRAS', count(*)
from BRIDGE_VEHICLE_SALE_EXTRAS;

-- Validation: example analytic query.
select
  v.MAKE,
  v.MODEL,
  sp.SALES_PERSON_NAME,
  count(*) as SALE_COUNT,
  sum(f.SALE_PRICE) as REVENUE
from FACT_VEHICLE_SALES f
join DIM_VEHICLES v
  on f.VEHICLE_KEY = v.VEHICLE_KEY
join DIM_SALES_PERSONS sp
  on f.SALES_PERSON_KEY = sp.SALES_PERSON_KEY
group by v.MAKE, v.MODEL, sp.SALES_PERSON_NAME
order by REVENUE desc;
