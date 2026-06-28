use database SNOWPARK_SAMPLE_DATA;
use schema PUBLIC;

-- Lesson 29 demo DAG:
-- This is intentionally a teaching DAG for Lessons 1-12. It records orchestration
-- checkpoints rather than pretending every learning script is a production step.

create schema if not exists ORCHESTRATION;

create or replace table ORCHESTRATION.LESSON_RUN_AUDIT (
  RUN_ID string,
  STEP_NAME string,
  STEP_GROUP string,
  STATUS string,
  MESSAGE string,
  CREATED_AT timestamp_ntz default current_timestamp()
);

create or replace procedure ORCHESTRATION.LOG_LESSON_STEP(
  RUN_ID string,
  STEP_NAME string,
  STEP_GROUP string,
  STATUS string,
  MESSAGE string
)
returns string
language sql
execute as owner
as
$$
begin
  insert into ORCHESTRATION.LESSON_RUN_AUDIT (
    RUN_ID,
    STEP_NAME,
    STEP_GROUP,
    STATUS,
    MESSAGE
  )
  values (
    :RUN_ID,
    :STEP_NAME,
    :STEP_GROUP,
    :STATUS,
    :MESSAGE
  );

  return STEP_NAME || ': ' || STATUS;
end;
$$;

alter task if exists ORCHESTRATION.TASK_L01_L04_DATAFRAME_CORE suspend;
alter task if exists ORCHESTRATION.TASK_L05_L07_DEPLOY_AND_DEBUG suspend;
alter task if exists ORCHESTRATION.TASK_L08_L12_ADVANCED_DATAFRAME_FLOW suspend;
alter task if exists ORCHESTRATION.TASK_L01_L12_DEMO_DAG_DONE suspend;

create or replace task ORCHESTRATION.TASK_L01_L04_DATAFRAME_CORE
  warehouse = COMPUTE_WH
  schedule = 'USING CRON 0 8 * * * Australia/Sydney'
as
  call ORCHESTRATION.LOG_LESSON_STEP(
    uuid_string(),
    'LESSONS_01_04',
    'Snowpark DataFrame core',
    'READY',
    'Lessons 1-4 scripts are deployed; use this demo task as the graph root.'
  );

create or replace task ORCHESTRATION.TASK_L05_L07_DEPLOY_AND_DEBUG
  warehouse = COMPUTE_WH
  after ORCHESTRATION.TASK_L01_L04_DATAFRAME_CORE
as
  call ORCHESTRATION.LOG_LESSON_STEP(
    uuid_string(),
    'LESSONS_05_07',
    'CI deployment and debugging',
    'READY',
    'GitHub Actions uploaded workspace scripts; debugging lessons are available for manual execution.'
  );

create or replace task ORCHESTRATION.TASK_L08_L12_ADVANCED_DATAFRAME_FLOW
  warehouse = COMPUTE_WH
  after ORCHESTRATION.TASK_L05_L07_DEPLOY_AND_DEBUG
as
  call ORCHESTRATION.LOG_LESSON_STEP(
    uuid_string(),
    'LESSONS_08_12',
    'Window, semi-structured, flatten, result boundary, save',
    'READY',
    'Advanced Snowpark API scripts are deployed; run individual scripts when teaching or validating behavior.'
  );

create or replace task ORCHESTRATION.TASK_L01_L12_DEMO_DAG_DONE
  warehouse = COMPUTE_WH
  after ORCHESTRATION.TASK_L08_L12_ADVANCED_DATAFRAME_FLOW
as
  call ORCHESTRATION.LOG_LESSON_STEP(
    uuid_string(),
    'LESSONS_01_12_DAG_COMPLETE',
    'Demo orchestration',
    'SUCCESS',
    'The Lessons 1-12 demo DAG completed. ADF can trigger this graph only as an orchestration demo.'
  );

-- Resume child tasks before the scheduled root task.
alter task ORCHESTRATION.TASK_L01_L12_DEMO_DAG_DONE resume;
alter task ORCHESTRATION.TASK_L08_L12_ADVANCED_DATAFRAME_FLOW resume;
alter task ORCHESTRATION.TASK_L05_L07_DEPLOY_AND_DEBUG resume;
alter task ORCHESTRATION.TASK_L01_L04_DATAFRAME_CORE resume;

-- Manual smoke run:
-- execute task ORCHESTRATION.TASK_L01_L04_DATAFRAME_CORE;

-- Monitor:
-- select *
-- from table(information_schema.task_history(
--   task_name => 'TASK_L01_L04_DATAFRAME_CORE',
--   result_limit => 20
-- ))
-- order by scheduled_time desc;

-- Audit:
-- select *
-- from ORCHESTRATION.LESSON_RUN_AUDIT
-- order by CREATED_AT desc;
