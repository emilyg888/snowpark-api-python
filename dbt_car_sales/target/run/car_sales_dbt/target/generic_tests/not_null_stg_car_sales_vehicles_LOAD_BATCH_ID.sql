
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select LOAD_BATCH_ID
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_vehicles
where LOAD_BATCH_ID is null



  
  
      
    ) dbt_internal_test