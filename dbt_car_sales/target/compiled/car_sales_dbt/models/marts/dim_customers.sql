select
  customer_key,
  customer_name,
  customer_phone,
  customer_address
from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_customers
where customer_key is not null
qualify row_number() over (
  partition by customer_key
  order by customer_name, customer_phone, customer_address
) = 1