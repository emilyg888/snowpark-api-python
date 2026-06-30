# Ingestion audit and run control completed

Lesson 36 is complete: the user implemented the audit flow through `STARTED`, `LOADED`, and dbt completion logging, including storing row counts and the dbt Cloud run id in `RAW.CAR_SALES_LOAD_AUDIT`. This gives the E2E pipeline a durable control table for troubleshooting, replay decisions, and run lineage.

**Evidence**: `LOG_CAR_SALES_AUDIT_STARTED`, `LOAD_CAR_SALES_FILE`, `LOG_CAR_SALES_AUDIT_LOADED`, and `LOG_CAR_SALES_AUDIT_DBT_SUCCESS` were created or used, and the logging step ran successfully.
