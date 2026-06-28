{{
  config(
    materialized='incremental',
    unique_key=['sale_key', 'extra_key'],
    incremental_strategy='merge',
    on_schema_change='sync_all_columns'
  )
}}

select distinct
  md5(
    base.src::string || '|' ||
    customer.customer_index::string || '|' ||
    vehicle.vehicle_index::string
  ) as sale_key,
  extra.extra_key,
  base.source_sale_key,
  base.source_file,
  base.load_batch_id,
  base.load_ts
from {{ ref('stg_car_sales_base') }} as base
inner join {{ ref('stg_car_sales_customers') }} as customer
  on base.source_sale_key = customer.source_sale_key
inner join {{ ref('stg_car_sales_vehicles') }} as vehicle
  on base.source_sale_key = vehicle.source_sale_key
inner join {{ ref('stg_car_sales_extras') }} as extra
  on vehicle.source_sale_key = extra.source_sale_key
 and vehicle.vehicle_index = extra.vehicle_index
where extra.extra_key is not null

{% if is_incremental() %}
and base.load_ts >= (
  select coalesce(max(load_ts), '1900-01-01'::timestamp_ntz)
  from {{ this }}
)
{% endif %}
