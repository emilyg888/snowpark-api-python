# Key Architecture Decisions

## Which python
Use the course environment: snowpark-py312.
In a terminal:
snowpark-env

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
checks that the secrets exists and actually work.


Which step published files to the Snowflake workspace?
 gh workflow run deploy-workspace.yml \
  --repo emilyg888/snowpark-api-python \
  --ref main

The Upload lesson files to Snowflake workspace step in deploy-workspace.yml publishes:

src/LESSON1.py -> snow://workspace/USER$.PUBLIC.DEFAULT$/versions/head/LESSON1/
src/LESSON2.py -> snow://workspace/USER$.PUBLIC.DEFAULT$/versions/head/LESSON2/
src/LESSON3.py -> snow://workspace/USER$.PUBLIC.DEFAULT$/versions/head/LESSON3/
```
### Check secret exists
gh secret list --repo emilyg888/snowpart-api-python

## Orchestration
Write down which lessons belong to CI, dbt Cloud, Snowflake tasks, or external orchestration.
### CI: Lessons 1-12
Snowpark Python scripts, local tests, smoke checks, DataFrame patterns.

### dbt Cloud job: Lessons 22-26
dbt Cloud source, staging, marts, tests, deployment job.

### Snowflake tasks: Lessons 13-16
Stored procedure, UDF, external function, SQL star-schema model.

### External Orchestration: Lessons 1-12 + Lessons 17-21
Snowpark Python scripts, local tests, smoke checks, DataFrame patterns.
Snowpark ML lab work: features, training, registry, monitoring.

### Keep dbt Cloud as the owner of the mart deployment job.
### Use GitHub Actions for repo checks, not as the primary daily data scheduler.
### Only add Airflow, Dagster, or Prefect when you need one control plane across Snowflake, data lake files, APIs, and ML.

### Key decisions
If the enterprise is Azure-first and ADF is already standard:
  choose Azure Data Factory as the top-level orchestrator.

If the enterprise needs cloud-agnostic orchestration across many platforms:
  choose Airflow.

If the enterprise wants asset-centric data/ML lineage:
  consider Dagster.

### ADF pipeline
  -> copy/source files from on-prem or ADLS
  -> load raw files into Snowflake raw table
  -> run Snowflake SQL/procedure setup where needed
  -> call dbt Cloud API to run "Build car sales mart"
  -> wait/check dbt job result
  -> optionally trigger Snowpark ML workflow
  -> notify Teams/Email on success/failure

# Key Orchestration Layers

GitHub Actions
  deploy code assets

ADF
  top-level enterprise orchestration

Snowflake Task DAG
  Snowflake-native dependency chain

dbt Cloud
  production MART dependency chain