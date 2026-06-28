select
  base.source_file,
  base.source_sale_key,
  base.load_batch_id,
  base.load_ts,
  vehicle.index::number as vehicle_index,
  extra.index::number as extra_index,
  extra.value::string as extra,
  md5(upper(coalesce(extra.value::string, ''))) as extra_key,
  case
    when vehicle.value:make is null then null
    else md5(
      upper(coalesce(vehicle.value:make::string, '')) || '|' ||
      upper(coalesce(vehicle.value:model::string, '')) || '|' ||
      coalesce(vehicle.value:year::string, '')
    )
  end as vehicle_key
from {{ ref('stg_car_sales_base') }} base,
  lateral flatten(input => base.src:vehicle) vehicle,
  lateral flatten(input => vehicle.value:extras) extra
where vehicle.value is not null
  and extra.value is not null