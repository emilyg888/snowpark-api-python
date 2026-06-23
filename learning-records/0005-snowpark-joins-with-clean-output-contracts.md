# Snowpark joins with clean output contracts

The user completed Lesson 6 and can now build a Snowpark join between TPCH orders and customers with an explicit join condition, clean output aliases, and `show()` kept at the action boundary. This unlocks debugging and multi-table transformation lessons because the user can now reason about both row matching and post-join output shape.

**Evidence**: `src/LESSON6.py` defines `build_orders_with_customers(session)`, `tests/test_lesson6.py` verifies the join, selected aliases, descending sort, import safety, and session lifecycle, and the full test suite passed with 15 tests.
