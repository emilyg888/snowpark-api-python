select
  base.source_sale_key,
  vehicle.index::number as vehicle_index,
  vehicle.value:make::string as make,
  vehicle.value:model::string as model,
  vehicle.value:year::number as year,
  vehicle.value:price::number as sale_price,
  case
    when vehicle.value:make is null then null
    else md5(
      upper(coalesce(vehicle.value:make::string, '')) || '|' ||
      upper(coalesce(vehicle.value:model::string, '')) || '|' ||
      coalesce(vehicle.value:year::string, '')
    )
  end as vehicle_key
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base base,
  lateral flatten(input => base.src:vehicle) vehicle
where vehicle.value is not null