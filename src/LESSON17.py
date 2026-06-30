from snowpark_session import create_session
from snowflake.snowpark import Session
from snowflake.connector.pandas_tools import write_pandas
import pandas as pd


VERSION_NUM = "0"
DB = "E2E_SNOW_MLOPS_DB"
SCHEMA = "MLOPS_SCHEMA"
COMPUTE_WAREHOUSE = "E2E_SNOW_MLOPS_WH"
ROLE = "E2E_SNOW_MLOPS_ROLE"
CSV_FILE = "/Users/emilygao/LocalDocuments/Snowflake/sfguide-build-end-to-end-ml-workflow-in-snowflake-main/MORTGAGE_LENDING_DEMO_DATA.csv.zip"
TABLE_NAME = "MORTGAGE_LENDING_DEMO_DATA"



def create_table_from_csv(session, csv_url, table_name):
    df_pandas = pd.read_csv(csv_url)
    print(f"Loaded CSV rows: {len(df_pandas)}")
    print(f"Loaded CSV columns: {list(df_pandas.columns)}")

#   session.create_dataframe(df_pandas).write.mode("overwrite").save_as_table(table_name)
    session.write_pandas(df_pandas, table_name, auto_create_table=True, overwrite=True)

def main():
    session = create_session()
    session.use_role(ROLE)
    session.use_database(DB)
    session.use_schema(SCHEMA)
    session.use_warehouse(COMPUTE_WAREHOUSE)

    try:
        df = session.table(TABLE_NAME)
        row_count = df.count()
        print(f"{TABLE_NAME} row count: {row_count}")
        if row_count == 0:
            print(f"{TABLE_NAME} is empty, reloading CSV")
            create_table_from_csv(session, CSV_FILE, TABLE_NAME)

    except Exception as e:
        print(e)
        create_table_from_csv(session, CSV_FILE, TABLE_NAME)

    session.table(TABLE_NAME).limit(10).show()


if __name__ == "__main__":
    main()