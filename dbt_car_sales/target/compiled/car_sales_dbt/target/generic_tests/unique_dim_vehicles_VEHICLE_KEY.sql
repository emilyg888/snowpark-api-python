
    
    

select
    VEHICLE_KEY as unique_field,
    count(*) as n_records

from SNOWPARK_SAMPLE_DATA.MART.dim_vehicles
where VEHICLE_KEY is not null
group by VEHICLE_KEY
having count(*) > 1


