

select
  md5(
    base.src::string || '|' ||
    customer.customer_index::string || '|' ||
    vehicle.vehicle_index::string
  ) as sale_key,
  base.sale_date,
  base.dealership,
  case
    when base.sales_person_id is null then null
    else md5(
      upper(coalesce(base.dealership, '')) || '|' ||
      coalesce(base.sales_person_id, '')
    )
  end as sales_person_key,
  customer.customer_key,
  vehicle.vehicle_key,
  vehicle.sale_price,
  1 as vehicle_count,
  base.source_sale_key,
  base.source_file,
  base.load_batch_id,
  base.load_ts
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base as base
inner join SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_customers as customer
  on base.source_sale_key = customer.source_sale_key
inner join SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_vehicles as vehicle
  on base.source_sale_key = vehicle.source_sale_key


where base.load_ts >= (
  select coalesce(max(load_ts), '1900-01-01'::timestamp_ntz)
  from SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
)
