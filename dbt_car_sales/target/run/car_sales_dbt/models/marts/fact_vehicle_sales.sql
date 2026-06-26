
  
    



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
;



  