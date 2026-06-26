# dbt Staging JSON Arrays

Lesson 23 is complete: the user built the dbt staging layer for `CAR_SALES`, including base source extraction and flattened customer and vehicle array models. This establishes that the user can read Snowflake JSON path syntax in dbt models and understands why `source_sale_key` plus array indexes preserve grain before mart tables are built.

**Evidence**: `dbt build --select staging` completed successfully with `3` staging models and `9` tests passing; the full downstream build also processed `8` models and `29` tests successfully.
