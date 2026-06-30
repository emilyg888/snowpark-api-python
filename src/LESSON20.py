from __future__ import annotations

from dataclasses import dataclass
from datetime import datetime
from typing import Any
from uuid import uuid4

from snowflake.ml.data import DataConnector
from snowflake.ml.experiment import ExperimentTracking
from snowflake.ml.feature_store import CreationMode, FeatureStore
from snowflake.ml.modeling.preprocessing import OneHotEncoder
from snowflake.ml.modeling.xgboost import XGBClassifier
from snowflake.snowpark import DataFrame
from snowflake.snowpark.functions import col
from sklearn.metrics import f1_score, precision_score, recall_score

from snowpark_session import create_session
from LESSON19 import (
    COMPUTE_WAREHOUSE,
    DB,
    EXCLUDED_FEATURES,
    ID_COLS,
    LABEL_COL,
    OHE_COLS,
    PREDICTION_COL,
    ROLE,
    SCHEMA,
    SPINE_TABLE,
    TIMESTAMP_COL,
    VERSION_NUM,
)

EXPERIMENT_NAME = "MORTGAGE_HPO_SMALL"
TRIAL_CONFIGS = [
    {"max_depth": 3, "learning_rate": 0.10, "n_estimators": 25},
    {"max_depth": 5, "learning_rate": 0.15, "n_estimators": 35},
    {"max_depth": 8, "learning_rate": 0.08, "n_estimators": 50},
]

_CURRENT_TUNER_CONTEXT = None


@dataclass
class TunerContext:
    dataset_map: dict[str, DataConnector]
    hyper_params: dict[str, Any]
    trial_number: int
    experiment_tracking: ExperimentTracking
    run_name: str
    metrics: dict[str, float] | None = None
    model: XGBClassifier | None = None

    def get_dataset_map(self) -> dict[str, DataConnector]:
        return self.dataset_map

    def get_hyper_params(self) -> dict[str, Any]:
        return self.hyper_params

    def report(self, *, metrics: dict[str, float], model: XGBClassifier) -> None:
        self.metrics = metrics
        self.model = model
        self.experiment_tracking.log_params(self.hyper_params)
        self.experiment_tracking.log_metric("trial_number", float(self.trial_number))
        self.experiment_tracking.log_metrics(metrics)


def get_tuner_context() -> TunerContext:
    if _CURRENT_TUNER_CONTEXT is None:
        raise RuntimeError("get_tuner_context() can only be called inside a tuner trial.")
    return _CURRENT_TUNER_CONTEXT


def build_training_frames(session) -> tuple[DataFrame, DataFrame]:
    fs = FeatureStore(
        session=session,
        database=DB,
        name=SCHEMA,
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
        name=f"MORTGAGE_DATASET_HPO_{VERSION_NUM}",
        spine_df=spine_df,
        features=[loan_features],
        spine_label_cols=[LABEL_COL],
    )
    ds_sp = ds.read.to_snowpark_dataframe()

    encoder = OneHotEncoder(
        input_cols=OHE_COLS,
        output_cols=OHE_COLS,
        drop_input_cols=True,
    )
    encoded = encoder.fit(ds_sp).transform(ds_sp)
    return encoded.random_split(weights=[0.70, 0.30], seed=0)


def build_dataset_map(train: DataFrame, test: DataFrame) -> dict[str, DataConnector]:
    drop_cols = ID_COLS + [LABEL_COL]
    return {
        "x_train": DataConnector.from_dataframe(train.drop(*drop_cols)),
        "y_train": DataConnector.from_dataframe(train.select(LABEL_COL)),
        "x_test": DataConnector.from_dataframe(test.drop(*drop_cols)),
        "y_test": DataConnector.from_dataframe(test.select(LABEL_COL)),
    }


