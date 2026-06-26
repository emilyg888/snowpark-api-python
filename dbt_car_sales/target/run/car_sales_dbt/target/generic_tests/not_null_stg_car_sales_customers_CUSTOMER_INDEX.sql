
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select CUSTOMER_INDEX
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_customers
where CUSTOMER_INDEX is null



  
  
      
    ) dbt_internal_test