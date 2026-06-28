# Demo DAG versus production ingestion

The user intentionally separated a teaching DAG for Lessons 1-12 from the production ADLS ingestion flow. This matters because future lessons should show ADF as the enterprise orchestrator for file arrival, raw persistence, dbt Cloud triggering, and archive/reject handling, while Snowflake task graphs remain useful for Snowflake-native demo or runtime chains.
