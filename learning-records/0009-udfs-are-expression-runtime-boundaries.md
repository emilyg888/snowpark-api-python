# UDFs are expression runtime boundaries

The user completed Lesson 14 and can now distinguish Python UDFs from stored procedures: the UDF is created and tested inside Snowflake, but it is invoked inside SQL expressions with `SELECT` rather than with `CALL`. This unlocks future lessons on model scoring and feature cleanup because the user has tested a scalar reusable function against table rows.

**Evidence**: The user created and tested `NORMALIZE_EXTRA(EXTRA)` against `SNOWPARK_SAMPLE_DATA.PUBLIC.VEHICLE_EXTRAS`, producing normalized values such as `all_weather_mats`, `floor_mats`, `heated_seats`, `premium_audio`, `navigation`, `bed_liner`, and `tow_package`.
