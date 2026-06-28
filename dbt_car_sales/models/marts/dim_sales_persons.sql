{{
  config(
    materialized='incremental',
    unique_key='sales_person_key',
    incremental_strategy='merge',
    on_schema_change='sync_all_columns'
  )
}}

select
  sales_person_key,
  sales_person_id,
  sales_person_name,
  dealership,
  source_sale_key,
  source_file,
  load_batch_id,
  load_ts
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
    dealership,
    source_sale_key,
    source_file,
    load_batch_id,
    load_ts
  from {{ ref('stg_car_sales_base') }}
  where sales_person_id is not null

  {% if is_incremental() %}
    and load_ts >= (
      select coalesce(max(load_ts), '1900-01-01'::timestamp_ntz)
      from {{ this }}
    )
  {% endif %}

qualify row_number() over (
  partition by sales_person_key
  order by load_ts desc, source_file desc, load_batch_id desc
) = 1
)