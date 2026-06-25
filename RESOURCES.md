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
- [Snowflake Docs: Snowpark flatten function](https://docs.snowflake.com/en/developer-guide/snowpark/reference/python/latest/snowpark/api/snowflake.snowpark.functions.flatten)
  Use when exploding arrays or objects from VARIANT, OBJECT, or ARRAY columns into rows.
- [Snowflake Docs: DataFrameWriter.save_as_table](https://docs.snowflake.com/en/developer-guide/snowpark/reference/python/latest/snowpark/api/snowflake.snowpark.DataFrameWriter.save_as_table)
  Use when materializing a Snowpark DataFrame as a Snowflake table with explicit write modes.
- [Snowflake Docs: Session.sql](https://docs.snowflake.com/en/developer-guide/snowpark/reference/python/latest/snowpark/api/snowflake.snowpark.Session.sql)
  Use when a Snowflake SQL statement is the clearest source for a lazy Snowpark DataFrame.
- [Snowflake Docs: Writing stored procedures with SQL and Python](https://docs.snowflake.com/en/developer-guide/stored-procedure/python/procedure-python-overview)
  Use when introducing Python handlers that run inside Snowflake and can perform Snowpark table work.
- [Snowflake Docs: Creating Python UDFs](https://docs.snowflake.com/en/developer-guide/udf/python/udf-python-creating)
  Use when teaching scalar row-level Python logic callable from SQL expressions.
- [Snowflake Docs: Introduction to external functions](https://docs.snowflake.com/en/sql-reference/external-functions-introduction)
  Use when teaching SQL functions that call remote HTTPS services through an API integration.
- [Snowflake Docs: Snowpark ML Feature Store](https://docs.snowflake.com/en/developer-guide/snowflake-ml/feature-store/overview)
  Use when teaching entities, feature views, feature descriptions, and dataset generation for reusable ML features.
- [Snowflake Docs: Snowflake ML Modeling](https://docs.snowflake.com/en/developer-guide/snowflake-ml/modeling)
  Use when teaching Snowpark ML preprocessing, model training workflows, and hyperparameter tuning concepts.
- [Snowflake Docs: Snowflake Model Registry](https://docs.snowflake.com/en/developer-guide/snowflake-ml/model-registry/overview)
  Use when teaching model version logging, metrics, inference, explainability, and model promotion.
- [Snowflake Docs: Model Observability](https://docs.snowflake.com/en/developer-guide/snowflake-ml/model-registry/model-observability)
  Use when teaching model monitors, source/baseline comparisons, drift metrics, and production model observation.
- [Dimensional modeling overview](https://en.wikipedia.org/wiki/Dimensional_modeling)
  Use when introducing fact grain, dimensions, and facts before building a star-schema data mart.
- [Star schema overview](https://en.wikipedia.org/wiki/Star_schema)
  Use when explaining fact tables surrounded by descriptive dimension tables.
- [Snowflake Docs: Introduction to tasks](https://docs.snowflake.com/en/user-guide/tasks-intro)
  Use for in-Snowflake scheduling, triggered execution, task graphs, retries, and monitoring.
- [dbt Docs: Deploy jobs](https://docs.getdbt.com/docs/deploy/deploy-jobs)
  Use for dbt Cloud/Platform scheduling, job chaining, run history, artifacts, and production dbt builds.
- [dbt Docs: Set up dbt with Snowflake](https://docs.getdbt.com/guides/snowflake)
  Use when creating a dbt Cloud project that connects to Snowflake and builds models in a Snowflake warehouse.
- [dbt Docs: Sources](https://docs.getdbt.com/docs/build/sources)
  Use when declaring raw Snowflake tables such as CAR_SALES as upstream inputs in dbt lineage.
- [dbt Docs: ref function](https://docs.getdbt.com/reference/dbt-jinja-functions/ref)
  Use when teaching model dependencies and DAG ordering between staging, dimension, fact, and bridge models.
- [dbt Docs: Data tests](https://docs.getdbt.com/docs/build/data-tests)
  Use when teaching dbt uniqueness, not-null, relationship, and custom SQL validation tests.
- [dbt Docs: Snowflake configurations](https://docs.getdbt.com/reference/resource-configs/snowflake-configs)
  Use when configuring Snowflake materializations and schemas for dbt models.
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
