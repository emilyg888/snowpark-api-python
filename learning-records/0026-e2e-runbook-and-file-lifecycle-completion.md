# E2E runbook and file lifecycle completed

Lesson 37 is complete: the user connected the operational runbook pieces for the car sales workflow, including the final archive step design from ADLS `landing` to `archive` after successful dbt completion. This completes the intended pipeline shape: ADF owns file orchestration, Snowflake owns raw load and audit procedures, and dbt Cloud owns mart transformation.

**Evidence**: The user completed the ADF-to-dbt execution path, added `docs/adf_config.md` to `.gitignore` for environment-specific configuration, and configured the ADLS archive step with the correct container-versus-folder distinction.
