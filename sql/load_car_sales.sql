-- Run this from the Snowflake worksheet or SnowSQL after choosing the database
-- and schema you want to use for the Snowpark lesson.

create or replace table CAR_SALES (
  SRC variant
);

create or replace file format CAR_SALES_JSON_FORMAT
  type = json
  strip_outer_array = false;

create or replace stage CAR_SALES_STAGE
  file_format = CAR_SALES_JSON_FORMAT;

-- From a local terminal with SnowSQL, upload the source file first:
-- put file:///Users/emilygao/LocalDocuments/Snowpark/data/car_sales.jsonl @CAR_SALES_STAGE auto_compress=false overwrite=true;

copy into CAR_SALES
from @CAR_SALES_STAGE/car_sales.jsonl
file_format = (format_name = CAR_SALES_JSON_FORMAT);

select
  SRC:dealership::string as dealership,
  SRC:vehicle[0].make::string as make,
  SRC:vehicle[0].model::string as model,
  SRC:vehicle[0].year::number as year,
  SRC:vehicle[0].price::number as price
from CAR_SALES
order by price desc;
