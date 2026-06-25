select
  base.source_sale_key,
  customer.index::number as customer_index,
  customer.value:name::string as customer_name,
  customer.value:phone::string as customer_phone,
  customer.value:address::string as customer_address,
  case
    when customer.value:name is null then null
    else md5(
      upper(coalesce(customer.value:name::string, '')) || '|' ||
      coalesce(customer.value:phone::string, '') || '|' ||
      upper(coalesce(customer.value:address::string, ''))
    )
  end as customer_key
from {{ ref('stg_car_sales_base') }} base,
  lateral flatten(input => base.src:customer) customer
where customer.value is not null
