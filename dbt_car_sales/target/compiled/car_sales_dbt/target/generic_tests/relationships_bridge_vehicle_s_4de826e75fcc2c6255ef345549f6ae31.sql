
    
    

with child as (
    select SALE_KEY as from_field
    from SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras
    where SALE_KEY is not null
),

parent as (
    select sale_key as to_field
    from SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


