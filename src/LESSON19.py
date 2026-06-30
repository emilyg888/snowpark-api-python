from snowpark_session import create_session

from snowflake.ml.feature_store import FeatureStore
from snowflake.ml.feature_store import CreationMode
from snowflake.ml.modeling.xgboost import XGBClassifier
from snowflake.ml.modeling.preprocessing import OneHotEncoder
from snowflake.snowpark.functions import col
from sklearn.metrics import f1_score, precision_score, recall_score

VERSION_NUM = "0"
DB = "E2E_SNOW_MLOPS_DB"
SCHEMA = "MLOPS_SCHEMA"
COMPUTE_WAREHOUSE = "E2E_SNOW_MLOPS_WH"
ROLE = "E2E_SNOW_MLOPS_ROLE"
OHE_COLS = ["LOAN_TYPE_NAME", "LOAN_PURPOSE_NAME"]
SPINE_TABLE = "MORTGAGE_LENDING_DEMO_DATA"
LABEL_COL = "MORTGAGERESPONSE"
TIMESTAMP_COL = "TIMESTAMP"
ID_COLS = ["LOAN_ID", TIMESTAMP_COL]
PREDICTION_COL = "MORTGAGE_PREDICTION"
EXCLUDED_FEATURES = {"TS", LABEL_COL}


def main():
    session = None

    try:
        session = create_session()
        session.use_role(ROLE)
        session.use_database(DB)
        session.use_schema(SCHEMA)
        session.use_warehouse(COMPUTE_WAREHOUSE)
        fs = FeatureStore(
            session=session,
            database=DB,
            name=SCHEMA,  # MLOPS_SCHEMA
            default_warehouse=COMPUTE_WAREHOUSE,
            creation_mode=CreationMode.CREATE_IF_NOT_EXIST,
        )

        loan_fv = fs.get_feature_view(name="Mortgage_Feature_View", version=VERSION_NUM)
        loan_feature_names = [
            str(feature_name).strip('"')
            for feature_name in loan_fv.feature_names
            if str(feature_name).strip('"') not in EXCLUDED_FEATURES
        ]
        loan_features = loan_fv.slice(loan_feature_names)
        spine_df = session.table(SPINE_TABLE).select(
            "LOAN_ID",
            col("TS").as_(TIMESTAMP_COL),
            LABEL_COL,
        )

        ds = fs.generate_dataset(
            name=f"MORTGAGE_DATASET_EXTENDED_FEATURES_{VERSION_NUM}",
            spine_df=spine_df,
            features=[loan_features],
            spine_label_cols=[LABEL_COL],
        )
        print("Feature view:", loan_fv)

        ds_sp = ds.read.to_snowpark_dataframe()
        print("Dataset schema:")
        ds_sp.print_schema()
        print("Dataset sample:")
        ds_sp.limit(5).show()

        snowml_ohe = OneHotEncoder(
            input_cols=OHE_COLS,
            output_cols=OHE_COLS,
            drop_input_cols=True,
        )
        ds_sp_ohe = snowml_ohe.fit(ds_sp).transform(ds_sp)

        train, test = ds_sp_ohe.random_split(weights=[0.70, 0.30], seed=0)
        train_pd = train.to_pandas()
        test_pd = test.to_pandas()

        feature_cols = [
            col_name
            for col_name in train_pd.columns
            if col_name not in ID_COLS + [LABEL_COL]
        ]
        train_pd[feature_cols] = train_pd[feature_cols].fillna(0)
        test_pd[feature_cols] = test_pd[feature_cols].fillna(0)

        xgb_base = XGBClassifier(
            input_cols=feature_cols,
            label_cols=[LABEL_COL],
            output_cols=[PREDICTION_COL],
            max_depth=50,
            n_estimators=3,
            learning_rate=0.75,
        )
        xgb_base.fit(train_pd)

        predictions = xgb_base.predict(test_pd)
        print("F1 score:", f1_score(predictions[LABEL_COL], predictions[PREDICTION_COL]))
        print(
            "Precision:",
            precision_score(predictions[LABEL_COL], predictions[PREDICTION_COL]),
        )
        print("Recall:", recall_score(predictions[LABEL_COL], predictions[PREDICTION_COL]))

    finally:
        if session is not None:
            session.close()


if __name__ == "__main__":
    main()
