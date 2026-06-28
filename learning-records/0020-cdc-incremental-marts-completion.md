# CDC incremental marts completion

The user completed Lesson 31 by converting the car sales marts to incremental dbt models with merge semantics, lineage metadata, and CDC-style load timestamp filtering. This establishes the production mart pattern where persistent staging remains reusable and the dimension, fact, and bridge tables handle incremental persistence.

**Evidence**: `dbt build --full-refresh --select staging+` succeeded with 10 models and 49 tests passing, including incremental `dim_sales_persons`, `dim_vehicles`, `dim_customers`, `dim_extras`, `fact_vehicle_sales`, and `bridge_vehicle_sale_extras`.
