# CI/CD runner and smoke test boundaries

The user completed Lesson 5 and can now explain the GitHub Actions CI/CD flow: unit tests prove Python behavior, the Snowflake smoke test proves repository secrets can create a working Snowflake connection, and the deploy workflow publishes selected files to Snowflake workspace folders. This unlocks future deployment work because the user can distinguish checking secret presence from proving credential validity.

**Evidence**: The user drafted the Lesson 5 architecture section and corrected the distinction between `gh secret list`, `python -m pytest tests`, and `python src/smoke_connection.py`.
