select
  vehicle_key,
  make,
  model,
  year
from {{ ref('stg_car_sales_vehicles') }}
where vehicle_key is not null
qualify row_number() over (
  partition by vehicle_key
  order by make, model, year
) = 1
