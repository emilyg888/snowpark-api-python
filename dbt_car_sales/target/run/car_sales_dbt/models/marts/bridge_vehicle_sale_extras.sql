
  
    



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
;



  