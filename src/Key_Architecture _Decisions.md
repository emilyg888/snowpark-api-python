# Key Architecture Decisions

## What runs in CI?

Unit tests and Snowflake smoke tests.

## What runs in CD?

Deploy Snowpark Python source files from GitHub to the Snowflake workspace.

## What runs as a dbt job?

Version-controlled SQL transformation models, dbt tests, docs, and source freshness checks.

## What should become a Snowflake Task?

Scheduled or event-driven in-Snowflake workloads, especially stored procedures or Snowpark Python procedures that should run inside Snowflake.

## What would justify adding Azure Data Factory?

Azure-native data ingestion, external system copy jobs, trigger-based pipelines, and enterprise monitoring across Azure services.

## GitHub Actions

### What triggered the workflow?

CI can be triggered by:

- Push to `main`
- Pull request to `main`
- Manual run from GitHub Actions
- Manual CLI run:

```bash
gh workflow run CI --repo emilyg888/snowpark-api-python --ref main

Deploy Workspace is manually triggered:
gh workflow run deploy-workspace.yml --repo emilyg888/snowpark-api-python --ref main

GitHub workflow can be run in two ways:

1. Terminal:
   gh workflow run deploy-workspace.yml \
    --repo emilyg888/snowpark-api-python
   --ref main
   then to check the run:
   gh run list --workflow="deploy-workspace.yml" --limit 1

2. Github Actions --> Deploy Workspace --> Run

Which job proved the Python code works locally?
Unit testing:
python -m pytest tests

Which step proved Snowflake credentials work?
Smoke testing:
python src/smoke_connection.py

gh secret list --repo emilyg888/snowpart-api-python
checks that secret names exist. `python src/smoke_connection.py` checks that the secrets actually work.

Which step published files to the Snowflake workspace?
CD, Current Deployment Map
The Upload lesson files to Snowflake workspace step in deploy-workspace.yml publishes:

src/LESSON1.py -> snow://workspace/USER$.PUBLIC.DEFAULT$/versions/head/LESSON1/
src/LESSON2.py -> snow://workspace/USER$.PUBLIC.DEFAULT$/versions/head/LESSON2/
src/LESSON3.py -> snow://workspace/USER$.PUBLIC.DEFAULT$/versions/head/LESSON3/
```
