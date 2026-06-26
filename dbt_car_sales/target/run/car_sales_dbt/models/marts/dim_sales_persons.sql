
  
    



create or replace transient  table SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons
    
    
    
    
    as (select
  sales_person_key,
  sales_person_id,
  sales_person_name,
  dealership
from (
  select
    case
      when sales_person_id is null then null
      else md5(
        upper(coalesce(dealership, '')) || '|' ||
        coalesce(sales_person_id, '')
      )
    end as sales_person_key,
    sales_person_id,
    sales_person_name,
    dealership
  from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base
  where sales_person_id is not null
)
qualify row_number() over (
  partition by sales_person_key
  order by sales_person_id, sales_person_name, dealership
) = 1
    )
;



  