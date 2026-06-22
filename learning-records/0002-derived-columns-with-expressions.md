# Derived columns with Snowpark expressions

The user completed Lesson 2 and now has working code for adding derived columns with `with_column`, `col`, `lit`, and `when(...).otherwise(...)` in `src/LESSON2.py`. This unlocks aggregation lessons because the user can now prepare grouping labels and numeric measures before summarizing data.

**Evidence**: `src/LESSON2.py` adds `IS_HIGH_VALUE`, `ORDER_URGENCY`, and `ROUNDED_ORDERS`, and `tests/test_lesson2.py` verifies the builder adds those derived columns without triggering `show()`.
