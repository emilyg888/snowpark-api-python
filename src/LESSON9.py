# Extract typed columns from a semi-structured CAR_SALES source.
from snowflake.snowpark.functions import col
from snowflake.snowpark.types import IntegerType, StringType
from snowpark_session import create_session

CAR_SALES_TABLE = "SNOWPARK_SAMPLE_DATA.PUBLIC.CAR_SALES"
OUTPUT_COLUMNS = [
    "DEALERSHIP",
    "MAKE",
    "MODEL",
    "YEAR",
    "PRICE",
]


def build_vehicle_prices(session):
    car_sales = session.table(CAR_SALES_TABLE)
    return (
        car_sales
        .select(
            col("SRC")["dealership"].cast(StringType()).as_("DEALERSHIP"),
            col("SRC")["vehicle"][0]["make"].cast(StringType()).as_("MAKE"),
            col("SRC")["vehicle"][0]["model"].cast(StringType()).as_("MODEL"),
            col("SRC")["vehicle"][0]["year"].cast(IntegerType()).as_("YEAR"),
            col("SRC")["vehicle"][0]["price"].cast(IntegerType()).as_("PRICE"),
        )
        .sort(col("PRICE").desc())
    )


def main():
    session = create_session()
    try:
        vehicle_prices_result = build_vehicle_prices(session)
        vehicle_prices_result.print_schema()
        vehicle_prices_result.show()
    finally:
        session.close()


if __name__ == "__main__":
    main()
