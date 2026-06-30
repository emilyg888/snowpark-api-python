# Mission: Convert IFRS9 SAS 9 Code To Snowflake

## Why
The goal is to migrate IFRS9 credit-risk and expected-credit-loss code from SAS 9 into Snowflake without losing auditability, data lineage, or calculation intent. The learning path starts with familiar `PROC SQL` patterns and gradually moves toward Snowflake SQL, Snowpark DataFrames, stored procedures, tasks, and model-governed production workflows.

## Success looks like
- Read a SAS 9 `PROC SQL` block and translate it into idiomatic Snowflake SQL.
- Rebuild IFRS9 staging, joins, aggregations, and ECL calculations in Snowflake.
- Use Snowpark examples to express reusable transformations and validation checks.
- Explain when to use SQL, Snowpark, stored procedures, streams, tasks, and tables.
- Produce migration work that is testable, reconcilable, and understandable to risk, finance, and audit reviewers.

## Constraints
- Lessons should follow the existing Snowpark teaching style: short HTML lessons, examples first, hands-on exercises, and quick references.
- The path should assume SAS 9 familiarity but not assume deep Snowflake engineering experience.
- IFRS9 examples should use the synthetic dataset in `/Users/emilygao/LocalDocuments/Projects/bb_datasets/ifrs9`, not real customer or regulated production data.

## Out of scope
- Building a full IFRS9 production model from scratch.
- Giving accounting, regulatory, legal, or audit sign-off advice.
- Replacing model governance, validation, or controls owned by risk and finance teams.
