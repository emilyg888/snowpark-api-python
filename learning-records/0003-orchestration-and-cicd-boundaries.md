# Orchestration and CI/CD boundaries

The user completed Lesson 4 and can distinguish deployment-time workflows from run-time data orchestration. This matters because future Snowpark work should keep GitHub Actions focused on CI/CD, dbt focused on SQL model builds, Snowflake Tasks focused on in-Snowflake schedules, and Azure Data Factory reserved for Azure-native ingestion or cross-service orchestration.

**Evidence**: The user drafted key architecture decisions and asked for review, including what belongs in CI/CD, dbt jobs, Snowflake Tasks, and Azure Data Factory.
