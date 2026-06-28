
{{
  config(
    materialized='incremental',
    unique_key='extra_key',
    incremental_strategy='merge',
    on_schema_change='sync_all_columns'
  )
}}
select
  extra_key,
  extra,
  source_sale_key,
  source_file,
  load_batch_id,
  load_ts
from {{ ref('stg_car_sales_extras') }}
where extra_key is not null

{% if is_incremental() %}
  and load_ts >= (
    select coalesce(max(load_ts), '1900-01-01'::timestamp_ntz)
    from {{ this }}
  )
{% endif %}

qualify row_number() over (
  partition by extra_key
  order by load_ts desc, source_file desc, load_batch_id desc
) = 1