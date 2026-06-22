# Summarize TPCH orders by status and priority
from snowflake.snowpark.functions import avg, count, sum as sum_

from snowpark_session import create_session

ORDERS_TABLE = "SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS"

OUTPUT_COLUMNS = [
    "O_ORDERSTATUS",
    "O_ORDERPRIORITY",
    "ORDER_COUNT",
    "TOTAL_REVENUE",
    "AVG_ORDER_VALUE",
]


def build_order_priority_summary(session):
    orders = session.table(ORDERS_TABLE)
    return (
        orders
        .group_by("O_ORDERSTATUS", "O_ORDERPRIORITY")
        .agg(
            count("*").as_("ORDER_COUNT"),
            sum_("O_TOTALPRICE").as_("TOTAL_REVENUE"),
            avg("O_TOTALPRICE").as_("AVG_ORDER_VALUE"),
        )
        .select(*OUTPUT_COLUMNS)
        .sort("O_ORDERSTATUS", "O_ORDERPRIORITY")
    )


def main():
    session = create_session()
    try:
        priority_summary = build_order_priority_summary(session)
        priority_summary.show()
    finally:
        session.close()


if __name__ == "__main__":
    main()
