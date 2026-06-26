
    
    

with child as (
    select VEHICLE_KEY as from_field
    from SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
    where VEHICLE_KEY is not null
),

parent as (
    select vehicle_key as to_field
    from SNOWPARK_SAMPLE_DATA.MART.dim_vehicles
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


