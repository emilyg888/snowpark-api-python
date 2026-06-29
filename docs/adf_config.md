Yes. The two big changes are correct:
Modify staging to persistent staging
Add CDC / incremental logic in MART tables
The full outstanding E2E checklist is:

1. ADLS Landing
   Create and standardize:
   car-sales/landing/
   car-sales/archive/
   car-sales/rejected/
   You already have the file in landing/.
2. Snowflake External Access
   Complete and verify:
   list @SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES_STAGE;
   This proves the Azure storage integration, stage, and IAM are correct.
3. Persistent RAW Table
   Use RAW.CAR_SALES as the durable landing table:
   SRC
   SOURCE_FILE
   SOURCE_SALE_KEY
   LOAD_BATCH_ID
   LOAD_TS
   Potential additions:
   FILE_ROW_NUMBER
   RECORD_STATUS
4. Change dbt Source
   Update [sources.yml](/Users/emilygao/LocalDocuments/Snowpark/dbt_car_sales/models/sources.yml) from:
   SNOWPARK_SAMPLE_DATA.PUBLIC.CAR_SALES
   to:
   SNOWPARK_SAMPLE_DATA.RAW.CAR_SALES
5. Persistent Staging
   Current staging models like [stg_car_sales_base.sql](/Users/emilygao/LocalDocuments/Snowpark/dbt_car_sales/models/staging/stg_car_sales_base.sql) are simple views. For E2E production, make staging persistent, likely tables or incremental tables.
   Add metadata through staging:
   SOURCE_FILE
   SOURCE_SALE_KEY
   LOAD_BATCH_ID
   LOAD_TS
6. CDC / Incremental MART Logic
   Add dbt incremental configs to:
   dim_customers
   dim_vehicles
   dim_sales_persons
   dim_extras
   fact_vehicle_sales
   bridge_vehicle_sale_extras
   For now, use Type 1 dimensions and incremental facts. Later, Type 2 dimensions can be a separate lesson.
7. Deduplication Rule
   Decide what happens if the same JSON row is loaded twice.
   Minimum rule:
   SOURCE_SALE_KEY identifies exact duplicate source records.
   Better later:
   SALE_ID = stable business key
   RECORD_HASH = changed attribute detection
8. dbt Tests Need Updates
   Add tests for ingestion metadata:
   not_null SOURCE_FILE
   not_null LOAD_BATCH_ID
   not_null LOAD_TS
   not_null SOURCE_SALE_KEY
   unique SOURCE_SALE_KEY maybe only in curated staging, not raw
   Raw may contain duplicate load attempts, so be careful where uniqueness is enforced.
9. ADF Pipeline
   Build ADF flow:
   Get Metadata from ADLS landing
   Run Snowflake COPY INTO RAW.CAR_SALES
   Validate row count for LOAD_BATCH_ID
   Trigger dbt Cloud job

dbt Cloud account id
70506183144734
job id
70506183134104
API token
dbtc_qAXdOU06i2yxuilhdC3O0m3u9jaqN1jOAEIz2IZ_PNCOU7AhzI
https://my896.us1.dbt.com/deploy/70506183144734/projects/70506183146515/jobs/70506183134104/settings

Method: POST
URL: https://my896.us1.dbt.com/api/v2/accounts/70506183144734/jobs/70506183134104/run/
Headers:
Authorization: Bearer dbtc_qAXdOU06i2yxuilhdC3O0m3u9jaqN1jOAEIz2IZ_PNCOU7AhzI
Content-Type: application/json
Body:
{"cause": "ADF car sales pipeline"}

Poll dbt Cloud job result
run_id: 70506183489089

call SNOWPARK_SAMPLE_DATA.RAW.LOG_CAR_SALES_AUDIT_DBT_SUCCESS(
  @pipeline().RunId,
  'car-sales/landing/car_sales_2026-06-30.json',
  '70506183489089'
);

Move file to archive or rejected 10. dbt Cloud Job
The job already works, but after source changes it must be rerun with:
dbt build --select source:car_sales_source+ 11. Audit / Run Control
Add one ingestion audit table, for example:
RAW.CAR_SALES_LOAD_AUDIT
Columns:
LOAD_BATCH_ID
SOURCE_FILE
STARTED_AT
FINISHED_AT
ROWS_LOADED
STATUS
ERROR_MESSAGE
ADF_PIPELINE_RUN_ID
DBT_CLOUD_RUN_ID 12. Documentation / Lesson Updates
Update course materials so the story is consistent:
Lesson 16 = prototype MART SQL
Lessons 22-26 = production dbt MART
Lesson 29 = ADF + ADLS + Snowflake ingestion
Next lesson = persistent staging + CDC marts
So the missing pieces are not just staging and CDC. The E2E workflow also needs source redirection to RAW, metadata propagation, dedupe rules, updated tests, ADF pipeline, audit table, and dbt Cloud rerun after the source change.
