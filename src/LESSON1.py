# Query urgent shipped orders from TPCH sample data
# Co-authored with CoCo
from snowflake.snowpark.context import get_active_session
from snowflake.snowpark.functions import col, lit

ORDERS_TABLE = "SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS"
OUTPUT_COLUMNS = [
    "O_ORDERKEY",
    "O_CUSTKEY",
    "O_ORDERSTATUS",
    "O_TOTALPRICE",
    "O_ORDERDATE",
    "O_ORDERPRIORITY",
    "O_CLERK",
    "O_SHIPPRIORITY",
    "O_COMMENT",
]


def build_urgent_shipped_orders(session):
    orders = session.table(ORDERS_TABLE)
    return (
        orders
        .filter(col("O_ORDERSTATUS") == lit("F"))
        .filter(col("O_TOTALPRICE") >= 30000)
        .filter(col("O_ORDERPRIORITY") == lit("1-URGENT"))
        .select(*OUTPUT_COLUMNS)
    )


def main():
    session = get_active_session()
    urgent_shipped_orders = build_urgent_shipped_orders(session)
    urgent_shipped_orders.show()


if __name__ == "__main__":
    main()
