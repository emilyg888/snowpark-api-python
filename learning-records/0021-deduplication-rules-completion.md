# Deduplication rules completion

The user completed Lesson 32 by loading multiple daily car sales files, including a file with an intentional duplicate source sale, and validating that the dbt flow still produced unique fact and bridge grains. This confirms the design where `RAW.CAR_SALES` keeps load history while `stg_car_sales_base` deduplicates to the latest row per `SOURCE_SALE_KEY`.

**Evidence**: `dbt build --select source:car_sales_source+` succeeded after three files were loaded into `RAW.CAR_SALES`; `unique_fact_vehicle_sales_SALE_KEY` and `unique_combination_of_columns_bridge_vehicle_sale_extras_sale_key__extra_key` both passed.
