
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SALE_KEY
from SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras
where SALE_KEY is null



  
  
      
    ) dbt_internal_test