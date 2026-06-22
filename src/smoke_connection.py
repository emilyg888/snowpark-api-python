"""Small VS Code smoke test for the configured Snowflake connection."""

from __future__ import annotations

from snowpark_session import create_session


def main() -> None:
    session = create_session()
    try:
        row = session.sql(
            "select current_account() as account, current_user() as user, "
            "current_role() as role, current_database() as database_name, "
            "current_schema() as schema_name, current_warehouse() as warehouse_name"
        ).collect()[0]
        print("Snowpark connection OK")
        print(f"account={row['ACCOUNT']}")
        print(f"user={row['USER']}")
        print(f"role={row['ROLE']}")
        print(f"database={row['DATABASE_NAME']}")
        print(f"schema={row['SCHEMA_NAME']}")
        print(f"warehouse={row['WAREHOUSE_NAME']}")
    finally:
        session.close()


if __name__ == "__main__":
    main()
