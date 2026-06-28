
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select LOAD_TS
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base
where LOAD_TS is null



  
  
      
    ) dbt_internal_test