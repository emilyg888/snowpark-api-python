# Query urgent shipped orders from TPCH sample data
# Co-authored with CoCo
from snowflake.snowpark.functions import col, lit, when

from snowpark_session import create_session

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
    "IS_BIG_ORDER",
    "PRIORITY_BAND"
]


def build_urgent_shipped_orders(session):
    orders = session.table(ORDERS_TABLE)
    return (
        orders
        .filter(col("O_ORDERSTATUS") == lit("F"))
        .filter(col("O_TOTALPRICE") >= 30000)
        .filter(col("O_ORDERPRIORITY") == lit("1-URGENT"))
        .with_column("IS_BIG_ORDER", col("O_TOTALPRICE") >= lit(30000))
        .with_column(
            "PRIORITY_BAND",
            when(col("O_ORDERPRIORITY") == lit("1-URGENT"), lit("URGENT"))
            .otherwise(lit("NORMAL"))
        )
        .select(*OUTPUT_COLUMNS)
    )


def main():
    session = create_session()
    try:
        urgent_shipped_orders = build_urgent_shipped_orders(session)
        urgent_shipped_orders.show()
    finally:
        session.close()


if __name__ == "__main__":
    main()
