
  create or replace   view SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_extras
  
  
  
  
  as (
    select
  base.source_sale_key,
  vehicle.index::number as vehicle_index,
  extras.index::number as extra_index,
  extras.value::string as extra,
  md5(upper(coalesce(extras.value::string, ''))) as extra_key,
  case
    when vehicle.value:make is null then null
    else md5(
      upper(coalesce(vehicle.value:make::string, '')) || '|' ||
      upper(coalesce(vehicle.value:model::string, '')) || '|' ||
      coalesce(vehicle.value:year::string, '')
    )
  end as vehicle_key
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base as base,
  lateral flatten(input => base.src:vehicle) as vehicle,
  lateral flatten(input => vehicle.value:extras) as extras
where vehicle.value is not null
  and extras.value is not null
  );

