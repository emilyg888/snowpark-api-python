
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SRC
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES
where SRC is null



  
  
      
    ) dbt_internal_test