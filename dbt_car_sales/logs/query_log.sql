-- created_at: 2026-06-28T01:40:19.815647+00:00
-- finished_at: 2026-06-28T01:40:19.972324+00:00
-- elapsed: 156ms
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01c55764-0003-4156-0003-2276001f1416
-- desc: execute adapter call
show terse schemas in database SNOWPARK_SAMPLE_DATA
    limit 10000
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T01:40:20.016343+00:00
-- finished_at: 2026-06-28T01:40:20.171419+00:00
-- elapsed: 155ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.stg_car_sales_base
-- query_id: 01c55764-0003-3e8a-0003-2276001f42aa
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "SNOWPARK_SAMPLE_DATA"."STAGING" LIMIT 10000;
-- created_at: 2026-06-28T01:40:20.174956+00:00
-- finished_at: 2026-06-28T01:40:20.495003+00:00
-- elapsed: 320ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.stg_car_sales_base
-- query_id: 01c55764-0003-4161-0003-2276001f336a
-- desc: execute adapter call
create or replace   view SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base
  
  
  
  
  as (
    select
  src,
  md5(src::string) as source_sale_key,
  src:date::date as sale_date,
  src:dealership::string as dealership,
  src:salesperson.id::string as sales_person_id,
  src:salesperson.name::string as sales_person_name
from SNOWPARK_SAMPLE_DATA.PUBLIC.CAR_SALES
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.stg_car_sales_base", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T01:40:20.505607+00:00
-- finished_at: 2026-06-28T01:40:21.420026+00:00
-- elapsed: 914ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_base_SRC.32d8231bd5
-- query_id: 01c55764-0003-4156-0003-2276001f141e
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
-- created_at: 2026-06-28T01:40:22.828402+00:00
-- finished_at: 2026-06-28T01:40:23.766652+00:00
-- elapsed: 938ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_base_SOURCE_SALE_KEY.729dca217a
-- query_id: 01c55764-0003-3e8a-0003-2276001f42b2
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
-- created_at: 2026-06-28T01:40:23.101839+00:00
-- finished_at: 2026-06-28T01:40:23.970387+00:00
-- elapsed: 868ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.unique_stg_car_sales_base_SOURCE_SALE_KEY.0676623595
-- query_id: 01c55764-0003-4161-0003-2276001f336e
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    SOURCE_SALE_KEY as unique_field,
    count(*) as n_records

from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base
where SOURCE_SALE_KEY is not null
group by SOURCE_SALE_KEY
having count(*) > 1



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.unique_stg_car_sales_base_SOURCE_SALE_KEY.0676623595", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T01:40:23.975778+00:00
-- finished_at: 2026-06-28T01:40:24.199757+00:00
-- elapsed: 223ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.stg_car_sales_customers
-- query_id: 01c55764-0003-4161-0003-2276001f3372
-- desc: execute adapter call
create or replace   view SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_customers
  
  
  
  
  as (
    select
  base.source_sale_key,
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
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base as base,
  lateral flatten(input => base.src:customer) as customer
where customer.value is not null
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.stg_car_sales_customers", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T01:40:23.975778+00:00
-- finished_at: 2026-06-28T01:40:24.200830+00:00
-- elapsed: 225ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.stg_car_sales_vehicles
-- query_id: 01c55764-0003-3e8a-0003-2276001f42b6
-- desc: execute adapter call
create or replace   view SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_vehicles
  
  
  
  
  as (
    select
  base.source_sale_key,
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
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base as base,
  lateral flatten(input => base.src:vehicle) as vehicle
where vehicle.value is not null
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.stg_car_sales_vehicles", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T01:40:23.975778+00:00
-- finished_at: 2026-06-28T01:40:24.216229+00:00
-- elapsed: 240ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.stg_car_sales_extras
-- query_id: 01c55764-0003-4156-0003-2276001f1422
-- desc: execute adapter call
create or replace   view SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_extras
  
  
  
  
  as (
    select
  base.source_sale_key,
  vehicle.index::number as vehicle_index,
  extras.index::number as extra_index,
  extras.value::string as extra,
  md5(upper(coalesce(extras.value::string, ''))) as extra_key,
  case
    when vehicle.value:make is null then null
    else md5(
      upper(coalesce(vehicle.value:make::string, '')) || '|' ||
      upper(coalesce(vehicle.value:model::string, '')) || '|' ||
      coalesce(vehicle.value:year::string, '')
    )
  end as vehicle_key
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base as base,
  lateral flatten(input => base.src:vehicle) as vehicle,
  lateral flatten(input => vehicle.value:extras) as extras
where vehicle.value is not null
  and extras.value is not null
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.stg_car_sales_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-28T01:40:24.206914+00:00
-- finished_at: 2026-06-28T01:40:24.358859+00:00
-- elapsed: 151ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_customers_SOURCE_SALE_KEY.451f45689f
-- query_id: 01c55764-0003-4161-0003-2276001f3376
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
-- created_at: 2026-06-28T01:40:24.221708+00:00
-- finished_at: 2026-06-28T01:40:24.376+00:00
-- elapsed: 154ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_EXTRA_KEY.ebc5eb0c4a
-- query_id: 01c55764-0003-4156-0003-2276001f142a
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
-- created_at: 2026-06-28T01:40:24.206918+00:00
-- finished_at: 2026-06-28T01:40:24.378653+00:00
-- elapsed: 171ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_vehicles_VEHICLE_KEY.e79c86769d
-- query_id: 01c55764-0003-4156-0003-2276001f1426
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
-- created_at: 2026-06-28T01:40:24.408105+00:00
-- finished_at: 2026-06-28T01:40:24.548849+00:00
-- elapsed: 140ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_vehicles_SOURCE_SALE_KEY.2280a8a80b
-- query_id: 01c55764-0003-4156-0003-2276001f142e
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
-- created_at: 2026-06-28T01:40:24.426243+00:00
-- finished_at: 2026-06-28T01:40:24.561269+00:00
-- elapsed: 135ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_customers_CUSTOMER_KEY.3eb6986a43
-- query_id: 01c55764-0003-4156-0003-2276001f1432
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
-- created_at: 2026-06-28T01:40:24.411302+00:00
-- finished_at: 2026-06-28T01:40:24.579536+00:00
-- elapsed: 168ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_VEHICLE_KEY.b41d0a3b48
-- query_id: 01c55764-0003-4161-0003-2276001f337a
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
-- created_at: 2026-06-28T01:40:24.452998+00:00
-- finished_at: 2026-06-28T01:40:24.683951+00:00
-- elapsed: 230ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_vehicles_VEHICLE_INDEX.1e873ec374
-- query_id: 01c55764-0003-4161-0003-2276001f337e
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
-- created_at: 2026-06-28T01:40:24.715039+00:00
-- finished_at: 2026-06-28T01:40:24.870364+00:00
-- elapsed: 155ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_EXTRA_INDEX.2140ff5490
-- query_id: 01c55764-0003-3e8a-0003-2276001f42c2
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
-- created_at: 2026-06-28T01:40:24.715040+00:00
-- finished_at: 2026-06-28T01:40:24.870864+00:00
-- elapsed: 155ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_EXTRA.85f65ffa3f
-- query_id: 01c55764-0003-3e8a-0003-2276001f42be
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
-- created_at: 2026-06-28T01:40:24.715093+00:00
-- finished_at: 2026-06-28T01:40:24.870864+00:00
-- elapsed: 155ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_customers_CUSTOMER_INDEX.7cf8458f0a
-- query_id: 01c55764-0003-3e8a-0003-2276001f42ba
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
-- created_at: 2026-06-28T01:40:28.557197+00:00
-- finished_at: 2026-06-28T01:40:28.700236+00:00
-- elapsed: 143ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_VEHICLE_INDEX.d5ee8494fd
-- query_id: 01c55764-0003-3e8a-0003-2276001f42c6
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
-- created_at: 2026-06-28T01:40:28.563205+00:00
-- finished_at: 2026-06-28T01:40:28.704818+00:00
-- elapsed: 141ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_SOURCE_SALE_KEY.ca8b3cb533
-- query_id: 01c55764-0003-4161-0003-2276001f3382
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
