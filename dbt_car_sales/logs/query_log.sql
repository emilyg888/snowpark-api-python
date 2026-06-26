-- created_at: 2026-06-26T10:06:30.897139+00:00
-- finished_at: 2026-06-26T10:06:31.057836+00:00
-- elapsed: 160ms
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01c54e1e-0003-3d97-0003-2276001d91e6
-- desc: execute adapter call
show terse schemas in database SNOWPARK_SAMPLE_DATA
    limit 10000
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "car_sales_dbt", "target_name": "dev"} */;
-- created_at: 2026-06-26T10:06:31.070165+00:00
-- finished_at: 2026-06-26T10:06:31.290712+00:00
-- elapsed: 220ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_customers
-- query_id: 01c54e1e-0003-3f5e-0003-2276001d641e
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "SNOWPARK_SAMPLE_DATA"."MART" LIMIT 10000;
-- created_at: 2026-06-26T10:06:31.319901+00:00
-- finished_at: 2026-06-26T10:06:31.511957+00:00
-- elapsed: 192ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_sales_persons
-- query_id: 01c54e1e-0003-3f5e-0003-2276001d6426
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "SNOWPARK_SAMPLE_DATA"."MART" LIMIT 10000;
-- created_at: 2026-06-26T10:06:31.485565+00:00
-- finished_at: 2026-06-26T10:06:31.622246+00:00
-- elapsed: 136ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_extras
-- query_id: 01c54e1e-0003-3f5f-0003-2276001d82fa
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "SNOWPARK_SAMPLE_DATA"."MART" LIMIT 10000;
-- created_at: 2026-06-26T10:06:31.556359+00:00
-- finished_at: 2026-06-26T10:06:31.669057+00:00
-- elapsed: 112ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_vehicles
-- query_id: 01c54e1e-0003-3f5e-0003-2276001d642e
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "SNOWPARK_SAMPLE_DATA"."MART" LIMIT 10000;
-- created_at: 2026-06-26T10:06:31.294134+00:00
-- finished_at: 2026-06-26T10:06:31.917037+00:00
-- elapsed: 622ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_customers
-- query_id: 01c54e1e-0003-3f5f-0003-2276001d82f6
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
-- created_at: 2026-06-26T10:06:31.515223+00:00
-- finished_at: 2026-06-26T10:06:32.074422+00:00
-- elapsed: 559ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_sales_persons
-- query_id: 01c54e1e-0003-3f5f-0003-2276001d82fe
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
-- created_at: 2026-06-26T10:06:31.924347+00:00
-- finished_at: 2026-06-26T10:06:32.154561+00:00
-- elapsed: 230ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_dim_customers_CUSTOMER_KEY.397edac728
-- query_id: 01c54e1e-0003-3f5f-0003-2276001d830a
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
-- created_at: 2026-06-26T10:06:31.671877+00:00
-- finished_at: 2026-06-26T10:06:32.219208+00:00
-- elapsed: 547ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_vehicles
-- query_id: 01c54e1e-0003-3f5f-0003-2276001d8306
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
-- created_at: 2026-06-26T10:06:32.081350+00:00
-- finished_at: 2026-06-26T10:06:32.342439+00:00
-- elapsed: 261ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_dim_sales_persons_SALES_PERSON_KEY.85f80c32c8
-- query_id: 01c54e1e-0003-3d97-0003-2276001d91f2
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
-- created_at: 2026-06-26T10:06:32.129521+00:00
-- finished_at: 2026-06-26T10:06:32.342988+00:00
-- elapsed: 213ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.unique_dim_customers_CUSTOMER_KEY.070459efe0
-- query_id: 01c54e1e-0003-3f5e-0003-2276001d6436
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
-- created_at: 2026-06-26T10:06:32.169516+00:00
-- finished_at: 2026-06-26T10:06:32.342986+00:00
-- elapsed: 173ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.relationships_fact_vehicle_sales_CUSTOMER_KEY__customer_key__ref_dim_customers_.39991c3957
-- query_id: 01c54e1e-0003-3f5f-0003-2276001d830e
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
-- created_at: 2026-06-26T10:06:32.227322+00:00
-- finished_at: 2026-06-26T10:06:32.445907+00:00
-- elapsed: 218ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_dim_vehicles_VEHICLE_KEY.dfc0eb8479
-- query_id: 01c54e1e-0003-3d97-0003-2276001d91fa
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
-- created_at: 2026-06-26T10:06:32.227322+00:00
-- finished_at: 2026-06-26T10:06:32.533840+00:00
-- elapsed: 306ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.relationships_fact_vehicle_sales_VEHICLE_KEY__vehicle_key__ref_dim_vehicles_.3ab6e6df00
-- query_id: 01c54e1e-0003-3d97-0003-2276001d91f6
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
-- created_at: 2026-06-26T10:06:31.624880+00:00
-- finished_at: 2026-06-26T10:06:32.547452+00:00
-- elapsed: 922ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.car_sales_dbt.dim_extras
-- query_id: 01c54e1e-0003-3d97-0003-2276001d91ee
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
-- created_at: 2026-06-26T10:06:32.556650+00:00
-- finished_at: 2026-06-26T10:06:32.682236+00:00
-- elapsed: 125ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_dim_extras_EXTRA.43db166cd4
-- query_id: 01c54e1e-0003-3f5e-0003-2276001d643e
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
-- created_at: 2026-06-26T10:06:32.556842+00:00
-- finished_at: 2026-06-26T10:06:32.683023+00:00
-- elapsed: 126ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_dim_extras_EXTRA_KEY.f8de94e0a0
-- query_id: 01c54e1e-0003-3f5e-0003-2276001d643a
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
-- created_at: 2026-06-26T10:06:32.556663+00:00
-- finished_at: 2026-06-26T10:06:32.735279+00:00
-- elapsed: 178ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.relationships_bridge_vehicle_sale_extras_EXTRA_KEY__extra_key__ref_dim_extras_.74b0686203
-- query_id: 01c54e1e-0003-3f5e-0003-2276001d6442
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
-- created_at: 2026-06-26T10:06:32.556749+00:00
-- finished_at: 2026-06-26T10:06:34.432677+00:00
-- elapsed: 1.9s
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.unique_dim_extras_EXTRA_KEY.49ac0f8c85
-- query_id: 01c54e1e-0003-3d97-0003-2276001d91fe
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
-- created_at: 2026-06-26T10:06:34.313068+00:00
-- finished_at: 2026-06-26T10:06:34.477529+00:00
-- elapsed: 164ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.unique_dim_vehicles_VEHICLE_KEY.04a14a9493
-- query_id: 01c54e1e-0003-3f5e-0003-2276001d6446
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
-- created_at: 2026-06-26T10:06:34.287387+00:00
-- finished_at: 2026-06-26T10:06:34.485656+00:00
-- elapsed: 198ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.relationships_fact_vehicle_sales_SALES_PERSON_KEY__sales_person_key__ref_dim_sales_persons_.bb75a07b09
-- query_id: 01c54e1e-0003-3d97-0003-2276001d9202
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
-- created_at: 2026-06-26T10:06:34.631737+00:00
-- finished_at: 2026-06-26T10:06:34.820615+00:00
-- elapsed: 188ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.not_null_dim_sales_persons_SALES_PERSON_ID.2bfa32c62d
-- query_id: 01c54e1e-0003-3f5f-0003-2276001d8312
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
-- created_at: 2026-06-26T10:06:36.691752+00:00
-- finished_at: 2026-06-26T10:06:36.802258+00:00
-- elapsed: 110ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.car_sales_dbt.unique_dim_sales_persons_SALES_PERSON_KEY.73cdbd55d5
-- query_id: 01c54e1e-0003-3f5f-0003-2276001d8316
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
