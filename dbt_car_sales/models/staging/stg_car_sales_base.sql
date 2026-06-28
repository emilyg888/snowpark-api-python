select
  src,
  source_file,
  source_sale_key,
  load_batch_id,
  load_ts,
  src:date::date as sale_date,
  src:dealership::string as dealership,
  src:salesperson.id::string as sales_person_id,
  src:salesperson.name::string as sales_person_name
from {{ source('car_sales_source', 'CAR_SALES') }}