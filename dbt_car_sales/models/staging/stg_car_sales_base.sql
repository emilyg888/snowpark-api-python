with ranked as (
  select
    src,
    source_file,
    source_sale_key,
    load_batch_id,
    load_ts,
    src:date::date as sale_date,
    src:dealership::string as dealership,
    src:salesperson.id::string as sales_person_id,
    src:salesperson.name::string as sales_person_name,
    row_number() over (
      partition by source_sale_key
      order by load_ts desc, source_file desc, load_batch_id desc
    ) as row_rank
  from {{ source('car_sales_source', 'CAR_SALES') }}
)

select
  src,
  source_file,
  source_sale_key,
  load_batch_id,
  load_ts,
  sale_date,
  dealership,
  sales_person_id,
  sales_person_name
from ranked
where row_rank = 1
