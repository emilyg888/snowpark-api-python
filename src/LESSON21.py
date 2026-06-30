import re

from snowpark_session import create_session

from snowflake.ml.modeling.xgboost import XGBClassifier
from snowflake.ml.registry import Registry
from sklearn.metrics import f1_score, precision_score, recall_score

from LESSON19 import (
    COMPUTE_WAREHOUSE,
    DB,
    ID_COLS,
    LABEL_COL,
    PREDICTION_COL,
    ROLE,
    SCHEMA,
)
from LESSON20 import build_training_frames

MODEL_NAME = "MORTGAGE_LENDING_MODEL"
BASE_VERSION = "XGB_BASE"


def safe_feature_name(name: str) -> str:
    safe_name = re.sub(r"[^0-9A-Za-z_]", "_", name).upper()
    if safe_name and safe_name[0].isdigit():
        safe_name = f"F_{safe_name}"
    return safe_name


def rename_feature_columns(train_pd, test_pd):
    rename_map = {}
    used_names = set(train_pd.columns)
    for col_name in train_pd.columns:
        if col_name in ID_COLS + [LABEL_COL]:
            continue

        safe_name = safe_feature_name(col_name)
        candidate = safe_name
        suffix = 2
        while candidate in used_names and candidate != col_name:
            candidate = f"{safe_name}_{suffix}"
            suffix += 1
        if candidate != col_name:
            rename_map[col_name] = candidate
            used_names.add(candidate)

    return train_pd.rename(columns=rename_map), test_pd.rename(columns=rename_map)


def prepare_pandas_data(train, test):
    train_pd = train.to_pandas()
    test_pd = test.to_pandas()
    train_pd, test_pd = rename_feature_columns(train_pd, test_pd)

    feature_cols = [
        col_name
        for col_name in train_pd.columns
        if col_name not in ID_COLS + [LABEL_COL]
    ]
    train_pd[feature_cols] = train_pd[feature_cols].fillna(0)
    test_pd[feature_cols] = test_pd[feature_cols].fillna(0)
    return train_pd, test_pd, feature_cols


def classification_metrics(actual, predicted):
    return {
        "F1_Test": f1_score(actual, predicted),
        "Precision_Test": precision_score(actual, predicted),
        "Recall_Test": recall_score(actual, predicted),
    }


def get_existing_model_version(model_registry: Registry):
    try:
        return model_registry.get_model(MODEL_NAME).version(BASE_VERSION)
    except Exception:
        return None


def main():
    session = None

    try:
        session = create_session()
        session.use_role(ROLE)
        session.use_database(DB)
        session.use_schema(SCHEMA)
        session.use_warehouse(COMPUTE_WAREHOUSE)

        train, test = build_training_frames(session)
        train_pd, test_pd, feature_cols = prepare_pandas_data(train, test)

        xgb_base = XGBClassifier(
            input_cols=feature_cols,
            label_cols=[LABEL_COL],
            output_cols=[PREDICTION_COL],
            max_depth=5,
            n_estimators=35,
            learning_rate=0.15,
            random_state=42,
        )
        xgb_base.fit(train_pd)

        local_predictions = xgb_base.predict(test_pd)
        metrics = classification_metrics(
            local_predictions[LABEL_COL],
            local_predictions[PREDICTION_COL],
        )
        print("Baseline metrics:", metrics)

        model_registry = Registry(
            session=session,
            database_name=DB,
            schema_name=SCHEMA,
            options={"enable_monitoring": True},
        )

        mv_base = get_existing_model_version(model_registry)
        if mv_base is None:
            mv_base = model_registry.log_model(
                model=xgb_base,
                model_name=MODEL_NAME,
                version_name=BASE_VERSION,
                metrics=metrics,
                sample_input_data=train_pd[feature_cols].head(100),
                target_platforms=["SNOWPARK_CONTAINER_SERVICES"],
                options={"enable_explainability": True},
            )
        else:
            print(f"Reusing existing {MODEL_NAME} version {BASE_VERSION}.")

        model_registry.get_model(MODEL_NAME).default = BASE_VERSION
        try:
            reg_preds = mv_base.run(test_pd[feature_cols], function_name="predict")
            print("Registry prediction sample:")
            print(reg_preds.head())
        except ValueError as exc:
            print("Skipping registry inference:", exc)

        print(f"Registered {MODEL_NAME} version {BASE_VERSION} and set it as default.")

    finally:
        if session is not None:
            session.close()


if __name__ == "__main__":
    main()
