# Persistent staging completion

The user completed Lesson 30 by converting the car sales dbt staging layer from views into persistent tables and carrying ingestion metadata through the staging models. This establishes the production contract that staging rows remain inspectable after ADF loads and can be traced back to `SOURCE_FILE`, `SOURCE_SALE_KEY`, `LOAD_BATCH_ID`, and `LOAD_TS`.

**Evidence**: `dbt build --select staging` succeeded with 4 staging table models and 26 tests passing. The passing tests include metadata checks for `SOURCE_FILE`, `LOAD_BATCH_ID`, and `LOAD_TS` across the staging layer.
