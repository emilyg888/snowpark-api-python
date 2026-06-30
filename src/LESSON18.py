from snowflake.ml.feature_store.feature_store import FeatureStore, CreationMode
from snowflake.ml.feature_store.feature_view import FeatureView
from snowflake.ml.feature_store.entity import Entity
from snowpark_session import create_session
from snowflake.snowpark import Session, dataframe as df
from snowflake.snowpark.functions import col, call_function

VERSION_NUM = "0"
DB = "E2E_SNOW_MLOPS_DB"
SCHEMA = "MLOPS_SCHEMA"
COMPUTE_WAREHOUSE = "E2E_SNOW_MLOPS_WH"
ROLE = "E2E_SNOW_MLOPS_ROLE"
TABLE_NAME = "MORTGAGE_LENDING_DEMO_DATA"


def main():
    try:
        print("Creating Snowpark session...")
        session = create_session()
        session.use_role(ROLE)
        session.use_database(DB)
        session.use_schema(SCHEMA)
        session.use_warehouse(COMPUTE_WAREHOUSE)
        df = session.table(TABLE_NAME)
        print(f"{TABLE_NAME} row count:", df.count())
        df.limit(5).show()
        print("Creating FeatureStore...")
        fs = FeatureStore(
            session=session,
            database=DB,
            name=SCHEMA,
            default_warehouse=COMPUTE_WAREHOUSE,
            creation_mode=CreationMode.CREATE_IF_NOT_EXIST,
        )

        print("Session context:")
        session.sql("""
        select
          current_role() as ROLE,
          current_database() as DB,
          current_schema() as SCHEMA,
          current_warehouse() as WAREHOUSE
        """).show()

        print("Registering entity...")
        loan_entity = Entity(
            name="LOAN_ENTITY",
            join_keys=["LOAN_ID"],
            desc="Features defined on a per loan level",
        )
        fs.register_entity(loan_entity)

        print("Building feature DataFrame...")
        feature_df = df.select([
            "LOAN_ID",
            call_function("TO_TIMESTAMP", col("TS")).as_("TS"),
            "LOAN_TYPE_NAME",
            "LOAN_PURPOSE_NAME",
            "MORTGAGERESPONSE",
            "LOAN_AMOUNT_000S",
            "APPLICANT_INCOME_000S",
        ])

        print("Creating FeatureView...")
        loan_fv = FeatureView(
            name="Mortgage_Feature_View",
            entities=[loan_entity],
            feature_df=feature_df,
            refresh_freq="1 day",
        )

        print("Registering FeatureView...")
        fs.register_feature_view(loan_fv, version=VERSION_NUM, overwrite=True)

        print("FeatureView registered:")
        print(loan_fv)

        print("Done.")

    finally:
        session.close()


if __name__ == "__main__":
    main()
