# Save the cleaned vehicle price DataFrame as a Snowflake table.
from LESSON9 import build_vehicle_prices
from snowpark_session import create_session

TARGET_TABLE = "SNOWPARK_SAMPLE_DATA.PUBLIC.VEHICLE_PRICES"


def save_vehicle_prices(session, mode="overwrite"):
    vehicle_prices = build_vehicle_prices(session)
    vehicle_prices.write.save_as_table(TARGET_TABLE, mode=mode)


def main():
    session = create_session()
    try:
        save_vehicle_prices(session, mode="overwrite")
        session.table(TARGET_TABLE).show()
    finally:
        session.close()


if __name__ == "__main__":
    main()
