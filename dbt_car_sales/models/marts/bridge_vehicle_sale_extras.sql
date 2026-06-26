select distinct
  md5(
    base.src::string || '|' ||
    customer.customer_index::string || '|' ||
    vehicle.vehicle_index::string
  ) as sale_key,
  extra.extra_key
from {{ ref('stg_car_sales_base') }} as base
inner join {{ ref('stg_car_sales_customers') }} as customer
  on base.source_sale_key = customer.source_sale_key
inner join {{ ref('stg_car_sales_vehicles') }} as vehicle
  on base.source_sale_key = vehicle.source_sale_key
inner join {{ ref('stg_car_sales_extras') }} as extra
  on vehicle.source_sale_key = extra.source_sale_key
 and vehicle.vehicle_index = extra.vehicle_index
where extra.extra_key is not null
