
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select LOAD_TS
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES
where LOAD_TS is null



  
  
      
    ) dbt_internal_test