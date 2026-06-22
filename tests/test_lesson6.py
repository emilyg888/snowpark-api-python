from __future__ import annotations

import importlib.util
import sys
from pathlib import Path
from unittest.mock import MagicMock, call, patch


PROJECT_ROOT = Path(__file__).resolve().parents[1]
SRC_ROOT = PROJECT_ROOT / "src"
LESSON6_PATH = SRC_ROOT / "LESSON6.py"


def load_lesson6():
    if str(SRC_ROOT) not in sys.path:
        sys.path.insert(0, str(SRC_ROOT))

    spec = importlib.util.spec_from_file_location("lesson6", LESSON6_PATH)
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


def test_build_orders_with_customers_joins_selects_and_sorts():
    lesson6 = load_lesson6()
    session = MagicMock()
    orders = MagicMock()
    customers = MagicMock()
    joined = MagicMock()
    selected = MagicMock()
    sort_column = MagicMock()

    order_customer_key = MagicMock()
    customer_key = MagicMock()
    join_condition = MagicMock()
    order_key = MagicMock()
    customer_name = MagicMock()
    order_status = MagicMock()
    order_total = MagicMock()
    order_date = MagicMock()

    session.table.side_effect = [orders, customers]
    orders.__getitem__.side_effect = {
        "O_CUSTKEY": order_customer_key,
        "O_ORDERKEY": order_key,
        "O_ORDERSTATUS": order_status,
        "O_TOTALPRICE": order_total,
        "O_ORDERDATE": order_date,
    }.__getitem__
    customers.__getitem__.side_effect = {
        "C_CUSTKEY": customer_key,
        "C_NAME": customer_name,
    }.__getitem__
    order_customer_key.__eq__.return_value = join_condition
    orders.join.return_value = joined
    joined.select.return_value = selected
    selected.sort.return_value = selected

    with patch.object(lesson6, "col", return_value=sort_column) as col:
        result = lesson6.build_orders_with_customers(session)

    assert session.table.call_args_list == [
        call("SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS"),
        call("SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER"),
    ]
    orders.join.assert_called_once_with(
        customers,
        join_condition,
        join_type="inner",
    )
    order_key.as_.assert_called_once_with("ORDER_KEY")
    customer_name.as_.assert_called_once_with("CUSTOMER_NAME")
    order_status.as_.assert_called_once_with("ORDER_STATUS")
    order_total.as_.assert_called_once_with("ORDER_TOTAL")
    order_date.as_.assert_called_once_with("ORDER_DATE")
    joined.select.assert_called_once()
    assert len(joined.select.call_args.args) == 5
    col.assert_called_once_with("ORDER_TOTAL")
    sort_column.desc.assert_called_once_with()
    selected.sort.assert_called_once_with(sort_column.desc.return_value)
    selected.show.assert_not_called()
    assert result is selected


def test_output_columns_match_lesson6_display_order():
    lesson6 = load_lesson6()

    assert lesson6.OUTPUT_COLUMNS == [
        "ORDER_KEY",
        "CUSTOMER_NAME",
        "ORDER_STATUS",
        "ORDER_TOTAL",
        "ORDER_DATE",
    ]


def test_import_does_not_create_local_snowflake_session():
    with patch("snowpark_session.create_session") as create_session:
        load_lesson6()

    create_session.assert_not_called()


def test_main_creates_closes_session_and_shows_dataframe():
    lesson6 = load_lesson6()
    session = MagicMock()
    dataframe = MagicMock()

    with (
        patch.object(lesson6, "create_session", return_value=session) as create_session,
        patch.object(
            lesson6,
            "build_orders_with_customers",
            return_value=dataframe,
        ) as build,
    ):
        lesson6.main()

    create_session.assert_called_once_with()
    build.assert_called_once_with(session)
    dataframe.show.assert_called_once_with()
    session.close.assert_called_once_with()
