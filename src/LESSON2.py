# Query urgent shipped orders from TPCH sample data
from snowflake.snowpark.functions import col, lit, when

from snowpark_session import create_session

ORDERS_TABLE = "SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS"

# Keep the displayed columns explicit so the final Snowpark DataFrame has a
# predictable order, including the lesson's two derived columns.
OUTPUT_COLUMNS = [
    "O_ORDERKEY",
    "O_CUSTKEY",
    "O_ORDERSTATUS",
    "O_TOTALPRICE",
    "ROUNDED_ORDERS",
    "O_ORDERDATE",
    "O_ORDERPRIORITY",
    "O_CLERK",
    "O_SHIPPRIORITY",
    "O_COMMENT",
    "IS_HIGH_VALUE",
    "ORDER_URGENCY"
]


def build_urgent_shipped_orders(session):
    # Start from Snowflake's shared TPCH sample ORDERS table. Snowpark keeps
    # these transformations lazy until an action, such as show(), is called.
    orders = session.table(ORDERS_TABLE)
    return (
        orders
        # Only include shipped/fulfilled orders.
        .filter(col("O_ORDERSTATUS") == lit("F"))
        # Focus the result set on high-value orders for this lesson.
        .filter(col("O_TOTALPRICE") >= 30000)
        # Narrow the result to orders Snowflake marks as urgent priority.
        .filter(col("O_ORDERPRIORITY") == lit("1-URGENT"))
        # Add a boolean flag that can be reused by downstream consumers.
        .with_column("IS_HIGH_VALUE", col("O_TOTALPRICE") >= lit(30000))
        # Convert Snowflake's priority code into a simpler business label.
        .with_column(
            "ORDER_URGENCY",
            when(col("O_ORDERPRIORITY") == lit("1-URGENT"), lit("URGENT"))
            .otherwise(lit("STANDARD"))
        )
        # Express total price in thousands to make large order values easier to scan.
        .with_column(
            "ROUNDED_ORDERS",
            (col("O_TOTALPRICE") / lit(1000))
        )
        # Project only the columns needed for the lesson output.
        .select(*OUTPUT_COLUMNS)
    )


def main():
    # create_session centralizes Snowflake connection settings for local runs.
    session = create_session()
    try:
        urgent_shipped_orders = build_urgent_shipped_orders(session)
        # show() is the action that sends the lazy Snowpark query to Snowflake.
        urgent_shipped_orders.show()
    finally:
        # Always close the session so local credentials and warehouse resources
        # are released even if the query fails.
        session.close()


if __name__ == "__main__":
    main()
