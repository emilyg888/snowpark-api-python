# Stored procedure runtime boundary

The user completed Lesson 13 and can now distinguish local SQL authoring from Snowflake procedure execution: `REFRESH_VEHICLE_PRICES()` is created as a Snowflake object, runs its Python handler inside Snowflake with an injected `session`, and writes a durable `VEHICLE_PRICES` table. This unlocks future lessons on UDFs, tasks, and operational ML workflows because the user has tested the command boundary and verified the table side effect.

**Evidence**: The user ran `call REFRESH_VEHICLE_PRICES();` and validated `SNOWPARK_SAMPLE_DATA.PUBLIC.VEHICLE_PRICES` with `ROW_COUNT = 6`, `MISSING_DEALERSHIP = 0`, `MISSING_MAKE = 0`, and `MISSING_PRICE = 0`.
