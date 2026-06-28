

select
  extra_key,
  extra,
  source_sale_key,
  source_file,
  load_batch_id,
  load_ts
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_extras
where extra_key is not null


  and load_ts >= (
    select coalesce(max(load_ts), '1900-01-01'::timestamp_ntz)
    from SNOWPARK_SAMPLE_DATA.MART.dim_extras
  )


qualify row_number() over (
  partition by extra_key
  order by load_ts desc, source_file desc, load_batch_id desc
) = 1