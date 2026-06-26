

select
  sale_key, extra,
  count(*) as row_count
from SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras
group by sale_key, extra
having count(*) > 1

