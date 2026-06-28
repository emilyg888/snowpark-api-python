
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SOURCE_FILE
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_vehicles
where SOURCE_FILE is null



  
  
      
    ) dbt_internal_test