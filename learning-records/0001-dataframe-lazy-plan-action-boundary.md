# DataFrames as lazy plans with action boundaries

The user demonstrated the first Snowpark DataFrame mental model in `src/lesson1.py`: create a DataFrame from a Snowflake table, chain filters and projection as transformations, then trigger execution with `show()` only at the end. This establishes the baseline for future lessons on derived columns, aggregation, joins, and debugging generated SQL.

**Evidence**: The Lesson 1 file filters TPCH sample orders by status, total price, and priority before selecting columns and calling `show()`.
