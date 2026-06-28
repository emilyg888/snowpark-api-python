
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select LOAD_BATCH_ID
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES
where LOAD_BATCH_ID is null



  
  
      
    ) dbt_internal_test