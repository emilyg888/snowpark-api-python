--Minimum Runbook Commands
-- Check files visible to Snowflake
use schema SNOWPARK_SAMPLE_DATA.RAW;
list @SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES_STAGE;

-- Check latest raw load
select *
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES_LOAD_AUDIT
order by started_at desc;

-- Check current batch rows
select load_batch_id, count(*)
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES
group by load_batch_id
order by load_batch_id desc;