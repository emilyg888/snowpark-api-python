use role accountadmin;
use database ifrs9;
create schema if not exists sample_data;
use schema ifrs9.sample_data;

-- Dataset source for this lesson:
-- /Users/emilygao/LocalDocuments/Projects/bb_datasets/ifrs9/ifrs9_loan_account.csv
--
-- Load that CSV into IFRS9.LOAN_ACCOUNT before running this lesson. The source
-- file stores *_DT fields as SAS numeric dates, where 0 = 1960-01-01.
-- The dataset's DDL sketch is:
-- /Users/emilygao/LocalDocuments/Projects/bb_datasets/ifrs9/sas_programs/ifrs9_snowflake_mapping.sql

-- SAS pattern being migrated:
-- %let as_of_dt = '31MAY2026'd;
--
-- proc sql;
--   create table ifrs9.stage_result as
--   select
--       a.account_id,
--       a.cust_id,
--       a.portfolio_cd,
--       a.prod_cd,
--       a.drawn_amt,
--       a.undrawn_amt,
--       a.dpd,
--       a.curr_risk_grade,
--       case
--         when a.default_flg = 'Y' or a.dpd >= 90 then '3'
--         when a.dpd >= 30 or a.forbearance_flg = 'Y' then '2'
--         else '1'
--       end as ifrs9_stage length=1,
--       a.as_of_dt
--   from crdmart.loan_account a
--   where a.as_of_dt = &as_of_dt;
-- quit;
/* 
create or replace table STAGE_RESULT as
select
  ACCOUNT_ID,
  CUST_ID,
  PORTFOLIO_CD,
  PROD_CD,
  DRAWN_AMT,
  UNDRAWN_AMT,
  DPD,
  CURR_RISK_GRADE,
  case
    when DEFAULT_FLG = 'Y' or DPD >= 90 then '3'
    when DPD >= 30 or FORBEARANCE_FLG = 'Y' then '2'
    else '1'
  end as IFRS9_STAGE,
  dateadd(day, AS_OF_DT, date '1960-01-01') as AS_OF_DT
from LOAN_ACCOUNT
where dateadd(day, AS_OF_DT, date '1960-01-01') = date '2026-05-31';

select * from STAGE_RESULT order by ACCOUNT_ID limit 20;

select
  IFRS9_STAGE,
  count(*) as ACCOUNT_COUNT,
  sum(DRAWN_AMT) as TOTAL_DRAWN_AMT,
  sum(UNDRAWN_AMT) as TOTAL_UNDRAWN_AMT
from STAGE_RESULT
group by IFRS9_STAGE
order by IFRS9_STAGE;

-- Control checks for reconciliation against the SAS run and source field.
select 'SOURCE_ROWS_AT_CUTOFF' as CONTROL_NAME, count(*) as CONTROL_VALUE
from LOAN_ACCOUNT
where dateadd(day, AS_OF_DT, date '1960-01-01') = date '2026-05-31'
union all
select 'STAGED_ROWS', count(*)
from STAGE_RESULT
union all
select 'STAGE_MISMATCHES_VS_SOURCE', count(*)
from STAGE_RESULT s
join LOAN_ACCOUNT a using (ACCOUNT_ID)
where s.IFRS9_STAGE <> a.IFRS9_STAGE;
*/