def _load_trial_data(dataset_map: dict[str, DataConnector]):
    x_train = dataset_map["x_train"].to_pandas()
    y_train = dataset_map["y_train"].to_pandas()
    x_test = dataset_map["x_test"].to_pandas()
    y_test = dataset_map["y_test"].to_pandas()

    feature_cols = list(x_train.columns)
    x_train[feature_cols] = x_train[feature_cols].fillna(0)
    x_test[feature_cols] = x_test[feature_cols].fillna(0)

    train_df = x_train.copy()
    test_df = x_test.copy()
    train_df[LABEL_COL] = y_train[LABEL_COL]
    test_df[LABEL_COL] = y_test[LABEL_COL]
    return train_df, test_df, feature_cols


def _classification_metrics(prefix: str, actual, predicted) -> dict[str, float]:
    return {
        f"F1_{prefix}": f1_score(actual, predicted),
        f"Precision_{prefix}": precision_score(actual, predicted),
        f"Recall_{prefix}": recall_score(actual, predicted),
    }


def train_func() -> dict[str, float]:
    tuner_context = get_tuner_context()
    config = tuner_context.get_hyper_params()
    dataset_map = tuner_context.get_dataset_map()
    train_df, test_df, feature_cols = _load_trial_data(dataset_map)

    model = XGBClassifier(
        input_cols=feature_cols,
        label_cols=[LABEL_COL],
        output_cols=[PREDICTION_COL],
        random_state=42,
        **config,
    )
    model.fit(train_df)

    train_predictions = model.predict(train_df)
    test_predictions = model.predict(test_df)
    metrics_to_log = {
        **_classification_metrics(
            "Train",
            train_predictions[LABEL_COL],
            train_predictions[PREDICTION_COL],
        ),
        **_classification_metrics(
            "Test",
            test_predictions[LABEL_COL],
            test_predictions[PREDICTION_COL],
        ),
    }
    tuner_context.report(metrics=metrics_to_log, model=model)
    return metrics_to_log


def run_small_tuner(
    dataset_map: dict[str, DataConnector],
    experiment_tracking: ExperimentTracking,
    trial_configs: list[dict[str, Any]],
) -> list[dict[str, Any]]:
    global _CURRENT_TUNER_CONTEXT

    results = []
    for trial_number, config in enumerate(trial_configs, start=1):
        run_name = f"mortgage_hpo_trial_{trial_number}_{uuid4().hex[:8]}"
        context = TunerContext(
            dataset_map=dataset_map,
            hyper_params=config,
            trial_number=trial_number,
            experiment_tracking=experiment_tracking,
            run_name=run_name,
        )

        print(f"Starting trial {trial_number}: {config}")
        experiment_tracking.start_run(run_name=run_name)
        try:
            _CURRENT_TUNER_CONTEXT = context
            metrics = train_func()
            results.append(
                {
                    "trial_number": trial_number,
                    "run_name": run_name,
                    "params": config,
                    "metrics": metrics,
                }
            )
            print(f"Trial {trial_number} metrics: {metrics}")
            experiment_tracking.end_run(status="FINISHED")
        except Exception:
            experiment_tracking.end_run(status="FAILED")
            raise
        finally:
            _CURRENT_TUNER_CONTEXT = None

    return results


def main():
    session = None

    try:
        session = create_session()
        session.use_role(ROLE)
        session.use_database(DB)
        session.use_schema(SCHEMA)
        session.use_warehouse(COMPUTE_WAREHOUSE)

        train, test = build_training_frames(session)
        dataset_map = build_dataset_map(train, test)

        experiment_tracking = ExperimentTracking(
            session=session,
            database_name=DB,
            schema_name=SCHEMA,
        )
        experiment_tracking.set_experiment(EXPERIMENT_NAME)
        print(
            f"Running {len(TRIAL_CONFIGS)} HPO trials in experiment "
            f"{EXPERIMENT_NAME} at {datetime.now().isoformat(timespec='seconds')}"
        )

        results = run_small_tuner(dataset_map, experiment_tracking, TRIAL_CONFIGS)
        best_trial = max(results, key=lambda row: row["metrics"]["F1_Test"])
        print("Best trial:", best_trial)

    finally:
        if session is not None:
            session.close()


if __name__ == "__main__":
    main()
