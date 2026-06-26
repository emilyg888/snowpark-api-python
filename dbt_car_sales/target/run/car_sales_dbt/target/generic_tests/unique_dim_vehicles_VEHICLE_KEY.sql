
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    VEHICLE_KEY as unique_field,
    count(*) as n_records

from SNOWPARK_SAMPLE_DATA.MART.dim_vehicles
where VEHICLE_KEY is not null
group by VEHICLE_KEY
having count(*) > 1



  
  
      
    ) dbt_internal_test