
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SALE_PRICE
from SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
where SALE_PRICE is null



  
  
      
    ) dbt_internal_test