
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select EXTRA_KEY
from SNOWPARK_SAMPLE_DATA.MART.dim_extras
where EXTRA_KEY is null



  
  
      
    ) dbt_internal_test