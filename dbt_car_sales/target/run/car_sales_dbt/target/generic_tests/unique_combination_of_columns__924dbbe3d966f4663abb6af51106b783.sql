
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  

select
  sale_key, extra,
  count(*) as row_count
from SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras
group by sale_key, extra
having count(*) > 1


  
  
      
    ) dbt_internal_test