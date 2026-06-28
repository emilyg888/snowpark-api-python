# Ingestion metadata tests completion

The user completed Lesson 33 by adding and validating dbt tests for source and staging ingestion metadata. This confirms that `SOURCE_FILE`, `SOURCE_SALE_KEY`, `LOAD_BATCH_ID`, `LOAD_TS`, and `SRC` are now tested from the raw source through persistent staging.

**Evidence**: `dbt build --select source:car_sales_source+` succeeded with 10 models and 54 tests, including source-level not-null tests for `LOAD_TS`, `SOURCE_FILE`, `SOURCE_SALE_KEY`, `LOAD_BATCH_ID`, and `SRC`, plus staging metadata tests across base, customer, vehicle, and extra models.
