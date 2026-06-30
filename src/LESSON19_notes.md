Key Structure In LESSON19.py
This script turns the registered Feature Store work from Lesson 18 into a trainable mortgage model dataset, then trains and evaluates a baseline XGBoost classifier.
Session setup
-> connect to Snowflake
-> set role, database, schema, warehouse

Feature Store lookup
-> open the feature store
-> fetch the registered mortgage feature view
-> select only model-safe feature columns

Spine
-> define the row grain for training
-> one row per loan and timestamp
-> includes the label MORTGAGERESPONSE

Dataset generation
-> join the spine to the feature view
-> produce a model-ready dataset

Preprocessing
-> one-hot encode categorical columns
-> split into train/test
-> fill missing feature values

Model training
-> train XGBClassifier
-> predict on test rows
-> print F1, precision, and recall

Cleanup
-> always close the Snowpark session
The most important idea is the spine:
spine*df = session.table(SPINE_TABLE).select(
"LOAN_ID",
col("TS").as*(TIMESTAMP*COL),
LABEL_COL,
)
The spine says: “Build one training row for this loan at this timestamp, with this known label.” Feature Store then attaches the feature columns from:
loan_features = loan_fv.slice(loan_feature_names)
This line prevents the model from using excluded columns like the label or timestamp as features:
EXCLUDED_FEATURES = {"TS", LABEL_COL}
Then generate_dataset() performs the Feature Store join:
ds = fs.generate_dataset(
name=f"MORTGAGE_DATASET_EXTENDED_FEATURES*{VERSION_NUM}",
spine_df=spine_df,
features=[loan_features],
spine_label_cols=[LABEL_COL],
)
So the core mental model is:
spine rows + registered feature view -> generated dataset -> preprocessing -> model -> metrics
One caution: this baseline pulls data into pandas with to_pandas(), which is fine for a lesson-sized dataset but not the scalable production pattern. Also max_depth=50 is intentionally aggressive; for a baseline, max_depth=5 is usually more sensible.

18:23

what does this mean:
loan_features = loan_fv.slice(loan_feature_names)

18:28

This line selects only some columns/features from the registered feature view:
loan_features = loan_fv.slice(loan_feature_names)
Think of loan_fv as the full registered feature view from Lesson 18. It may contain columns like:
LOAN_ID
TS
MONTH
DAY_OF_YEAR
LOAN_AMOUNT
INCOME
INCOME_LOAN_RATIO
MORTGAGERESPONSE
But for model training, you do not want every column as a feature. You usually exclude:
EXCLUDED_FEATURES = {"TS", LABEL_COL}
because:
TS is a timestamp used for point-in-time lookup, not a model input
MORTGAGERESPONSE is the label/target, so using it as a feature would leak the answer
So this part builds a clean list:
loan_feature_names = [
str(feature_name).strip('"')
for feature_name in loan_fv.feature_names
if str(feature_name).strip('"') not in EXCLUDED_FEATURES
]
Then:
loan_features = loan_fv.slice(loan_feature_names)
means: “Use this feature view, but only these selected feature columns.”
That sliced feature view is then passed to:
features=[loan_features]
inside:
fs.generate_dataset(...)
So Feature Store joins the spine to only the model-safe features, instead of bringing every column from the full feature view.
