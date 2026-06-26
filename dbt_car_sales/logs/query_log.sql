-- created_at: 2026-06-26T09:09:39.363899+00:00
-- finished_at: 2026-06-26T09:09:40.401514+00:00
-- elapsed: 1.0s
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f3e
-- desc: execute adapter call
show terse schemas in database SNOWPARK_SAMPLE_DATA
    limit 10000
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-26T09:09:40.427669+00:00
-- finished_at: 2026-06-26T09:09:40.650819+00:00
-- elapsed: 223ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.source_not_null_car_sales_source_CAR_SALES_SRC.83241cc63c
-- query_id: 01c54de5-0003-3f5f-0003-2276001d8016
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SRC
from SNOWPARK_SAMPLE_DATA.PUBLIC.CAR_SALES
where SRC is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.car_sales_dbt.source_not_null_car_sales_source_CAR_SALES_SRC.83241cc63c", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-26T09:09:40.655507+00:00
-- finished_at: 2026-06-26T09:09:40.772082+00:00
-- elapsed: 116ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.stg_car_sales_base
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f46
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "SNOWPARK_SAMPLE_DATA"."STAGING" LIMIT 10000;
-- created_at: 2026-06-26T09:09:40.774091+00:00
-- finished_at: 2026-06-26T09:09:41.014298+00:00
-- elapsed: 240ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.stg_car_sales_base
-- query_id: 01c54de5-0003-3f5e-0003-2276001d6182
-- desc: execute adapter call
create or replace   view SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base
  
  
  
  
  as (
    select
  md5(src::string) as source_sale_key,
  src,
  src:date::date as sale_date,
  src:dealership::string as dealership,
  src:salesperson.id::string as sales_person_id,
  src:salesperson.name::string as sales_person_name
from SNOWPARK_SAMPLE_DATA.PUBLIC.CAR_SALES
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.stg_car_sales_base", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-26T09:09:41.443625+00:00
-- finished_at: 2026-06-26T09:09:42.118419+00:00
-- elapsed: 674ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.unique_stg_car_sales_base_SOURCE_SALE_KEY.0676623595
-- query_id: 01c54de5-0003-3f5f-0003-2276001d801e
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
-- created_at: 2026-06-26T09:09:41.021882+00:00
-- finished_at: 2026-06-26T09:09:42.119918+00:00
-- elapsed: 1.1s
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_base_SOURCE_SALE_KEY.729dca217a
-- query_id: 01c54de5-0003-3f5f-0003-2276001d801a
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
-- created_at: 2026-06-26T09:09:41.303859+00:00
-- finished_at: 2026-06-26T09:09:42.315037+00:00
-- elapsed: 1.0s
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_base_SRC.32d8231bd5
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f4e
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
-- created_at: 2026-06-26T09:09:42.318365+00:00
-- finished_at: 2026-06-26T09:09:42.466269+00:00
-- elapsed: 147ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_sales_persons
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f56
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "SNOWPARK_SAMPLE_DATA"."MART" LIMIT 10000;
-- created_at: 2026-06-26T09:09:42.320762+00:00
-- finished_at: 2026-06-26T09:09:42.518517+00:00
-- elapsed: 197ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.stg_car_sales_customers
-- query_id: 01c54de5-0003-3f5e-0003-2276001d618a
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
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base base,
  lateral flatten(input => base.src:customer) customer
where customer.value is not null
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.stg_car_sales_customers", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-26T09:09:42.320762+00:00
-- finished_at: 2026-06-26T09:09:42.528246+00:00
-- elapsed: 207ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.stg_car_sales_vehicles
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f52
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
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base base,
  lateral flatten(input => base.src:vehicle) vehicle
where vehicle.value is not null
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.stg_car_sales_vehicles", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-26T09:09:42.525784+00:00
-- finished_at: 2026-06-26T09:09:42.701892+00:00
-- elapsed: 176ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_customers_CUSTOMER_KEY.3eb6986a43
-- query_id: 01c54de5-0003-3f5f-0003-2276001d8022
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
-- created_at: 2026-06-26T09:09:42.534654+00:00
-- finished_at: 2026-06-26T09:09:43.276270+00:00
-- elapsed: 741ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_vehicles_VEHICLE_KEY.e79c86769d
-- query_id: 01c54de5-0003-3f5e-0003-2276001d6192
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
-- created_at: 2026-06-26T09:09:42.469879+00:00
-- finished_at: 2026-06-26T09:09:44.220276+00:00
-- elapsed: 1.8s
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_sales_persons
-- query_id: 01c54de5-0003-3f5e-0003-2276001d618e
-- desc: execute adapter call
create or replace transient  table SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons
    
    
    
    
    as (select
  sales_person_key,
  sales_person_id,
  sales_person_name,
  dealership
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
    dealership
  from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base
  where sales_person_id is not null
)
qualify row_number() over (
  partition by sales_person_key
  order by sales_person_id, sales_person_name, dealership
) = 1
    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_sales_persons", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-26T09:09:44.226737+00:00
-- finished_at: 2026-06-26T09:09:44.360045+00:00
-- elapsed: 133ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_dim_sales_persons_SALES_PERSON_KEY.85f80c32c8
-- query_id: 01c54de5-0003-3f5f-0003-2276001d8026
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
-- created_at: 2026-06-26T09:09:44.226697+00:00
-- finished_at: 2026-06-26T09:09:44.370182+00:00
-- elapsed: 143ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.unique_dim_sales_persons_SALES_PERSON_KEY.73cdbd55d5
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f62
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
-- created_at: 2026-06-26T09:09:44.226682+00:00
-- finished_at: 2026-06-26T09:09:44.380960+00:00
-- elapsed: 154ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_dim_sales_persons_SALES_PERSON_ID.2bfa32c62d
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f5e
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
-- created_at: 2026-06-26T09:09:49.553688+00:00
-- finished_at: 2026-06-26T09:09:49.695435+00:00
-- elapsed: 141ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_customers_CUSTOMER_INDEX.7cf8458f0a
-- query_id: 01c54de5-0003-3f5f-0003-2276001d802a
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
-- created_at: 2026-06-26T09:09:49.835878+00:00
-- finished_at: 2026-06-26T09:09:50.328146+00:00
-- elapsed: 492ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_vehicles_SOURCE_SALE_KEY.2280a8a80b
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f66
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
-- created_at: 2026-06-26T09:09:51.630641+00:00
-- finished_at: 2026-06-26T09:09:51.774197+00:00
-- elapsed: 143ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_vehicles_VEHICLE_INDEX.1e873ec374
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f6e
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
-- created_at: 2026-06-26T09:09:51.627467+00:00
-- finished_at: 2026-06-26T09:09:51.775708+00:00
-- elapsed: 148ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_customers_SOURCE_SALE_KEY.451f45689f
-- query_id: 01c54de5-0003-3f5f-0003-2276001d802e
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
-- created_at: 2026-06-26T09:09:51.622867+00:00
-- finished_at: 2026-06-26T09:09:51.901143+00:00
-- elapsed: 278ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.stg_car_sales_extras
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f6a
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
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base base,
  lateral flatten(input => base.src:vehicle) vehicle,
  lateral flatten(input => vehicle.value:extras) extras
where vehicle.value is not null
  and extras.value is not null

  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.stg_car_sales_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-26T09:09:51.908819+00:00
-- finished_at: 2026-06-26T09:09:52.057967+00:00
-- elapsed: 149ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_EXTRA_INDEX.2140ff5490
-- query_id: 01c54de5-0003-3f5e-0003-2276001d619a
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
-- created_at: 2026-06-26T09:09:51.908777+00:00
-- finished_at: 2026-06-26T09:09:52.058445+00:00
-- elapsed: 149ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_EXTRA_KEY.ebc5eb0c4a
-- query_id: 01c54de5-0003-3f5e-0003-2276001d619e
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
-- created_at: 2026-06-26T09:09:51.909440+00:00
-- finished_at: 2026-06-26T09:09:52.059096+00:00
-- elapsed: 149ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_EXTRA.85f65ffa3f
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f76
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
-- created_at: 2026-06-26T09:09:51.909127+00:00
-- finished_at: 2026-06-26T09:09:52.066322+00:00
-- elapsed: 157ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_VEHICLE_KEY.b41d0a3b48
-- query_id: 01c54de5-0003-3f5f-0003-2276001d803a
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
-- created_at: 2026-06-26T09:09:51.908470+00:00
-- finished_at: 2026-06-26T09:09:52.066637+00:00
-- elapsed: 158ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_SOURCE_SALE_KEY.ca8b3cb533
-- query_id: 01c54de5-0003-3f5e-0003-2276001d6196
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
-- created_at: 2026-06-26T09:09:51.778529+00:00
-- finished_at: 2026-06-26T09:09:52.461350+00:00
-- elapsed: 682ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_vehicles
-- query_id: 01c54de5-0003-3f5f-0003-2276001d8032
-- desc: execute adapter call
create or replace transient  table SNOWPARK_SAMPLE_DATA.MART.dim_vehicles
    
    
    
    
    as (select
  vehicle_key,
  make,
  model,
  year
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_vehicles
where vehicle_key is not null
qualify row_number() over (
  partition by vehicle_key
  order by make, model, year
) = 1
    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_vehicles", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-26T09:09:51.778760+00:00
-- finished_at: 2026-06-26T09:09:52.471003+00:00
-- elapsed: 692ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_customers
-- query_id: 01c54de5-0003-3f5f-0003-2276001d8036
-- desc: execute adapter call
create or replace transient  table SNOWPARK_SAMPLE_DATA.MART.dim_customers
    
    
    
    
    as (select
  customer_key,
  customer_name,
  customer_phone,
  customer_address
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_customers
where customer_key is not null
qualify row_number() over (
  partition by customer_key
  order by customer_name, customer_phone, customer_address
) = 1
    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_customers", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-26T09:09:51.779397+00:00
-- finished_at: 2026-06-26T09:09:52.475462+00:00
-- elapsed: 696ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.fact_vehicle_sales
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f72
-- desc: execute adapter call
create or replace transient  table SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
    
    
    
    
    as (select
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
  1 as vehicle_count
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base base
join SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_customers customer
  on base.source_sale_key = customer.source_sale_key
join SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_vehicles vehicle
  on base.source_sale_key = vehicle.source_sale_key
    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.fact_vehicle_sales", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-26T09:09:52.470078+00:00
-- finished_at: 2026-06-26T09:09:52.594678+00:00
-- elapsed: 124ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_dim_vehicles_VEHICLE_KEY.dfc0eb8479
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f7a
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
-- created_at: 2026-06-26T09:09:52.482226+00:00
-- finished_at: 2026-06-26T09:09:52.603526+00:00
-- elapsed: 121ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_fact_vehicle_sales_CUSTOMER_KEY.02c6f1fa80
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f7e
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
-- created_at: 2026-06-26T09:09:52.482898+00:00
-- finished_at: 2026-06-26T09:09:52.609373+00:00
-- elapsed: 126ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_fact_vehicle_sales_VEHICLE_KEY.cb670c20b2
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f82
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
-- created_at: 2026-06-26T09:09:52.482857+00:00
-- finished_at: 2026-06-26T09:09:52.609845+00:00
-- elapsed: 126ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_fact_vehicle_sales_SALE_PRICE.5f4aed79ce
-- query_id: 01c54de5-0003-3f5e-0003-2276001d61a6
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
-- created_at: 2026-06-26T09:09:52.470077+00:00
-- finished_at: 2026-06-26T09:09:52.609848+00:00
-- elapsed: 139ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.unique_dim_vehicles_VEHICLE_KEY.04a14a9493
-- query_id: 01c54de5-0003-3f5e-0003-2276001d61a2
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
-- created_at: 2026-06-26T09:09:52.475597+00:00
-- finished_at: 2026-06-26T09:09:52.613778+00:00
-- elapsed: 138ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_dim_customers_CUSTOMER_KEY.397edac728
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f86
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
-- created_at: 2026-06-26T09:09:52.482703+00:00
-- finished_at: 2026-06-26T09:09:52.614211+00:00
-- elapsed: 131ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_fact_vehicle_sales_SALE_KEY.1433a01831
-- query_id: 01c54de5-0003-3f5f-0003-2276001d8042
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
-- created_at: 2026-06-26T09:09:52.475986+00:00
-- finished_at: 2026-06-26T09:09:52.625860+00:00
-- elapsed: 149ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.unique_dim_customers_CUSTOMER_KEY.070459efe0
-- query_id: 01c54de5-0003-3f5f-0003-2276001d803e
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
-- created_at: 2026-06-26T09:09:54.217108+00:00
-- finished_at: 2026-06-26T09:09:54.329813+00:00
-- elapsed: 112ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.unique_fact_vehicle_sales_SALE_KEY.0fcdc48eca
-- query_id: 01c54de5-0003-3f5e-0003-2276001d61aa
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
-- created_at: 2026-06-26T09:09:54.193830+00:00
-- finished_at: 2026-06-26T09:09:54.336990+00:00
-- elapsed: 143ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.relationships_fact_vehicle_sales_CUSTOMER_KEY__customer_key__ref_dim_customers_.39991c3957
-- query_id: 01c54de5-0003-3f5f-0003-2276001d804a
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
-- created_at: 2026-06-26T09:09:54.217096+00:00
-- finished_at: 2026-06-26T09:09:54.341957+00:00
-- elapsed: 124ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.relationships_fact_vehicle_sales_SALES_PERSON_KEY__sales_person_key__ref_dim_sales_persons_.bb75a07b09
-- query_id: 01c54de5-0003-3f5f-0003-2276001d804e
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
-- created_at: 2026-06-26T09:09:54.245947+00:00
-- finished_at: 2026-06-26T09:09:54.523730+00:00
-- elapsed: 277ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.relationships_fact_vehicle_sales_VEHICLE_KEY__vehicle_key__ref_dim_vehicles_.3ab6e6df00
-- query_id: 01c54de5-0003-3f5f-0003-2276001d8052
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
-- created_at: 2026-06-26T09:09:56.338951+00:00
-- finished_at: 2026-06-26T09:09:56.489475+00:00
-- elapsed: 150ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_stg_car_sales_extras_VEHICLE_INDEX.d5ee8494fd
-- query_id: 01c54de5-0003-3f5f-0003-2276001d8056
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
-- created_at: 2026-06-26T09:09:56.494497+00:00
-- finished_at: 2026-06-26T09:09:56.994084+00:00
-- elapsed: 499ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_extras
-- query_id: 01c54de5-0003-3f5e-0003-2276001d61b2
-- desc: execute adapter call
create or replace transient  table SNOWPARK_SAMPLE_DATA.MART.dim_extras
    
    
    
    
    as (select
  extra_key,
  extra
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_extras
where extra_key is not null
qualify row_number() over (
  partition by extra_key
  order by extra
) = 1
    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.dim_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-26T09:09:57.001111+00:00
-- finished_at: 2026-06-26T09:09:57.141700+00:00
-- elapsed: 140ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_dim_extras_EXTRA.43db166cd4
-- query_id: 01c54de5-0003-3f5f-0003-2276001d805e
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
-- created_at: 2026-06-26T09:09:57.001166+00:00
-- finished_at: 2026-06-26T09:09:57.141699+00:00
-- elapsed: 140ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_dim_extras_EXTRA_KEY.f8de94e0a0
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f8e
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
-- created_at: 2026-06-26T09:09:57.001111+00:00
-- finished_at: 2026-06-26T09:09:57.144327+00:00
-- elapsed: 143ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.unique_dim_extras_EXTRA_KEY.49ac0f8c85
-- query_id: 01c54de5-0003-3f5f-0003-2276001d805a
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
-- created_at: 2026-06-26T09:09:56.494513+00:00
-- finished_at: 2026-06-26T09:09:57.254027+00:00
-- elapsed: 759ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.bridge_vehicle_sale_extras
-- query_id: 01c54de5-0003-3f5e-0003-2276001d61ae
-- desc: execute adapter call
create or replace transient  table SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras
    
    
    
    
    as (select distinct
  md5(
    base.src::string || '|' ||
    customer.customer_index::string || '|' ||
    vehicle.vehicle_index::string
  ) as sale_key,
  extra.extra_key
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base base
join SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_customers customer
  on base.source_sale_key = customer.source_sale_key
join SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_vehicles vehicle
  on base.source_sale_key = vehicle.source_sale_key
join SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_extras extra
  on vehicle.source_sale_key = extra.source_sale_key
 and vehicle.vehicle_index = extra.vehicle_index
where extra.extra_key is not null
    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.car_sales_dbt.bridge_vehicle_sale_extras", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-26T09:09:57.260857+00:00
-- finished_at: 2026-06-26T09:09:57.402361+00:00
-- elapsed: 141ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_bridge_vehicle_sale_extras_EXTRA_KEY.f467967209
-- query_id: 01c54de5-0003-3f5f-0003-2276001d8062
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
-- created_at: 2026-06-26T09:09:57.262735+00:00
-- finished_at: 2026-06-26T09:09:57.403510+00:00
-- elapsed: 140ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_bridge_vehicle_sale_extras_SALE_KEY.200fd3442e
-- query_id: 01c54de5-0003-3f5f-0003-2276001d8066
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
-- created_at: 2026-06-26T09:09:57.260929+00:00
-- finished_at: 2026-06-26T09:09:57.404207+00:00
-- elapsed: 143ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.unique_combination_of_columns_bridge_vehicle_sale_extras_sale_key__extra_key.cd19788461
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f92
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
-- created_at: 2026-06-26T09:09:57.263097+00:00
-- finished_at: 2026-06-26T09:09:57.427489+00:00
-- elapsed: 164ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.relationships_bridge_vehicle_sale_extras_SALE_KEY__sale_key__ref_fact_vehicle_sales_.4d380a2afa
-- query_id: 01c54de5-0003-3f5e-0003-2276001d61b6
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
-- created_at: 2026-06-26T09:09:57.260996+00:00
-- finished_at: 2026-06-26T09:09:57.435100+00:00
-- elapsed: 174ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.relationships_bridge_vehicle_sale_extras_EXTRA_KEY__extra_key__ref_dim_extras_.74b0686203
-- query_id: 01c54de5-0003-3d97-0003-2276001d2f96
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
