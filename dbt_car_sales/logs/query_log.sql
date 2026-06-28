-- created_at: 2026-06-28T06:50:31.741907+00:00
-- finished_at: 2026-06-28T06:50:31.877163+00:00
-- elapsed: 135ms
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01c5589a-0003-4156-0003-2276001fa40e
-- desc: list_relations_in_parallel
SHOW OBJECTS IN SCHEMA "SNOWPARK_SAMPLE_DATA"."MART" LIMIT 10000;
-- created_at: 2026-06-28T06:50:32.572973+00:00
-- finished_at: 2026-06-28T06:50:32.767716+00:00
-- elapsed: 194ms
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb32e
-- desc: execute adapter call
show terse schemas in database SNOWPARK_SAMPLE_DATA
    limit 10000
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:32.801020+00:00
-- finished_at: 2026-06-28T06:50:32.877305+00:00
-- elapsed: 76ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.source_not_null_car_sales_source_CAR_SALES_LOAD_TS.666ac95f14
-- query_id: 01c5589a-0003-4156-0003-2276001fa416
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select LOAD_TS
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES
where LOAD_TS is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.source_not_null_car_sales_source_CAR_SALES_LOAD_TS.666ac95f14", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:33.104667+00:00
-- finished_at: 2026-06-28T06:50:33.194072+00:00
-- elapsed: 89ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.source_not_null_car_sales_source_CAR_SALES_SOURCE_FILE.7fcd23a5c8
-- query_id: 01c5589a-0003-4161-0003-2276001f84b6
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SOURCE_FILE
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES
where SOURCE_FILE is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.source_not_null_car_sales_source_CAR_SALES_SOURCE_FILE.7fcd23a5c8", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:33.008776+00:00
-- finished_at: 2026-06-28T06:50:33.394062+00:00
-- elapsed: 385ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.source_not_null_car_sales_source_CAR_SALES_SOURCE_SALE_KEY.3e8156a41f
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb336
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SOURCE_SALE_KEY
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES
where SOURCE_SALE_KEY is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.source_not_null_car_sales_source_CAR_SALES_SOURCE_SALE_KEY.3e8156a41f", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:33.373974+00:00
-- finished_at: 2026-06-28T06:50:33.464861+00:00
-- elapsed: 90ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.source_not_null_car_sales_source_CAR_SALES_LOAD_BATCH_ID.f5c663e131
-- query_id: 01c5589a-0003-4156-0003-2276001fa41a
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select LOAD_BATCH_ID
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES
where LOAD_BATCH_ID is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.source_not_null_car_sales_source_CAR_SALES_LOAD_BATCH_ID.f5c663e131", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:33.408099+00:00
-- finished_at: 2026-06-28T06:50:33.517556+00:00
-- elapsed: 109ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.source_not_null_car_sales_source_CAR_SALES_SRC.83241cc63c
-- query_id: 01c5589a-0003-4161-0003-2276001f84ba
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SRC
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES
where SRC is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.source_not_null_car_sales_source_CAR_SALES_SRC.83241cc63c", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:33.525065+00:00
-- finished_at: 2026-06-28T06:50:33.646236+00:00
-- elapsed: 121ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.stg_car_sales_base
-- query_id: 01c5589a-0003-4156-0003-2276001fa41e
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "SNOWPARK_SAMPLE_DATA"."STAGING" LIMIT 10000;
-- created_at: 2026-06-28T06:50:33.649354+00:00
-- finished_at: 2026-06-28T06:50:34.127755+00:00
-- elapsed: 478ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.stg_car_sales_base
-- query_id: 01c5589a-0003-4161-0003-2276001f84be
-- desc: execute adapter call
create or replace transient  table SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base
    
    
    
    
    as (with ranked as (
  select
    src,
    source_file,
    source_sale_key,
    load_batch_id,
    load_ts,
    src:date::date as sale_date,
    src:dealership::string as dealership,
    src:salesperson.id::string as sales_person_id,
    src:salesperson.name::string as sales_person_name,
    row_number() over (
      partition by source_sale_key
      order by load_ts desc, source_file desc, load_batch_id desc
    ) as row_rank
  from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES
)

select
  src,
  source_file,
  source_sale_key,
  load_batch_id,
  load_ts,
  sale_date,
  dealership,
  sales_person_id,
  sales_person_name
from ranked
where row_rank = 1
    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.stg_car_sales_base", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:34.135796+00:00
-- finished_at: 2026-06-28T06:50:34.339006+00:00
-- elapsed: 203ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_base_LOAD_TS.8f44a65208
-- query_id: 01c5589a-0003-4161-0003-2276001f84c2
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select LOAD_TS
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base
where LOAD_TS is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_base_LOAD_TS.8f44a65208", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:34.135517+00:00
-- finished_at: 2026-06-28T06:50:34.339006+00:00
-- elapsed: 203ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_base_SOURCE_SALE_KEY.729dca217a
-- query_id: 01c5589a-0003-4156-0003-2276001fa42a
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SOURCE_SALE_KEY
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base
where SOURCE_SALE_KEY is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_base_SOURCE_SALE_KEY.729dca217a", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:34.135817+00:00
-- finished_at: 2026-06-28T06:50:34.339801+00:00
-- elapsed: 203ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_base_LOAD_BATCH_ID.cab49dd70f
-- query_id: 01c5589a-0003-4156-0003-2276001fa426
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select LOAD_BATCH_ID
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base
where LOAD_BATCH_ID is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_base_LOAD_BATCH_ID.cab49dd70f", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:34.135505+00:00
-- finished_at: 2026-06-28T06:50:34.342166+00:00
-- elapsed: 206ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_base_SOURCE_FILE.7ec5bac06d
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb33e
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SOURCE_FILE
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base
where SOURCE_FILE is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_base_SOURCE_FILE.7ec5bac06d", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:34.138055+00:00
-- finished_at: 2026-06-28T06:50:34.360597+00:00
-- elapsed: 222ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_base_SRC.32d8231bd5
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb33a
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SRC
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base
where SRC is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_base_SRC.32d8231bd5", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:34.367674+00:00
-- finished_at: 2026-06-28T06:50:34.536675+00:00
-- elapsed: 169ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_sales_persons
-- query_id: 01c5589a-0003-4161-0003-2276001f84c6
-- desc: execute adapter call
create or replace  temporary view SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons__dbt_tmp
  
  
  
  
  as (
    

select
  sales_person_key,
  sales_person_id,
  sales_person_name,
  dealership,
  source_sale_key,
  source_file,
  load_batch_id,
  load_ts
from (
  select
    case
      when sales_person_id is null then null
      else md5(
        upper(coalesce(dealership, '')) || '|' ||
        coalesce(sales_person_id, '')
      )
    end as sales_person_key,
    sales_person_id,
    sales_person_name,
    dealership,
    source_sale_key,
    source_file,
    load_batch_id,
    load_ts
  from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base
  where sales_person_id is not null

  
    and load_ts >= (
      select coalesce(max(load_ts), '1900-01-01'::timestamp_ntz)
      from SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons
    )
  

qualify row_number() over (
  partition by sales_person_key
  order by load_ts desc, source_file desc, load_batch_id desc
) = 1
)
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_sales_persons", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:34.541692+00:00
-- finished_at: 2026-06-28T06:50:34.620881+00:00
-- elapsed: 79ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_sales_persons
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb342
-- desc: execute adapter call
describe table SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons__dbt_tmp
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_sales_persons", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:34.625911+00:00
-- finished_at: 2026-06-28T06:50:34.684361+00:00
-- elapsed: 58ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_sales_persons
-- query_id: 01c5589a-0003-4156-0003-2276001fa436
-- desc: execute adapter call
describe table SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_sales_persons", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:34.686607+00:00
-- finished_at: 2026-06-28T06:50:34.756660+00:00
-- elapsed: 70ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_sales_persons
-- query_id: 01c5589a-0003-4161-0003-2276001f84ce
-- desc: execute adapter call
describe table SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons__dbt_tmp
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_sales_persons", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:34.366094+00:00
-- finished_at: 2026-06-28T06:50:34.865784+00:00
-- elapsed: 499ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.stg_car_sales_vehicles
-- query_id: 01c5589a-0003-4156-0003-2276001fa432
-- desc: execute adapter call
create or replace transient  table SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_vehicles
    
    
    
    
    as (select
  base.source_file,
  base.source_sale_key,
  base.load_batch_id,
  base.load_ts,
  vehicle.index::number as vehicle_index,
  vehicle.value:make::string as make,
  vehicle.value:model::string as model,
  vehicle.value:year::number as year,
  vehicle.value:price::number as sale_price,
  case
    when vehicle.value:make is null then null
    else md5(
      upper(coalesce(vehicle.value:make::string, '')) || '|' ||
      upper(coalesce(vehicle.value:model::string, '')) || '|' ||
      coalesce(vehicle.value:year::string, '')
    )
  end as vehicle_key
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base base,
  lateral flatten(input => base.src:vehicle) vehicle
where vehicle.value is not null
    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.stg_car_sales_vehicles", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:34.367669+00:00
-- finished_at: 2026-06-28T06:50:34.866302+00:00
-- elapsed: 498ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.stg_car_sales_extras
-- query_id: 01c5589a-0003-4156-0003-2276001fa42e
-- desc: execute adapter call
create or replace transient  table SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_extras
    
    
    
    
    as (select
  base.source_file,
  base.source_sale_key,
  base.load_batch_id,
  base.load_ts,
  vehicle.index::number as vehicle_index,
  extra.index::number as extra_index,
  extra.value::string as extra,
  md5(upper(coalesce(extra.value::string, ''))) as extra_key,
  case
    when vehicle.value:make is null then null
    else md5(
      upper(coalesce(vehicle.value:make::string, '')) || '|' ||
      upper(coalesce(vehicle.value:model::string, '')) || '|' ||
      coalesce(vehicle.value:year::string, '')
    )
  end as vehicle_key
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base base,
  lateral flatten(input => base.src:vehicle) vehicle,
  lateral flatten(input => vehicle.value:extras) extra
where vehicle.value is not null
  and extra.value is not null
    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.stg_car_sales_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:34.366094+00:00
-- finished_at: 2026-06-28T06:50:34.866302+00:00
-- elapsed: 500ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.stg_car_sales_customers
-- query_id: 01c5589a-0003-4161-0003-2276001f84ca
-- desc: execute adapter call
create or replace transient  table SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_customers
    
    
    
    
    as (select
  base.source_file,
  base.source_sale_key,
  base.load_batch_id,
  base.load_ts,
  customer.index::number as customer_index,
  customer.value:name::string as customer_name,
  customer.value:phone::string as customer_phone,
  customer.value:address::string as customer_address,
  case
    when customer.value:name is null then null
    else md5(
      upper(coalesce(customer.value:name::string, '')) || '|' ||
      coalesce(customer.value:phone::string, '') || '|' ||
      upper(coalesce(customer.value:address::string, ''))
    )
  end as customer_key
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base base,
  lateral flatten(input => base.src:customer) customer
where customer.value is not null
    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.stg_car_sales_customers", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:34.758256+00:00
-- finished_at: 2026-06-28T06:50:35.013063+00:00
-- elapsed: 254ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_sales_persons
-- query_id: 01c5589a-0003-4161-0003-2276001f84d6
-- desc: execute adapter call
describe table "SNOWPARK_SAMPLE_DATA"."MART"."DIM_SALES_PERSONS"
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_sales_persons", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:34.875964+00:00
-- finished_at: 2026-06-28T06:50:35.025164+00:00
-- elapsed: 149ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_customers_CUSTOMER_INDEX.7cf8458f0a
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb346
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select CUSTOMER_INDEX
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_customers
where CUSTOMER_INDEX is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_customers_CUSTOMER_INDEX.7cf8458f0a", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:34.877314+00:00
-- finished_at: 2026-06-28T06:50:35.025931+00:00
-- elapsed: 148ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_LOAD_BATCH_ID.276a69f99e
-- query_id: 01c5589a-0003-4161-0003-2276001f84d2
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select LOAD_BATCH_ID
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_extras
where LOAD_BATCH_ID is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_extras_LOAD_BATCH_ID.276a69f99e", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:34.874237+00:00
-- finished_at: 2026-06-28T06:50:35.026614+00:00
-- elapsed: 152ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_customers_SOURCE_SALE_KEY.451f45689f
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb34a
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SOURCE_SALE_KEY
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_customers
where SOURCE_SALE_KEY is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_customers_SOURCE_SALE_KEY.451f45689f", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:34.878001+00:00
-- finished_at: 2026-06-28T06:50:35.035048+00:00
-- elapsed: 157ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_vehicles_SOURCE_FILE.2248ce8d63
-- query_id: 01c5589a-0003-4156-0003-2276001fa43a
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SOURCE_FILE
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_vehicles
where SOURCE_FILE is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_vehicles_SOURCE_FILE.2248ce8d63", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.019395+00:00
-- finished_at: 2026-06-28T06:50:35.097715+00:00
-- elapsed: 78ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_sales_persons
-- query_id: 01c5589a-0003-4156-0003-2276001fa43e
-- desc: execute adapter call
-- back compat for old kwarg name
  
  begin
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_sales_persons", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.115210+00:00
-- finished_at: 2026-06-28T06:50:35.211633+00:00
-- elapsed: 96ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_SOURCE_FILE.2573395859
-- query_id: 01c5589a-0003-4161-0003-2276001f84de
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SOURCE_FILE
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_extras
where SOURCE_FILE is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_extras_SOURCE_FILE.2573395859", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.090065+00:00
-- finished_at: 2026-06-28T06:50:35.218862+00:00
-- elapsed: 128ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_customers_CUSTOMER_KEY.3eb6986a43
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb35a
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select CUSTOMER_KEY
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_customers
where CUSTOMER_KEY is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_customers_CUSTOMER_KEY.3eb6986a43", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.131333+00:00
-- finished_at: 2026-06-28T06:50:35.264354+00:00
-- elapsed: 133ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_vehicles_VEHICLE_INDEX.1e873ec374
-- query_id: 01c5589a-0003-4161-0003-2276001f84e2
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select VEHICLE_INDEX
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_vehicles
where VEHICLE_INDEX is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_vehicles_VEHICLE_INDEX.1e873ec374", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.093598+00:00
-- finished_at: 2026-06-28T06:50:35.277417+00:00
-- elapsed: 183ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_EXTRA.85f65ffa3f
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb34e
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select EXTRA
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_extras
where EXTRA is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_extras_EXTRA.85f65ffa3f", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.093707+00:00
-- finished_at: 2026-06-28T06:50:35.278193+00:00
-- elapsed: 184ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_LOAD_TS.b1550d2520
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb352
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select LOAD_TS
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_extras
where LOAD_TS is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_extras_LOAD_TS.b1550d2520", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.179860+00:00
-- finished_at: 2026-06-28T06:50:35.281841+00:00
-- elapsed: 101ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_VEHICLE_KEY.b41d0a3b48
-- query_id: 01c5589a-0003-4161-0003-2276001f84ea
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select VEHICLE_KEY
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_extras
where VEHICLE_KEY is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_extras_VEHICLE_KEY.b41d0a3b48", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.093625+00:00
-- finished_at: 2026-06-28T06:50:35.282951+00:00
-- elapsed: 189ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_VEHICLE_INDEX.d5ee8494fd
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb35e
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select VEHICLE_INDEX
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_extras
where VEHICLE_INDEX is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_extras_VEHICLE_INDEX.d5ee8494fd", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.179848+00:00
-- finished_at: 2026-06-28T06:50:35.289857+00:00
-- elapsed: 110ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_vehicles_SOURCE_SALE_KEY.2280a8a80b
-- query_id: 01c5589a-0003-4161-0003-2276001f84e6
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SOURCE_SALE_KEY
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_vehicles
where SOURCE_SALE_KEY is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_vehicles_SOURCE_SALE_KEY.2280a8a80b", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.153243+00:00
-- finished_at: 2026-06-28T06:50:35.291078+00:00
-- elapsed: 137ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_customers_SOURCE_FILE.e89afa720b
-- query_id: 01c5589a-0003-4156-0003-2276001fa44a
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SOURCE_FILE
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_customers
where SOURCE_FILE is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_customers_SOURCE_FILE.e89afa720b", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.155296+00:00
-- finished_at: 2026-06-28T06:50:35.292001+00:00
-- elapsed: 136ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_customers_LOAD_TS.addc1af425
-- query_id: 01c5589a-0003-4156-0003-2276001fa44e
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select LOAD_TS
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_customers
where LOAD_TS is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_customers_LOAD_TS.addc1af425", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.093681+00:00
-- finished_at: 2026-06-28T06:50:35.292038+00:00
-- elapsed: 198ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_EXTRA_INDEX.2140ff5490
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb356
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select EXTRA_INDEX
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_extras
where EXTRA_INDEX is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_extras_EXTRA_INDEX.2140ff5490", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.246241+00:00
-- finished_at: 2026-06-28T06:50:35.389123+00:00
-- elapsed: 142ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_vehicles_VEHICLE_KEY.e79c86769d
-- query_id: 01c5589a-0003-4156-0003-2276001fa452
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select VEHICLE_KEY
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_vehicles
where VEHICLE_KEY is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_vehicles_VEHICLE_KEY.e79c86769d", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.153243+00:00
-- finished_at: 2026-06-28T06:50:35.389957+00:00
-- elapsed: 236ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_SOURCE_SALE_KEY.ca8b3cb533
-- query_id: 01c5589a-0003-4156-0003-2276001fa446
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SOURCE_SALE_KEY
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_extras
where SOURCE_SALE_KEY is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_extras_SOURCE_SALE_KEY.ca8b3cb533", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.140534+00:00
-- finished_at: 2026-06-28T06:50:35.389961+00:00
-- elapsed: 249ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_customers_LOAD_BATCH_ID.742c1dbb5e
-- query_id: 01c5589a-0003-4156-0003-2276001fa442
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select LOAD_BATCH_ID
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_customers
where LOAD_BATCH_ID is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_customers_LOAD_BATCH_ID.742c1dbb5e", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.196596+00:00
-- finished_at: 2026-06-28T06:50:35.389961+00:00
-- elapsed: 193ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_EXTRA_KEY.ebc5eb0c4a
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb362
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select EXTRA_KEY
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_extras
where EXTRA_KEY is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_extras_EXTRA_KEY.ebc5eb0c4a", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.283512+00:00
-- finished_at: 2026-06-28T06:50:35.389958+00:00
-- elapsed: 106ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_vehicles_LOAD_TS.09d82f5b2e
-- query_id: 01c5589a-0003-4161-0003-2276001f84ee
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select LOAD_TS
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_vehicles
where LOAD_TS is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_vehicles_LOAD_TS.09d82f5b2e", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.246206+00:00
-- finished_at: 2026-06-28T06:50:35.440965+00:00
-- elapsed: 194ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_vehicles_LOAD_BATCH_ID.d76db36e5f
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb366
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select LOAD_BATCH_ID
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_vehicles
where LOAD_BATCH_ID is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_stg_car_sales_vehicles_LOAD_BATCH_ID.d76db36e5f", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.097770+00:00
-- finished_at: 2026-06-28T06:50:35.464937+00:00
-- elapsed: 367ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_sales_persons
-- query_id: 01c5589a-0003-4161-0003-2276001f84da
-- desc: execute adapter call

    
        
            
            
            
            
        
    

    

    merge into SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons as DBT_INTERNAL_DEST
        using SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.sales_person_key = DBT_INTERNAL_DEST.sales_person_key))

    
    when matched then update set
        "SALES_PERSON_KEY" = DBT_INTERNAL_SOURCE."SALES_PERSON_KEY","SALES_PERSON_ID" = DBT_INTERNAL_SOURCE."SALES_PERSON_ID","SALES_PERSON_NAME" = DBT_INTERNAL_SOURCE."SALES_PERSON_NAME","DEALERSHIP" = DBT_INTERNAL_SOURCE."DEALERSHIP","SOURCE_SALE_KEY" = DBT_INTERNAL_SOURCE."SOURCE_SALE_KEY","SOURCE_FILE" = DBT_INTERNAL_SOURCE."SOURCE_FILE","LOAD_BATCH_ID" = DBT_INTERNAL_SOURCE."LOAD_BATCH_ID","LOAD_TS" = DBT_INTERNAL_SOURCE."LOAD_TS"
    

    when not matched then insert
        ("SALES_PERSON_KEY", "SALES_PERSON_ID", "SALES_PERSON_NAME", "DEALERSHIP", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")
    values
        ("SALES_PERSON_KEY", "SALES_PERSON_ID", "SALES_PERSON_NAME", "DEALERSHIP", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")


/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_sales_persons", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.393359+00:00
-- finished_at: 2026-06-28T06:50:35.573964+00:00
-- elapsed: 180ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_customers
-- query_id: 01c5589a-0003-4156-0003-2276001fa456
-- desc: execute adapter call
create or replace  temporary view SNOWPARK_SAMPLE_DATA.MART.dim_customers__dbt_tmp
  
  
  
  
  as (
    

select
  customer_key,
  customer_name,
  customer_phone,
  customer_address,
  source_sale_key,
  source_file,
  load_batch_id,
  load_ts
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_customers
where customer_key is not null


  and load_ts >= (
    select coalesce(max(load_ts), '1900-01-01'::timestamp_ntz)
    from SNOWPARK_SAMPLE_DATA.MART.dim_customers
  )


qualify row_number() over (
  partition by customer_key
  order by load_ts desc, source_file desc, load_batch_id desc
) = 1
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_customers", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.393359+00:00
-- finished_at: 2026-06-28T06:50:35.614219+00:00
-- elapsed: 220ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_extras
-- query_id: 01c5589a-0003-4156-0003-2276001fa45a
-- desc: execute adapter call
create or replace  temporary view SNOWPARK_SAMPLE_DATA.MART.dim_extras__dbt_tmp
  
  
  
  
  as (
    

select
  extra_key,
  extra,
  source_sale_key,
  source_file,
  load_batch_id,
  load_ts
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_extras
where extra_key is not null


  and load_ts >= (
    select coalesce(max(load_ts), '1900-01-01'::timestamp_ntz)
    from SNOWPARK_SAMPLE_DATA.MART.dim_extras
  )


qualify row_number() over (
  partition by extra_key
  order by load_ts desc, source_file desc, load_batch_id desc
) = 1
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.444901+00:00
-- finished_at: 2026-06-28T06:50:35.650954+00:00
-- elapsed: 206ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_vehicles
-- query_id: 01c5589a-0003-4156-0003-2276001fa45e
-- desc: execute adapter call
create or replace  temporary view SNOWPARK_SAMPLE_DATA.MART.dim_vehicles__dbt_tmp
  
  
  
  
  as (
    


select
  vehicle_key,
  make,
  model,
  year,
  source_sale_key,
  source_file,
  load_batch_id,
  load_ts
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_vehicles
where vehicle_key is not null


  and load_ts >= (
    select coalesce(max(load_ts), '1900-01-01'::timestamp_ntz)
    from SNOWPARK_SAMPLE_DATA.MART.dim_vehicles
  )


qualify row_number() over (
  partition by vehicle_key
  order by load_ts desc, source_file desc, load_batch_id desc
) = 1
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_vehicles", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.575366+00:00
-- finished_at: 2026-06-28T06:50:35.652377+00:00
-- elapsed: 77ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_customers
-- query_id: 01c5589a-0003-4161-0003-2276001f84f2
-- desc: execute adapter call
describe table SNOWPARK_SAMPLE_DATA.MART.dim_customers__dbt_tmp
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_customers", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.445318+00:00
-- finished_at: 2026-06-28T06:50:35.668640+00:00
-- elapsed: 223ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.bridge_vehicle_sale_extras
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb36a
-- desc: execute adapter call
create or replace  temporary view SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras__dbt_tmp
  
  
  
  
  as (
    

select distinct
  md5(
    base.src::string || '|' ||
    customer.customer_index::string || '|' ||
    vehicle.vehicle_index::string
  ) as sale_key,
  extra.extra_key,
  base.source_sale_key,
  base.source_file,
  base.load_batch_id,
  base.load_ts
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base as base
inner join SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_customers as customer
  on base.source_sale_key = customer.source_sale_key
inner join SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_vehicles as vehicle
  on base.source_sale_key = vehicle.source_sale_key
inner join SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_extras as extra
  on vehicle.source_sale_key = extra.source_sale_key
 and vehicle.vehicle_index = extra.vehicle_index
where extra.extra_key is not null


and base.load_ts >= (
  select coalesce(max(load_ts), '1900-01-01'::timestamp_ntz)
  from SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras
)

  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.bridge_vehicle_sale_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.445401+00:00
-- finished_at: 2026-06-28T06:50:35.686067+00:00
-- elapsed: 240ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.fact_vehicle_sales
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb36e
-- desc: execute adapter call
create or replace  temporary view SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales__dbt_tmp
  
  
  
  
  as (
    

select
  md5(
    base.src::string || '|' ||
    customer.customer_index::string || '|' ||
    vehicle.vehicle_index::string
  ) as sale_key,
  base.sale_date,
  base.dealership,
  case
    when base.sales_person_id is null then null
    else md5(
      upper(coalesce(base.dealership, '')) || '|' ||
      coalesce(base.sales_person_id, '')
    )
  end as sales_person_key,
  customer.customer_key,
  vehicle.vehicle_key,
  vehicle.sale_price,
  1 as vehicle_count,
  base.source_sale_key,
  base.source_file,
  base.load_batch_id,
  base.load_ts
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base as base
inner join SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_customers as customer
  on base.source_sale_key = customer.source_sale_key
inner join SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_vehicles as vehicle
  on base.source_sale_key = vehicle.source_sale_key


where base.load_ts >= (
  select coalesce(max(load_ts), '1900-01-01'::timestamp_ntz)
  from SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
)

  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.fact_vehicle_sales", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.615739+00:00
-- finished_at: 2026-06-28T06:50:35.686880+00:00
-- elapsed: 71ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_extras
-- query_id: 01c5589a-0003-4161-0003-2276001f84f6
-- desc: execute adapter call
describe table SNOWPARK_SAMPLE_DATA.MART.dim_extras__dbt_tmp
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.465151+00:00
-- finished_at: 2026-06-28T06:50:35.702432+00:00
-- elapsed: 237ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_sales_persons
-- query_id: 01c5589a-0003-4156-0003-2276001fa462
-- desc: execute adapter call

    commit
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_sales_persons", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.652204+00:00
-- finished_at: 2026-06-28T06:50:35.715307+00:00
-- elapsed: 63ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_vehicles
-- query_id: 01c5589a-0003-4161-0003-2276001f84fa
-- desc: execute adapter call
describe table SNOWPARK_SAMPLE_DATA.MART.dim_vehicles__dbt_tmp
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_vehicles", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.653508+00:00
-- finished_at: 2026-06-28T06:50:35.716936+00:00
-- elapsed: 63ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_customers
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb372
-- desc: execute adapter call
describe table SNOWPARK_SAMPLE_DATA.MART.dim_customers
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_customers", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.670374+00:00
-- finished_at: 2026-06-28T06:50:35.738392+00:00
-- elapsed: 68ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.bridge_vehicle_sale_extras
-- query_id: 01c5589a-0003-4156-0003-2276001fa466
-- desc: execute adapter call
describe table SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras__dbt_tmp
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.bridge_vehicle_sale_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.687560+00:00
-- finished_at: 2026-06-28T06:50:35.754355+00:00
-- elapsed: 66ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.fact_vehicle_sales
-- query_id: 01c5589a-0003-4156-0003-2276001fa46a
-- desc: execute adapter call
describe table SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales__dbt_tmp
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.fact_vehicle_sales", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.687966+00:00
-- finished_at: 2026-06-28T06:50:35.756398+00:00
-- elapsed: 68ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_extras
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb376
-- desc: execute adapter call
describe table SNOWPARK_SAMPLE_DATA.MART.dim_extras
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.716409+00:00
-- finished_at: 2026-06-28T06:50:35.784101+00:00
-- elapsed: 67ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_vehicles
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb37a
-- desc: execute adapter call
describe table SNOWPARK_SAMPLE_DATA.MART.dim_vehicles
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_vehicles", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.704231+00:00
-- finished_at: 2026-06-28T06:50:35.798021+00:00
-- elapsed: 93ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_sales_persons
-- query_id: 01c5589a-0003-4161-0003-2276001f84fe
-- desc: execute adapter call
drop view if exists SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons__dbt_tmp cascade
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_sales_persons", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.755975+00:00
-- finished_at: 2026-06-28T06:50:35.813689+00:00
-- elapsed: 57ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.fact_vehicle_sales
-- query_id: 01c5589a-0003-4161-0003-2276001f8502
-- desc: execute adapter call
describe table SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.fact_vehicle_sales", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.739925+00:00
-- finished_at: 2026-06-28T06:50:35.814635+00:00
-- elapsed: 74ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.bridge_vehicle_sale_extras
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb37e
-- desc: execute adapter call
describe table SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.bridge_vehicle_sale_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.757949+00:00
-- finished_at: 2026-06-28T06:50:35.912955+00:00
-- elapsed: 155ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_extras
-- query_id: 01c5589a-0003-4156-0003-2276001fa46e
-- desc: execute adapter call
describe table SNOWPARK_SAMPLE_DATA.MART.dim_extras__dbt_tmp
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.785951+00:00
-- finished_at: 2026-06-28T06:50:35.913598+00:00
-- elapsed: 127ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_vehicles
-- query_id: 01c5589a-0003-4156-0003-2276001fa472
-- desc: execute adapter call
describe table SNOWPARK_SAMPLE_DATA.MART.dim_vehicles__dbt_tmp
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_vehicles", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.806031+00:00
-- finished_at: 2026-06-28T06:50:35.922760+00:00
-- elapsed: 116ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.unique_dim_sales_persons_SALES_PERSON_KEY.73cdbd55d5
-- query_id: 01c5589a-0003-4161-0003-2276001f8506
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    SALES_PERSON_KEY as unique_field,
    count(*) as n_records

from SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons
where SALES_PERSON_KEY is not null
group by SALES_PERSON_KEY
having count(*) > 1



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.unique_dim_sales_persons_SALES_PERSON_KEY.73cdbd55d5", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.803850+00:00
-- finished_at: 2026-06-28T06:50:35.928220+00:00
-- elapsed: 124ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_dim_sales_persons_SALES_PERSON_KEY.85f80c32c8
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb382
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SALES_PERSON_KEY
from SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons
where SALES_PERSON_KEY is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_dim_sales_persons_SALES_PERSON_KEY.85f80c32c8", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.803859+00:00
-- finished_at: 2026-06-28T06:50:35.932819+00:00
-- elapsed: 128ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_dim_sales_persons_SALES_PERSON_ID.2bfa32c62d
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb386
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SALES_PERSON_ID
from SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons
where SALES_PERSON_ID is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_dim_sales_persons_SALES_PERSON_ID.2bfa32c62d", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.914636+00:00
-- finished_at: 2026-06-28T06:50:35.967355+00:00
-- elapsed: 52ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_extras
-- query_id: 01c5589a-0003-4161-0003-2276001f850a
-- desc: execute adapter call
describe table "SNOWPARK_SAMPLE_DATA"."MART"."DIM_EXTRAS"
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.815606+00:00
-- finished_at: 2026-06-28T06:50:36.020897+00:00
-- elapsed: 205ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.fact_vehicle_sales
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb38a
-- desc: execute adapter call
describe table SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales__dbt_tmp
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.fact_vehicle_sales", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:36.022823+00:00
-- finished_at: 2026-06-28T06:50:36.072270+00:00
-- elapsed: 49ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.fact_vehicle_sales
-- query_id: 01c5589a-0003-4156-0003-2276001fa476
-- desc: execute adapter call
describe table "SNOWPARK_SAMPLE_DATA"."MART"."FACT_VEHICLE_SALES"
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.fact_vehicle_sales", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.972196+00:00
-- finished_at: 2026-06-28T06:50:36.074553+00:00
-- elapsed: 102ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_extras
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb38e
-- desc: execute adapter call
-- back compat for old kwarg name
  
  begin
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:36.079538+00:00
-- finished_at: 2026-06-28T06:50:36.156519+00:00
-- elapsed: 76ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.fact_vehicle_sales
-- query_id: 01c5589a-0003-4161-0003-2276001f8512
-- desc: execute adapter call
-- back compat for old kwarg name
  
  begin
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.fact_vehicle_sales", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:36.074676+00:00
-- finished_at: 2026-06-28T06:50:36.441170+00:00
-- elapsed: 366ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_extras
-- query_id: 01c5589a-0003-4161-0003-2276001f850e
-- desc: execute adapter call

    
        
            
            
            
            
        
    

    

    merge into SNOWPARK_SAMPLE_DATA.MART.dim_extras as DBT_INTERNAL_DEST
        using SNOWPARK_SAMPLE_DATA.MART.dim_extras__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.extra_key = DBT_INTERNAL_DEST.extra_key))

    
    when matched then update set
        "EXTRA_KEY" = DBT_INTERNAL_SOURCE."EXTRA_KEY","EXTRA" = DBT_INTERNAL_SOURCE."EXTRA","SOURCE_SALE_KEY" = DBT_INTERNAL_SOURCE."SOURCE_SALE_KEY","SOURCE_FILE" = DBT_INTERNAL_SOURCE."SOURCE_FILE","LOAD_BATCH_ID" = DBT_INTERNAL_SOURCE."LOAD_BATCH_ID","LOAD_TS" = DBT_INTERNAL_SOURCE."LOAD_TS"
    

    when not matched then insert
        ("EXTRA_KEY", "EXTRA", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")
    values
        ("EXTRA_KEY", "EXTRA", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")


/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:36.441430+00:00
-- finished_at: 2026-06-28T06:50:36.632157+00:00
-- elapsed: 190ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_extras
-- query_id: 01c5589a-0003-4156-0003-2276001fa47a
-- desc: execute adapter call

    commit
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:36.634361+00:00
-- finished_at: 2026-06-28T06:50:36.730819+00:00
-- elapsed: 96ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_extras
-- query_id: 01c5589a-0003-4161-0003-2276001f8516
-- desc: execute adapter call
drop view if exists SNOWPARK_SAMPLE_DATA.MART.dim_extras__dbt_tmp cascade
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:36.156789+00:00
-- finished_at: 2026-06-28T06:50:36.765709+00:00
-- elapsed: 608ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.fact_vehicle_sales
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb392
-- desc: execute adapter call

    
        
            
            
            
            
        
    

    

    merge into SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales as DBT_INTERNAL_DEST
        using SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.sale_key = DBT_INTERNAL_DEST.sale_key))

    
    when matched then update set
        "SALE_KEY" = DBT_INTERNAL_SOURCE."SALE_KEY","SALE_DATE" = DBT_INTERNAL_SOURCE."SALE_DATE","DEALERSHIP" = DBT_INTERNAL_SOURCE."DEALERSHIP","SALES_PERSON_KEY" = DBT_INTERNAL_SOURCE."SALES_PERSON_KEY","CUSTOMER_KEY" = DBT_INTERNAL_SOURCE."CUSTOMER_KEY","VEHICLE_KEY" = DBT_INTERNAL_SOURCE."VEHICLE_KEY","SALE_PRICE" = DBT_INTERNAL_SOURCE."SALE_PRICE","VEHICLE_COUNT" = DBT_INTERNAL_SOURCE."VEHICLE_COUNT","SOURCE_SALE_KEY" = DBT_INTERNAL_SOURCE."SOURCE_SALE_KEY","SOURCE_FILE" = DBT_INTERNAL_SOURCE."SOURCE_FILE","LOAD_BATCH_ID" = DBT_INTERNAL_SOURCE."LOAD_BATCH_ID","LOAD_TS" = DBT_INTERNAL_SOURCE."LOAD_TS"
    

    when not matched then insert
        ("SALE_KEY", "SALE_DATE", "DEALERSHIP", "SALES_PERSON_KEY", "CUSTOMER_KEY", "VEHICLE_KEY", "SALE_PRICE", "VEHICLE_COUNT", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")
    values
        ("SALE_KEY", "SALE_DATE", "DEALERSHIP", "SALES_PERSON_KEY", "CUSTOMER_KEY", "VEHICLE_KEY", "SALE_PRICE", "VEHICLE_COUNT", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")


/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.fact_vehicle_sales", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:36.737337+00:00
-- finished_at: 2026-06-28T06:50:36.850951+00:00
-- elapsed: 113ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_dim_extras_EXTRA.43db166cd4
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb396
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select EXTRA
from SNOWPARK_SAMPLE_DATA.MART.dim_extras
where EXTRA is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_dim_extras_EXTRA.43db166cd4", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:36.737336+00:00
-- finished_at: 2026-06-28T06:50:36.853656+00:00
-- elapsed: 116ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_dim_extras_EXTRA_KEY.f8de94e0a0
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb39a
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select EXTRA_KEY
from SNOWPARK_SAMPLE_DATA.MART.dim_extras
where EXTRA_KEY is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_dim_extras_EXTRA_KEY.f8de94e0a0", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:36.737361+00:00
-- finished_at: 2026-06-28T06:50:36.957641+00:00
-- elapsed: 220ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.unique_dim_extras_EXTRA_KEY.49ac0f8c85
-- query_id: 01c5589a-0003-4156-0003-2276001fa47e
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    EXTRA_KEY as unique_field,
    count(*) as n_records

from SNOWPARK_SAMPLE_DATA.MART.dim_extras
where EXTRA_KEY is not null
group by EXTRA_KEY
having count(*) > 1



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.unique_dim_extras_EXTRA_KEY.49ac0f8c85", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:36.765885+00:00
-- finished_at: 2026-06-28T06:50:36.975820+00:00
-- elapsed: 209ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.fact_vehicle_sales
-- query_id: 01c5589a-0003-4161-0003-2276001f851a
-- desc: execute adapter call

    commit
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.fact_vehicle_sales", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:36.977803+00:00
-- finished_at: 2026-06-28T06:50:37.101197+00:00
-- elapsed: 123ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.fact_vehicle_sales
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb39e
-- desc: execute adapter call
drop view if exists SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales__dbt_tmp cascade
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.fact_vehicle_sales", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:37.108634+00:00
-- finished_at: 2026-06-28T06:50:37.233881+00:00
-- elapsed: 125ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_fact_vehicle_sales_CUSTOMER_KEY.02c6f1fa80
-- query_id: 01c5589a-0003-4156-0003-2276001fa482
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select CUSTOMER_KEY
from SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
where CUSTOMER_KEY is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_fact_vehicle_sales_CUSTOMER_KEY.02c6f1fa80", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:37.108532+00:00
-- finished_at: 2026-06-28T06:50:37.239143+00:00
-- elapsed: 130ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_fact_vehicle_sales_VEHICLE_KEY.cb670c20b2
-- query_id: 01c5589a-0003-4161-0003-2276001f851e
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select VEHICLE_KEY
from SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
where VEHICLE_KEY is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_fact_vehicle_sales_VEHICLE_KEY.cb670c20b2", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:37.108855+00:00
-- finished_at: 2026-06-28T06:50:37.239991+00:00
-- elapsed: 131ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_fact_vehicle_sales_SALE_KEY.1433a01831
-- query_id: 01c5589a-0003-4156-0003-2276001fa48a
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SALE_KEY
from SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
where SALE_KEY is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_fact_vehicle_sales_SALE_KEY.1433a01831", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:37.108587+00:00
-- finished_at: 2026-06-28T06:50:37.240634+00:00
-- elapsed: 132ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_fact_vehicle_sales_SALE_PRICE.5f4aed79ce
-- query_id: 01c5589a-0003-4156-0003-2276001fa486
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SALE_PRICE
from SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
where SALE_PRICE is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_fact_vehicle_sales_SALE_PRICE.5f4aed79ce", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:37.108867+00:00
-- finished_at: 2026-06-28T06:50:37.252151+00:00
-- elapsed: 143ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.unique_fact_vehicle_sales_SALE_KEY.0fcdc48eca
-- query_id: 01c5589a-0003-4156-0003-2276001fa48e
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    SALE_KEY as unique_field,
    count(*) as n_records

from SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
where SALE_KEY is not null
group by SALE_KEY
having count(*) > 1



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.unique_fact_vehicle_sales_SALE_KEY.0fcdc48eca", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:37.111096+00:00
-- finished_at: 2026-06-28T06:50:37.309326+00:00
-- elapsed: 198ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.relationships_fact_vehicle_sales_SALES_PERSON_KEY__sales_person_key__ref_dim_sales_persons_.bb75a07b09
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb3a2
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select SALES_PERSON_KEY as from_field
    from SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
    where SALES_PERSON_KEY is not null
),

parent as (
    select sales_person_key as to_field
    from SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.relationships_fact_vehicle_sales_SALES_PERSON_KEY__sales_person_key__ref_dim_sales_persons_.bb75a07b09", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.914746+00:00
-- finished_at: 2026-06-28T06:50:37.852764+00:00
-- elapsed: 1.9s
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_vehicles
-- query_id: 01c5589a-0003-4161-0003-2276001f8522
-- desc: execute adapter call
describe table "SNOWPARK_SAMPLE_DATA"."MART"."DIM_VEHICLES"
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_vehicles", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.718184+00:00
-- finished_at: 2026-06-28T06:50:37.856485+00:00
-- elapsed: 2.1s
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_customers
-- query_id: 01c5589a-0003-4161-0003-2276001f8526
-- desc: execute adapter call
describe table SNOWPARK_SAMPLE_DATA.MART.dim_customers__dbt_tmp
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_customers", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:35.816093+00:00
-- finished_at: 2026-06-28T06:50:37.893261+00:00
-- elapsed: 2.1s
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.bridge_vehicle_sale_extras
-- query_id: 01c5589a-0003-4161-0003-2276001f852a
-- desc: execute adapter call
describe table SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras__dbt_tmp
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.bridge_vehicle_sale_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:37.857560+00:00
-- finished_at: 2026-06-28T06:50:38.010151+00:00
-- elapsed: 152ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_customers
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb3aa
-- desc: execute adapter call
describe table "SNOWPARK_SAMPLE_DATA"."MART"."DIM_CUSTOMERS"
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_customers", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:37.858038+00:00
-- finished_at: 2026-06-28T06:50:38.010151+00:00
-- elapsed: 152ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_vehicles
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb3a6
-- desc: execute adapter call
-- back compat for old kwarg name
  
  begin
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_vehicles", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:37.895020+00:00
-- finished_at: 2026-06-28T06:50:38.011119+00:00
-- elapsed: 116ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.bridge_vehicle_sale_extras
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb3ae
-- desc: execute adapter call
describe table "SNOWPARK_SAMPLE_DATA"."MART"."BRIDGE_VEHICLE_SALE_EXTRAS"
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.bridge_vehicle_sale_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:38.015701+00:00
-- finished_at: 2026-06-28T06:50:38.414668+00:00
-- elapsed: 398ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_customers
-- query_id: 01c5589a-0003-4156-0003-2276001fa496
-- desc: execute adapter call
-- back compat for old kwarg name
  
  begin
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_customers", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:38.015721+00:00
-- finished_at: 2026-06-28T06:50:38.415476+00:00
-- elapsed: 399ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.bridge_vehicle_sale_extras
-- query_id: 01c5589a-0003-4156-0003-2276001fa492
-- desc: execute adapter call
-- back compat for old kwarg name
  
  begin
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.bridge_vehicle_sale_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:38.010516+00:00
-- finished_at: 2026-06-28T06:50:38.821334+00:00
-- elapsed: 810ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_vehicles
-- query_id: 01c5589a-0003-4156-0003-2276001fa49a
-- desc: execute adapter call

    
        
            
            
            
            
        
    

    

    merge into SNOWPARK_SAMPLE_DATA.MART.dim_vehicles as DBT_INTERNAL_DEST
        using SNOWPARK_SAMPLE_DATA.MART.dim_vehicles__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.vehicle_key = DBT_INTERNAL_DEST.vehicle_key))

    
    when matched then update set
        "VEHICLE_KEY" = DBT_INTERNAL_SOURCE."VEHICLE_KEY","MAKE" = DBT_INTERNAL_SOURCE."MAKE","MODEL" = DBT_INTERNAL_SOURCE."MODEL","YEAR" = DBT_INTERNAL_SOURCE."YEAR","SOURCE_SALE_KEY" = DBT_INTERNAL_SOURCE."SOURCE_SALE_KEY","SOURCE_FILE" = DBT_INTERNAL_SOURCE."SOURCE_FILE","LOAD_BATCH_ID" = DBT_INTERNAL_SOURCE."LOAD_BATCH_ID","LOAD_TS" = DBT_INTERNAL_SOURCE."LOAD_TS"
    

    when not matched then insert
        ("VEHICLE_KEY", "MAKE", "MODEL", "YEAR", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")
    values
        ("VEHICLE_KEY", "MAKE", "MODEL", "YEAR", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")


/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_vehicles", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:38.414955+00:00
-- finished_at: 2026-06-28T06:50:38.823269+00:00
-- elapsed: 408ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_customers
-- query_id: 01c5589a-0003-4161-0003-2276001f852e
-- desc: execute adapter call

    
        
            
            
            
            
        
    

    

    merge into SNOWPARK_SAMPLE_DATA.MART.dim_customers as DBT_INTERNAL_DEST
        using SNOWPARK_SAMPLE_DATA.MART.dim_customers__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.customer_key = DBT_INTERNAL_DEST.customer_key))

    
    when matched then update set
        "CUSTOMER_KEY" = DBT_INTERNAL_SOURCE."CUSTOMER_KEY","CUSTOMER_NAME" = DBT_INTERNAL_SOURCE."CUSTOMER_NAME","CUSTOMER_PHONE" = DBT_INTERNAL_SOURCE."CUSTOMER_PHONE","CUSTOMER_ADDRESS" = DBT_INTERNAL_SOURCE."CUSTOMER_ADDRESS","SOURCE_SALE_KEY" = DBT_INTERNAL_SOURCE."SOURCE_SALE_KEY","SOURCE_FILE" = DBT_INTERNAL_SOURCE."SOURCE_FILE","LOAD_BATCH_ID" = DBT_INTERNAL_SOURCE."LOAD_BATCH_ID","LOAD_TS" = DBT_INTERNAL_SOURCE."LOAD_TS"
    

    when not matched then insert
        ("CUSTOMER_KEY", "CUSTOMER_NAME", "CUSTOMER_PHONE", "CUSTOMER_ADDRESS", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")
    values
        ("CUSTOMER_KEY", "CUSTOMER_NAME", "CUSTOMER_PHONE", "CUSTOMER_ADDRESS", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")


/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_customers", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:38.415613+00:00
-- finished_at: 2026-06-28T06:50:38.914773+00:00
-- elapsed: 499ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.bridge_vehicle_sale_extras
-- query_id: 01c5589a-0003-4161-0003-2276001f8532
-- desc: execute adapter call

    
        
            
                
                
            
                
                
            
        
    

    

    merge into SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras as DBT_INTERNAL_DEST
        using SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras__dbt_tmp as DBT_INTERNAL_SOURCE
        on (
                    DBT_INTERNAL_SOURCE.sale_key = DBT_INTERNAL_DEST.sale_key
                ) and (
                    DBT_INTERNAL_SOURCE.extra_key = DBT_INTERNAL_DEST.extra_key
                )

    
    when matched then update set
        "SALE_KEY" = DBT_INTERNAL_SOURCE."SALE_KEY","EXTRA_KEY" = DBT_INTERNAL_SOURCE."EXTRA_KEY","SOURCE_SALE_KEY" = DBT_INTERNAL_SOURCE."SOURCE_SALE_KEY","SOURCE_FILE" = DBT_INTERNAL_SOURCE."SOURCE_FILE","LOAD_BATCH_ID" = DBT_INTERNAL_SOURCE."LOAD_BATCH_ID","LOAD_TS" = DBT_INTERNAL_SOURCE."LOAD_TS"
    

    when not matched then insert
        ("SALE_KEY", "EXTRA_KEY", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")
    values
        ("SALE_KEY", "EXTRA_KEY", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")


/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.bridge_vehicle_sale_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:38.821614+00:00
-- finished_at: 2026-06-28T06:50:39.074213+00:00
-- elapsed: 252ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_vehicles
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb3b2
-- desc: execute adapter call

    commit
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_vehicles", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:38.823423+00:00
-- finished_at: 2026-06-28T06:50:39.081594+00:00
-- elapsed: 258ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_customers
-- query_id: 01c5589a-0003-4161-0003-2276001f8536
-- desc: execute adapter call

    commit
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_customers", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:38.915033+00:00
-- finished_at: 2026-06-28T06:50:39.149062+00:00
-- elapsed: 234ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.bridge_vehicle_sale_extras
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb3b6
-- desc: execute adapter call

    commit
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.bridge_vehicle_sale_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:39.076229+00:00
-- finished_at: 2026-06-28T06:50:39.173346+00:00
-- elapsed: 97ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_vehicles
-- query_id: 01c5589a-0003-4161-0003-2276001f853a
-- desc: execute adapter call
drop view if exists SNOWPARK_SAMPLE_DATA.MART.dim_vehicles__dbt_tmp cascade
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_vehicles", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:39.083+00:00
-- finished_at: 2026-06-28T06:50:39.224890+00:00
-- elapsed: 141ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_customers
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb3ba
-- desc: execute adapter call
drop view if exists SNOWPARK_SAMPLE_DATA.MART.dim_customers__dbt_tmp cascade
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_customers", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:39.151290+00:00
-- finished_at: 2026-06-28T06:50:39.272822+00:00
-- elapsed: 121ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.bridge_vehicle_sale_extras
-- query_id: 01c5589a-0003-4156-0003-2276001fa49e
-- desc: execute adapter call
drop view if exists SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras__dbt_tmp cascade
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.bridge_vehicle_sale_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:39.179486+00:00
-- finished_at: 2026-06-28T06:50:39.321254+00:00
-- elapsed: 141ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_dim_vehicles_VEHICLE_KEY.dfc0eb8479
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb3c2
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select VEHICLE_KEY
from SNOWPARK_SAMPLE_DATA.MART.dim_vehicles
where VEHICLE_KEY is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_dim_vehicles_VEHICLE_KEY.dfc0eb8479", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:39.179644+00:00
-- finished_at: 2026-06-28T06:50:39.321254+00:00
-- elapsed: 141ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.unique_dim_vehicles_VEHICLE_KEY.04a14a9493
-- query_id: 01c5589a-0003-4161-0003-2276001f853e
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    VEHICLE_KEY as unique_field,
    count(*) as n_records

from SNOWPARK_SAMPLE_DATA.MART.dim_vehicles
where VEHICLE_KEY is not null
group by VEHICLE_KEY
having count(*) > 1



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.unique_dim_vehicles_VEHICLE_KEY.04a14a9493", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:39.179625+00:00
-- finished_at: 2026-06-28T06:50:39.345735+00:00
-- elapsed: 166ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.relationships_fact_vehicle_sales_VEHICLE_KEY__vehicle_key__ref_dim_vehicles_.3ab6e6df00
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb3be
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select VEHICLE_KEY as from_field
    from SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
    where VEHICLE_KEY is not null
),

parent as (
    select vehicle_key as to_field
    from SNOWPARK_SAMPLE_DATA.MART.dim_vehicles
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.relationships_fact_vehicle_sales_VEHICLE_KEY__vehicle_key__ref_dim_vehicles_.3ab6e6df00", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:39.230157+00:00
-- finished_at: 2026-06-28T06:50:39.371420+00:00
-- elapsed: 141ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_dim_customers_CUSTOMER_KEY.397edac728
-- query_id: 01c5589a-0003-4156-0003-2276001fa4a2
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select CUSTOMER_KEY
from SNOWPARK_SAMPLE_DATA.MART.dim_customers
where CUSTOMER_KEY is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_dim_customers_CUSTOMER_KEY.397edac728", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:39.230354+00:00
-- finished_at: 2026-06-28T06:50:39.377599+00:00
-- elapsed: 147ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.relationships_fact_vehicle_sales_CUSTOMER_KEY__customer_key__ref_dim_customers_.39991c3957
-- query_id: 01c5589a-0003-4161-0003-2276001f8542
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select CUSTOMER_KEY as from_field
    from SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
    where CUSTOMER_KEY is not null
),

parent as (
    select customer_key as to_field
    from SNOWPARK_SAMPLE_DATA.MART.dim_customers
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.relationships_fact_vehicle_sales_CUSTOMER_KEY__customer_key__ref_dim_customers_.39991c3957", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:39.283392+00:00
-- finished_at: 2026-06-28T06:50:39.382417+00:00
-- elapsed: 99ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_bridge_vehicle_sale_extras_EXTRA_KEY.f467967209
-- query_id: 01c5589a-0003-4161-0003-2276001f854a
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select EXTRA_KEY
from SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras
where EXTRA_KEY is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_bridge_vehicle_sale_extras_EXTRA_KEY.f467967209", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:39.283392+00:00
-- finished_at: 2026-06-28T06:50:39.383041+00:00
-- elapsed: 99ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_bridge_vehicle_sale_extras_SALE_KEY.200fd3442e
-- query_id: 01c5589a-0003-4161-0003-2276001f854e
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SALE_KEY
from SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras
where SALE_KEY is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.not_null_bridge_vehicle_sale_extras_SALE_KEY.200fd3442e", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:39.230309+00:00
-- finished_at: 2026-06-28T06:50:39.402703+00:00
-- elapsed: 172ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.unique_dim_customers_CUSTOMER_KEY.070459efe0
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb3c6
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    CUSTOMER_KEY as unique_field,
    count(*) as n_records

from SNOWPARK_SAMPLE_DATA.MART.dim_customers
where CUSTOMER_KEY is not null
group by CUSTOMER_KEY
having count(*) > 1



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.unique_dim_customers_CUSTOMER_KEY.070459efe0", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:39.283518+00:00
-- finished_at: 2026-06-28T06:50:39.404542+00:00
-- elapsed: 121ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.unique_combination_of_columns_bridge_vehicle_sale_extras_sale_key__extra_key.cd19788461
-- query_id: 01c5589a-0003-4161-0003-2276001f8546
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  

select
  sale_key, extra_key,
  count(*) as row_count
from SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras
group by sale_key, extra_key
having count(*) > 1


  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.unique_combination_of_columns_bridge_vehicle_sale_extras_sale_key__extra_key.cd19788461", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:39.283558+00:00
-- finished_at: 2026-06-28T06:50:39.473299+00:00
-- elapsed: 189ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.relationships_bridge_vehicle_sale_extras_SALE_KEY__sale_key__ref_fact_vehicle_sales_.4d380a2afa
-- query_id: 01c5589a-0003-3e8a-0003-2276001fb3ca
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select SALE_KEY as from_field
    from SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras
    where SALE_KEY is not null
),

parent as (
    select sale_key as to_field
    from SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.relationships_bridge_vehicle_sale_extras_SALE_KEY__sale_key__ref_fact_vehicle_sales_.4d380a2afa", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T06:50:39.283802+00:00
-- finished_at: 2026-06-28T06:50:39.475891+00:00
-- elapsed: 192ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.relationships_bridge_vehicle_sale_extras_EXTRA_KEY__extra_key__ref_dim_extras_.74b0686203
-- query_id: 01c5589a-0003-4156-0003-2276001fa4a6
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select EXTRA_KEY as from_field
    from SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras
    where EXTRA_KEY is not null
),

parent as (
    select extra_key as to_field
    from SNOWPARK_SAMPLE_DATA.MART.dim_extras
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.relationships_bridge_vehicle_sale_extras_EXTRA_KEY__extra_key__ref_dim_extras_.74b0686203", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
