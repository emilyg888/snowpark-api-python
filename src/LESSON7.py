"""Debug the joined orders and customers DataFrame."""
from LESSON6 import build_orders_with_customers
from snowpark_session import create_session


def debug_dataframe(df, sample_size=10):
    print("Schema:")
    df.print_schema()

    print("Query plan:")
    df.explain()

    print("Generated SQL:")
    for query in df.queries["queries"]:
        print(query)

    print("Small sample:")
    df.limit(sample_size).show()


def main():
    session = create_session()
    try:
        df = build_orders_with_customers(session)
        debug_dataframe(df)
    finally:
        session.close()


if __name__ == "__main__":
    main()
