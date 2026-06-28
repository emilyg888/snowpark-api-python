


select
  vehicle_key,
  make,
  model,
  year,
  source_sale_key,
  source_file,
  load_batch_id,
  load_ts
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_vehicles
where vehicle_key is not null


  and load_ts >= (
    select coalesce(max(load_ts), '1900-01-01'::timestamp_ntz)
    from SNOWPARK_SAMPLE_DATA.MART.dim_vehicles
  )


qualify row_number() over (
  partition by vehicle_key
  order by load_ts desc, source_file desc, load_batch_id desc
) = 1