# Summarize TPCH orders by status and cross the result boundary intentionally.
from snowflake.snowpark.functions import col, sum as sum_

from snowpark_session import create_session

ORDERS_TABLE = "SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS"

OUTPUT_COLUMNS = [
    "O_ORDERSTATUS",
    "TOTAL_REVENUE",
]


def build_revenue_by_status(session):
    orders = session.table(ORDERS_TABLE)
    return (
        orders
        .group_by("O_ORDERSTATUS")
        .agg(
            sum_("O_TOTALPRICE").as_("TOTAL_REVENUE"),
        )
        .select(*OUTPUT_COLUMNS)
        .sort(col("TOTAL_REVENUE").desc())
    )


def main():
    session = create_session()
    try:
        revenue_by_status = build_revenue_by_status(session)
        # Preview the results, this will execute the snowflake query and fetch the results to the client
        revenue_by_status.show()
        # To pandas DataFrame
        revenue_by_status_df = revenue_by_status.to_pandas()
        print(f"pandas shape={revenue_by_status_df.shape}")
    finally:
        session.close()


if __name__ == "__main__":
    main()
