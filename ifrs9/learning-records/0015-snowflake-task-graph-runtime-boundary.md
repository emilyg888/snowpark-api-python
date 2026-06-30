# Snowflake Task Graph Runtime Boundary

Lesson 28 teaches that Snowflake tasks schedule SQL statements and callable Snowflake objects, not local `.sql` files. The user is now connecting Lessons 13-16 into a task graph: the stored procedure is called directly, the UDF is used inside a query, the external function remains optional until its API integration and endpoint are deployed, and the multi-statement star-schema SQL is promoted into a stored procedure before scheduling.

**Evidence**: The lesson and starter script define a root scheduled task plus child tasks using `after`, with `MART.REFRESH_CAR_SALES_STAR_SCHEMA()` as the wrapper for the Lesson 16 mart refresh.
