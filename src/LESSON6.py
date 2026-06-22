# Join TPCH orders to customers.
from snowflake.snowpark.functions import col

from snowpark_session import create_session

ORDERS_TABLE = "SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS"
CUSTOMERS_TABLE = "SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER"

OUTPUT_COLUMNS = [
    "ORDER_KEY",
    "CUSTOMER_NAME",
    "ORDER_STATUS",
    "ORDER_TOTAL",
    "ORDER_DATE",
]


def build_orders_with_customers(session):
    orders = session.table(ORDERS_TABLE)
    customers = session.table(CUSTOMERS_TABLE)
    return (
        orders
        .join(
            customers,
            orders["O_CUSTKEY"] == customers["C_CUSTKEY"],
            join_type="inner",
        )
        .select(
            orders["O_ORDERKEY"].as_("ORDER_KEY"),
            customers["C_NAME"].as_("CUSTOMER_NAME"),
            orders["O_ORDERSTATUS"].as_("ORDER_STATUS"),
            orders["O_TOTALPRICE"].as_("ORDER_TOTAL"),
            orders["O_ORDERDATE"].as_("ORDER_DATE"),
        )
        .sort(col("ORDER_TOTAL").desc())
    )


def main():
    session = create_session()
    try:
        orders_with_customers = build_orders_with_customers(session)
        orders_with_customers.show()
    finally:
        session.close()


if __name__ == "__main__":
    main()
