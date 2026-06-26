
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select SALES_PERSON_KEY as from_field
    from SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
    where SALES_PERSON_KEY is not null
),

parent as (
    select sales_person_key as to_field
    from SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test