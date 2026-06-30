# IFRS9 SAS-To-Snowflake Resources

## Knowledge

- [Local synthetic IFRS9 dataset](/Users/emilygao/LocalDocuments/Projects/bb_datasets/ifrs9/README.md)
  Course dataset for all hands-on lessons. Use its CSVs, SAS batch program, lineage file, and data dictionary before inventing any new examples.
- [SAS 9.4 SQL Procedure User's Guide](https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/sqlproc/titlepage.htm)
  Primary reference for `PROC SQL` behavior, syntax, joins, summary functions, and table creation in SAS 9 migrations.
- [Snowflake SQL SELECT reference](https://docs.snowflake.com/en/sql-reference/sql/select)
  Use for translating `select`, `where`, `group by`, `qualify`, CTEs, aliases, and query order into Snowflake SQL.
- [Snowflake SQL CREATE TABLE reference](https://docs.snowflake.com/en/sql-reference/sql/create-table)
  Use for replacing SAS work tables, permanent tables, and CTAS patterns with Snowflake table objects.
- [Snowpark Python Developer Guide](https://docs.snowflake.com/en/developer-guide/snowpark/python/index)
  Use when a lesson moves from pure SQL into Python DataFrame transformations, procedures, and reusable validation.
- [Snowpark Python DataFrame API](https://docs.snowflake.com/en/developer-guide/snowpark/reference/python/latest/snowpark/api/snowflake.snowpark.DataFrame)
  Use for DataFrame operations such as `select`, `filter`, `join`, `group_by`, and `save_as_table`.
- [Snowflake Tasks Introduction](https://docs.snowflake.com/en/user-guide/tasks-intro)
  Use when turning IFRS9 migration steps into scheduled Snowflake-native pipelines.
- [IFRS Foundation: IFRS 9 Financial Instruments](https://www.ifrs.org/issued-standards/list-of-standards/ifrs-9-financial-instruments/)
  Canonical entry point for the IFRS 9 standard. Use for terminology and scope, not as a substitute for licensed standard text or internal policy.
- [IFRS Foundation: IFRS 9 expected credit loss educational material](https://www.ifrs.org/supporting-implementation/supporting-materials-by-ifrs-standards/ifrs-9/)
  Use for public implementation support material around impairment and expected credit losses.

## Wisdom (Communities)

- Internal risk, finance, and model validation forums
  Use for testing whether translated calculations preserve policy intent and audit evidence.
- [Snowflake Community](https://community.snowflake.com/)
  Use for implementation questions about Snowflake SQL, Snowpark, task graphs, and performance tradeoffs.

## Gaps

- Add your organization's IFRS9 policy, model documentation, data dictionary, and reconciliation thresholds before using these lessons on real code.
