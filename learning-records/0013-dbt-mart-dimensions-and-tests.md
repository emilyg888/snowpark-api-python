# dbt Mart Dimensions and Tests

Lesson 25 is complete: the user built the dbt mart dimension tables for customers, vehicles, sales persons, and extras, and validated key uniqueness, not-null constraints, and relationship tests against the fact and bridge models. This confirms the user can use dbt tests to protect dimensional keys and understand why `EXTRA_KEY` belongs in the bridge while `DIM_EXTRAS` stores the descriptive extra value.

**Evidence**: `dbt build --select dim_customers dim_vehicles dim_sales_persons dim_extras` completed with `4` models and `14` tests passing; summary was `18 total | 18 success`. The only warning was a local dbt platform credential expiry, not a model or test failure.
