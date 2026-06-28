

select
  customer_key,
  customer_name,
  customer_phone,
  customer_address,
  source_sale_key,
  source_file,
  load_batch_id,
  load_ts
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_customers
where customer_key is not null


  and load_ts >= (
    select coalesce(max(load_ts), '1900-01-01'::timestamp_ntz)
    from SNOWPARK_SAMPLE_DATA.MART.dim_customers
  )


qualify row_number() over (
  partition by customer_key
  order by load_ts desc, source_file desc, load_batch_id desc
) = 1