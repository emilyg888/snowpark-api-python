# Query top 5 orders from TPCH_SF1.ORDERS by each order status
from snowflake.snowpark.functions import col, row_number
from snowflake.snowpark.window import Window
from snowpark_session import create_session

ORDERS_TABLE = "SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS"
OUTPUT_COLUMNS = [
    "O_ORDERKEY",
    "O_CUSTKEY",
    "O_ORDERSTATUS",
    "O_TOTALPRICE",
    "O_ORDERDATE",
    "STATUS_RANK",
]

status_window = (
    Window
    .partition_by(col("O_ORDERSTATUS"))
    .order_by(col("O_TOTALPRICE").desc())
)

def build_top_orders_by_status(session):
    orders = session.table(ORDERS_TABLE)
    return (
        orders
        .with_column("STATUS_RANK", row_number().over(status_window))
        .filter(col("STATUS_RANK") <= 5)
        .select(*OUTPUT_COLUMNS)
        .sort("O_ORDERSTATUS", "STATUS_RANK")
    )


def main():
    session = create_session()
    try:
        top_orders_by_status = build_top_orders_by_status(session)
        top_orders_by_status.show()
    finally:
        session.close()

if __name__ == "__main__":
    main()
