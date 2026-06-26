
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    CUSTOMER_KEY as unique_field,
    count(*) as n_records

from SNOWPARK_SAMPLE_DATA.MART.dim_customers
where CUSTOMER_KEY is not null
group by CUSTOMER_KEY
having count(*) > 1



  
  
      
    ) dbt_internal_test