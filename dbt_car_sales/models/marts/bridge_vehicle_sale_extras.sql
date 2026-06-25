select distinct
  md5(
    base.src::string || '|' ||
    customer.customer_index::string || '|' ||
    vehicle.vehicle_index::string
  ) as sale_key,
  extra.value::string as extra
from {{ ref('stg_car_sales_base') }} base
join {{ ref('stg_car_sales_customers') }} customer
  on base.source_sale_key = customer.source_sale_key
join {{ ref('stg_car_sales_vehicles') }} vehicle
  on base.source_sale_key = vehicle.source_sale_key,
  lateral flatten(input => vehicle.extras) extra
where extra.value is not null
