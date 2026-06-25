# Star Schema Grain and dbt Conversion

Lesson 16 is complete: the car sales JSON was modeled as dimensions, a vehicle-sales fact, and an extras bridge, with the fact grain defined as one source sale plus customer plus vehicle combination. The user resolved key-design questions around hashed dimension keys, bridge-table keys, nested flattening, and validation checks; this now unlocks dbt Cloud lessons that convert the same working SQL into sources, staging models, marts, tests, and deployment jobs.

**Evidence**: The corrected `sql/LESSON16.sql` ran successfully in Snowflake with no duplicate dimension keys or orphaned fact keys; row counts were `DIM_SALES_PERSONS=5`, `DIM_CUSTOMERS=6`, `DIM_VEHICLES=6`, `FACT_VEHICLE_SALES=6`, and `BRIDGE_VEHICLE_SALE_EXTRAS=12`.
