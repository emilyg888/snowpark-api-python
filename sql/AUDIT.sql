create schema if not exists SNOWPARK_SAMPLE_DATA.RAW;

create table if not exists SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES_LOAD_AUDIT (
  LOAD_BATCH_ID string not null,
  SOURCE_FILE string not null,
  ADF_PIPELINE_RUN_ID string,
  DBT_CLOUD_RUN_ID string,
  STARTED_AT timestamp_ntz default current_timestamp(),
  FINISHED_AT timestamp_ntz,
  ROWS_LOADED number,
  DISTINCT_SOURCE_ROWS number,
  STATUS string,
  ERROR_MESSAGE string
);

insert into SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES_LOAD_AUDIT (
  LOAD_BATCH_ID,
  SOURCE_FILE,
  ADF_PIPELINE_RUN_ID,
  STATUS,
  STARTED_AT
)
values (
  'debug_batch_001',
  'car-sales/landing/car_sales_2026-06-29.json',
  'debug_pipeline_001',
  'STARTED',
  current_timestamp()
);

select *
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES_LOAD_AUDIT
order by STARTED_AT desc;

create or replace procedure SNOWPARK_SAMPLE_DATA.RAW.LOG_CAR_SALES_AUDIT_STARTED(
  LOAD_BATCH_ID string,
  SOURCE_FILE string,
  ADF_PIPELINE_RUN_ID string
)
returns string
language sql
execute as owner
as
$$
begin
  insert into SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES_LOAD_AUDIT (
    LOAD_BATCH_ID,
    SOURCE_FILE,
    ADF_PIPELINE_RUN_ID,
    STATUS,
    STARTED_AT
  )
  values (
    :LOAD_BATCH_ID,
    :SOURCE_FILE,
    :ADF_PIPELINE_RUN_ID,
    'STARTED',
    current_timestamp()
  );

  return 'STARTED audit inserted';
end;
$$;

select *
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES_LOAD_AUDIT
order by STARTED_AT desc;

create or replace procedure SNOWPARK_SAMPLE_DATA.RAW.LOAD_CAR_SALES_FILE(
  LOAD_BATCH_ID string,
  SOURCE_FILE string
)
returns string
language sql
execute as owner
as
$$
declare
  FILE_NAME string;
  COPY_SQL string;
begin
  FILE_NAME := replace(:SOURCE_FILE, 'car-sales/landing/', '');

  COPY_SQL := '
    copy into SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES (
      SRC,
      SOURCE_FILE,
      SOURCE_SALE_KEY,
      LOAD_BATCH_ID
    )
    from (
      select
        $1,
        metadata$filename,
        md5($1::string),
        ''' || :LOAD_BATCH_ID || '''
      from @SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES_STAGE
    )
    files = (''' || FILE_NAME || ''')
    file_format = SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES_JSON_FORMAT
    on_error = ''abort_statement''
  ';

  execute immediate COPY_SQL;

  return 'CAR_SALES file loaded: ' || FILE_NAME;
end;
$$;

select
  load_batch_id,
  source_file,
  count(*) as rows_loaded,
  count(distinct source_sale_key) as distinct_source_rows
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES
where load_batch_id = 'adf_debug_008'
group by load_batch_id, source_file; --car-sales/landing/car_sales_2026-06-30.json

select
  load_batch_id,
  source_file,
  count(*) as rows_loaded
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES
where source_file = 'car-sales/landing/car_sales_2026-06-30.json'
group by load_batch_id, source_file;

call SNOWPARK_SAMPLE_DATA.RAW.LOG_CAR_SALES_AUDIT_LOADED(
  'adf_debug_008',
  'car-sales/landing/car_sales_2026-06-30.json'
);

create or replace procedure SNOWPARK_SAMPLE_DATA.RAW.LOG_CAR_SALES_AUDIT_LOADED(
  LOAD_BATCH_ID string,
  SOURCE_FILE string
)
returns string
language sql
execute as owner
as
$$
begin
  update SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES_LOAD_AUDIT
  set
    ROWS_LOADED = (
      select count(*)
      from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES
      where LOAD_BATCH_ID = :LOAD_BATCH_ID
        and SOURCE_FILE = :SOURCE_FILE
    ),
    DISTINCT_SOURCE_ROWS = (
      select count(distinct SOURCE_SALE_KEY)
      from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES
      where LOAD_BATCH_ID = :LOAD_BATCH_ID
        and SOURCE_FILE = :SOURCE_FILE
    ),
    STATUS = 'LOADED',
    FINISHED_AT = current_timestamp()
  where LOAD_BATCH_ID = :LOAD_BATCH_ID
    and SOURCE_FILE = :SOURCE_FILE;

  return 'LOADED audit updated';
