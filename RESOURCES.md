# Snowpark DataFrame API Resources

## Knowledge

- [Snowflake Docs: Working with DataFrames in Snowpark Python](https://docs.snowflake.com/en/developer-guide/snowpark/python/working-with-dataframes)
  Primary learning source for creating DataFrames, applying transformations, using columns, joining, and triggering actions.
- [Snowflake Docs: Snowpark Python DataFrame API Reference](https://docs.snowflake.com/en/developer-guide/snowpark/reference/python/latest/snowpark/api/snowflake.snowpark.DataFrame)
  Method-level reference for exact DataFrame signatures and edge cases.
- [Snowflake Docs: DataFrame.explain](https://docs.snowflake.com/en/developer-guide/snowpark/reference/python/latest/snowpark/api/snowflake.snowpark.DataFrame.explain)
  Use for inspecting query plans while debugging or tuning Snowpark DataFrames.
- [Snowflake Docs: DataFrame.group_by](https://docs.snowflake.com/en/developer-guide/snowpark/reference/python/latest/snowpark/api/snowflake.snowpark.DataFrame.group_by)
  Use for grouping rows and applying aggregate functions such as count, sum, average, minimum, and maximum.
- [Snowflake Docs: DataFrame.join](https://docs.snowflake.com/en/developer-guide/snowpark/reference/python/latest/snowpark/api/snowflake.snowpark.DataFrame.join)
  Use for joining two Snowpark DataFrames, choosing join types, and writing explicit join conditions.
- [Snowflake Docs: Creating a Session for Snowpark Python](https://docs.snowflake.com/en/developer-guide/snowpark/python/creating-session)
  Use when wiring local notebooks or Streamlit apps to Snowflake.
- [Snowflake Docs: Introduction to tasks](https://docs.snowflake.com/en/user-guide/tasks-intro)
  Use for in-Snowflake scheduling, triggered execution, task graphs, retries, and monitoring.
- [dbt Docs: Deploy jobs](https://docs.getdbt.com/docs/deploy/deploy-jobs)
  Use for dbt Cloud/Platform scheduling, job chaining, run history, artifacts, and production dbt builds.
- [Microsoft Learn: Snowflake connector for Azure Data Factory and Synapse](https://learn.microsoft.com/en-us/azure/data-factory/connector-snowflake)
  Use when Azure-native pipelines need to copy or transform data with Snowflake as a source or sink.
- [Apache Airflow Snowflake provider](https://airflow.apache.org/docs/apache-airflow-providers-snowflake/stable/index.html)
  Use when evaluating Airflow as a Python DAG orchestrator for Snowflake workloads.
- [Dagster Snowflake integration](https://docs.dagster.io/integrations/libraries/snowflake)
  Use when evaluating asset-oriented orchestration with Snowflake.
- [Dagster dbt integration](https://docs.dagster.io/integrations/libraries/dbt)
  Use when evaluating orchestration that treats dbt models as assets.
- [Prefect Snowflake integration](https://docs.prefect.io/integrations/prefect-snowflake)
  Use when evaluating Python-first workflow orchestration with Snowflake tasks and flows.
- [GitHub Docs: Understanding GitHub Actions](https://docs.github.com/en/actions)
  Use for workflow structure, triggers, jobs, steps, runners, and action syntax.
- [GitHub Docs: Using secrets in GitHub Actions](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions)
  Use for safely injecting Snowflake credentials into CI/CD jobs without committing secrets.
- [Snowflake Docs: Snowflake CLI](https://docs.snowflake.com/en/developer-guide/snowflake-cli/index)
  Use for Snowflake CLI commands such as workspace or stage file copy operations in local and CI/CD environments.
- [PyPI: snowflake-snowpark-python](https://pypi.org/project/snowflake-snowpark-python/)
  Use for installed/latest package version checks and Python version compatibility.

## Wisdom (Communities)

- [Snowflake Community](https://community.snowflake.com/)
  Use for real-world Snowpark troubleshooting, idioms, and environment issues.
- [Stack Overflow: snowpark-python](https://stackoverflow.com/questions/tagged/snowpark-python)
  Use for narrow API errors and examples from other practitioners.

## Gaps

- Add project-specific Snowflake schema/table notes after the first real dataset is chosen.
