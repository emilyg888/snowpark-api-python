
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select SOURCE_SALE_KEY
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES
where SOURCE_SALE_KEY is null



  
  
      
    ) dbt_internal_test