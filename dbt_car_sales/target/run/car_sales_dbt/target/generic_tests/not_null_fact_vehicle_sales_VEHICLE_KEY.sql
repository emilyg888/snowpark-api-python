
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select VEHICLE_KEY
from SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
where VEHICLE_KEY is null



  
  
      
    ) dbt_internal_test