end;
$$;

select
  load_batch_id,
  source_file,
  rows_loaded,
  distinct_source_rows,
  status,
  started_at,
  finished_at
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES_LOAD_AUDIT
where load_batch_id = 'adf_debug_008'
  and source_file = 'car-sales/landing/car_sales_2026-06-30.json';

  select *
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES_LOAD_AUDIT
order by STARTED_AT desc;

show procedures like 'LOG_CAR_SALES_AUDIT_STARTED' in account;
show procedures like 'LOG_CAR_SALES_AUDIT_LOADED' in account;
show procedures like 'NOWPARK_SAMPLE_DATA.RAW.LOG_CAR_SALES_AUDIT_DBT_SUCCESS' in account;

select get_ddl('procedure', 'SNOWPARK_SAMPLE_DATA.RAW.LOG_CAR_SALES_AUDIT_STARTED(string,string,string)');


CREATE OR REPLACE PROCEDURE "LOG_CAR_SALES_AUDIT_STARTED"("LOAD_BATCH_ID" VARCHAR, "SOURCE_FILE" VARCHAR, "ADF_PIPELINE_RUN_ID" VARCHAR)
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS '
begin
  insert into SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES_LOAD_AUDIT (
    LOAD_BATCH_ID,
    SOURCE_FILE,
    ADF_PIPELINE_RUN_ID,
    STATUS,
    STARTED_AT
  )
  values (
    :LOAD_BATCH_ID,
    :SOURCE_FILE,
    :ADF_PIPELINE_RUN_ID,
    ''STARTED'',
    current_timestamp()
  );

  return ''STARTED audit inserted'';
end;
';

call SNOWPARK_SAMPLE_DATA.RAW.LOG_CAR_SALES_AUDIT_STARTED(
  'adf_debug_008',
  'car-sales/landing/car_sales_2026-06-30.json',
  'adf_debug_008'
);

update SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES_LOAD_AUDIT
set
  dbt_cloud_run_id = '70506183489089',
  status = 'DBT_SUCCESS',
  finished_at = current_timestamp(),
  error_message = null
where load_batch_id = 'adf_debug_008'
  and source_file = 'car-sales/landing/car_sales_2026-06-30.json';

create or replace procedure SNOWPARK_SAMPLE_DATA.RAW.LOG_CAR_SALES_AUDIT_DBT_SUCCESS(
  LOAD_BATCH_ID string,
  SOURCE_FILE string,
  DBT_CLOUD_RUN_ID string
)
returns string
language sql
execute as owner
as
$$
begin
  update SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES_LOAD_AUDIT
  set
    DBT_CLOUD_RUN_ID = :DBT_CLOUD_RUN_ID,
    STATUS = 'DBT_SUCCESS',
    FINISHED_AT = current_timestamp(),
    ERROR_MESSAGE = null
  where LOAD_BATCH_ID = :LOAD_BATCH_ID
    and SOURCE_FILE = :SOURCE_FILE;

  return 'DBT_SUCCESS audit updated';
end;
$$;
call SNOWPARK_SAMPLE_DATA.RAW.LOG_CAR_SALES_AUDIT_DBT_SUCCESS(
  'adf_debug_008',
  'car-sales/landing/car_sales_2026-06-30.json',
  '70506183487272'
);

select
  load_batch_id,
  source_file,
  dbt_cloud_run_id,
  status,
  rows_loaded,
  distinct_source_rows,
  started_at,
  finished_at
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES_LOAD_AUDIT
where load_batch_id = 'adf_debug_008'
order by started_at desc;

select
  load_batch_id,
  count(*) as rows_loaded,
  count(distinct source_sale_key) as distinct_source_rows
from SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES
--where load_batch_id = '<ADF_PIPELINE_RUN_ID>'
group by load_batch_id;