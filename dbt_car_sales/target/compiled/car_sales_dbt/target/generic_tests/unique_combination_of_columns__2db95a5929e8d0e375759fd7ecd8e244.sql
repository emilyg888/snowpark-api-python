

select
  sale_key, extra_key,
  count(*) as row_count
from SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras
group by sale_key, extra_key
having count(*) > 1

