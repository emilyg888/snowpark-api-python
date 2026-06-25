# Extract typed columns from a semi-structured CAR_SALES source.
from snowflake.snowpark.functions import col, flatten
from snowflake.snowpark.types import StringType
from snowpark_session import create_session

CAR_SALES_TABLE = "SNOWPARK_SAMPLE_DATA.PUBLIC.CAR_SALES"
OUTPUT_COLUMNS = [
    "DEALERSHIP",
    "MAKE",
    "MODEL",
    "EXTRA",
]
TARGET_TABLE = "SNOWPARK_SAMPLE_DATA.PUBLIC.VEHICLE_EXTRAS"

def build_vehicle_extras(session):
    car_sales = session.table(CAR_SALES_TABLE)
    return (
        car_sales
        .select(
            col("SRC")["dealership"].cast(StringType()).as_("DEALERSHIP"),
            col("SRC")["vehicle"][0]["make"].cast(StringType()).as_("MAKE"),
            col("SRC")["vehicle"][0]["model"].cast(StringType()).as_("MODEL"),
            flatten(col("SRC")["vehicle"][0]["extras"])
        )
        .select(
            "DEALERSHIP",
            "MAKE",
            "MODEL",
            col("VALUE").cast(StringType()).as_("EXTRA")
        )
        .filter(col("EXTRA").is_not_null())
        .sort(*OUTPUT_COLUMNS)
    )

def save_vehicle_extras(session, mode="overwrite"):
    vehicle_extras = build_vehicle_extras(session)
    vehicle_extras.write.save_as_table(TARGET_TABLE, mode=mode)

def main():
    session = create_session()
    try:
        save_vehicle_extras(session, mode="overwrite")
        session.table(TARGET_TABLE).show()
    finally:
        session.close()


if __name__ == "__main__":
    main()
