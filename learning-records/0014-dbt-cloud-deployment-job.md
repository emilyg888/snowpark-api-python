# dbt Cloud Deployment Job

Lesson 26 is complete: the user created a dbt Cloud production deployment job for the car sales mart and ran `dbt build --select source:car_sales_source+` successfully from dbt Cloud against Snowflake. This confirms the user can move from local dbt development to a managed dbt Cloud deployment flow with Git, a Snowflake connection, production environment settings, and deployment run verification.

**Evidence**: The dbt Cloud run succeeded after cloning the repository, creating the Snowflake profile, running `dbt deps`, and invoking `dbt build --select source:car_sales_source+`; the user also verified the resulting Snowflake mart objects.
