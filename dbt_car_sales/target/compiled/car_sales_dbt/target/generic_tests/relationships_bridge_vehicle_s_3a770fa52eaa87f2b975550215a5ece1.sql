
    
    

with child as (
    select EXTRA_KEY as from_field
    from SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras
    where EXTRA_KEY is not null
),

parent as (
    select extra_key as to_field
    from SNOWPARK_SAMPLE_DATA.MART.dim_extras
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


