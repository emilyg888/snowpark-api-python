
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select EXTRA
from SNOWPARK_SAMPLE_DATA.MART.dim_extras
where EXTRA is null



  
  
      
    ) dbt_internal_test