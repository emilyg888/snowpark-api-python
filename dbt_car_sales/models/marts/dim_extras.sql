select
  extra_key,
  extra
from {{ ref('stg_car_sales_extras') }}
where extra_key is not null
qualify row_number() over (
  partition by extra_key
  order by extra
) = 1