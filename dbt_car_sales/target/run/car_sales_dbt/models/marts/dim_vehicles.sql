
  
    



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
;



  