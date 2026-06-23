# Window functions preserve row grain

The user completed Lesson 8 and can now use a Snowpark window expression such as `row_number().over(status_window)` to rank rows inside partitions without collapsing the DataFrame like `group_by` would. This unlocks analytical patterns such as top-N per group, where each output row remains an original business row with added context.

**Evidence**: The user worked through `src/LESSON8.py`, asked about `.with_column("STATUS_RANK", row_number().over(status_window))`, and moved on to Lesson 9 semi-structured data.
