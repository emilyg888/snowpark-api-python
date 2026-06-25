create or replace procedure REFRESH_VEHICLE_PRICES()
returns string
language python
runtime_version = '3.12',
packages = ('snowflake-snowpark-python'),
handler = 'refresh_vehicle_prices'
as
$$
from snowflake.snowpark.functions import col
from snowflake.snowpark.types import IntegerType, StringType

CAR_SALES_TABLE = "SNOWPARK_SAMPLE_DATA.PUBLIC.CAR_SALES"
TARGET_TABLE = "SNOWPARK_SAMPLE_DATA.PUBLIC.VEHICLE_PRICES"

def refresh_vehicle_prices(session):
    car_sales = session.table(CAR_SALES_TABLE)

    vehicle_prices = (
        car_sales
        .select(
            col("SRC")["dealership"].cast(StringType()).as_("DEALERSHIP"),
            col("SRC")["vehicle"][0]["make"].cast(StringType()).as_("MAKE"),
            col("SRC")["vehicle"][0]["model"].cast(StringType()).as_("MODEL"),
            col("SRC")["vehicle"][0]["year"].cast(IntegerType()).as_("YEAR"),
            col("SRC")["vehicle"][0]["price"].cast(IntegerType()).as_("PRICE")
        )
    )

    vehicle_prices.write.save_as_table(TARGET_TABLE, mode="overwrite")
    return "VEHICLE_PRICES refreshed"
$$;

--call REFRESH_VEHICLE_PRICES();
