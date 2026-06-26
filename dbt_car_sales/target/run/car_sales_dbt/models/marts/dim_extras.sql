
  
    



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
;



  