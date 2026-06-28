
  create or replace   view SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base
  
  
  
  
  as (
    select
  src,
  md5(src::string) as source_sale_key,
  src:date::date as sale_date,
  src:dealership::string as dealership,
  src:salesperson.id::string as sales_person_id,
  src:salesperson.name::string as sales_person_name
from SNOWPARK_SAMPLE_DATA.PUBLIC.CAR_SALES
  );

