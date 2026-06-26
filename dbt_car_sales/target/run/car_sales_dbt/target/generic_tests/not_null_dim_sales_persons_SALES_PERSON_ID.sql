
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SALES_PERSON_ID
from SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons
where SALES_PERSON_ID is null



  
  
      
    ) dbt_internal_test