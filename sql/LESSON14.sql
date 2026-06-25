-- Create the lesson input table if Lesson 11 has not materialized it yet.
create or replace table SNOWPARK_SAMPLE_DATA.PUBLIC.VEHICLE_EXTRAS as
select
  SRC:dealership::string as DEALERSHIP,
  SRC:vehicle[0].make::string as MAKE,
  SRC:vehicle[0].model::string as MODEL,
  extra.value::string as EXTRA
from SNOWPARK_SAMPLE_DATA.PUBLIC.CAR_SALES,
  lateral flatten(input => SRC:vehicle[0].extras) extra
where extra.value is not null;

create or replace function SNOWPARK_SAMPLE_DATA.PUBLIC.NORMALIZE_EXTRA(extra string)
returns string
language python
runtime_version = '3.12'
handler = 'normalize_extra'
as
$$
def normalize_extra(extra):
    if extra is None:
        return None
    return extra.strip().lower().replace(" ", "_")
$$;

select
  EXTRA,
  SNOWPARK_SAMPLE_DATA.PUBLIC.NORMALIZE_EXTRA(EXTRA) as NORMALIZED_EXTRA
from SNOWPARK_SAMPLE_DATA.PUBLIC.VEHICLE_EXTRAS
order by EXTRA;
