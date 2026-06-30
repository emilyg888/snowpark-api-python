# dbt Cloud source-redirection run completed

Lesson 35 is complete: the user successfully triggered the dbt Cloud job from ADF after the raw file load, and dbt Cloud rebuilt the production mart flow from the redirected `RAW.CAR_SALES` source. This confirms the productionized mart path is the dbt Cloud job, not the prototype Lesson 16 SQL script.

**Evidence**: ADF triggered the dbt Cloud job, and the dbt Cloud run completed successfully.
