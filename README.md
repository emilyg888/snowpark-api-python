# snowpark-api-python

Snowpark Python learning project with local VS Code support, unit tests, and a GitHub Actions CI workflow.

## Local verification

```bash
cd /Users/emilygao/LocalDocuments/Snowpark
/Users/emilygao/miniconda3/envs/snowpark-py312/bin/python -m pytest tests
/Users/emilygao/miniconda3/envs/snowpark-py312/bin/python src/smoke_connection.py
```

## GitHub Actions CI

The workflow at `.github/workflows/ci.yml` runs:

1. Unit tests with `pytest`.
2. A Snowflake smoke test using `src/smoke_connection.py`.

Add these GitHub repository secrets before expecting the Snowflake smoke test to run:

```text
SNOWFLAKE_ACCOUNT
SNOWFLAKE_USER
SNOWFLAKE_PASSWORD
SNOWFLAKE_ROLE
SNOWFLAKE_WAREHOUSE
SNOWFLAKE_DATABASE
SNOWFLAKE_SCHEMA
```

The workflow generates `~/.snowflake/connections.toml` inside the temporary GitHub Actions runner. Do not commit your local `~/.snowflake/connections.toml`.
