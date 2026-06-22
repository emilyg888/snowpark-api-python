from __future__ import annotations

import importlib.util
import sys
from pathlib import Path
from unittest.mock import MagicMock, patch


PROJECT_ROOT = Path(__file__).resolve().parents[1]
SRC_ROOT = PROJECT_ROOT / "src"
LESSON2_PATH = SRC_ROOT / "LESSON2.py"


def load_lesson2():
    if str(SRC_ROOT) not in sys.path:
        sys.path.insert(0, str(SRC_ROOT))

    spec = importlib.util.spec_from_file_location("lesson2", LESSON2_PATH)
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


def test_build_urgent_shipped_orders_adds_lesson2_derived_columns():
    lesson2 = load_lesson2()
    session = MagicMock()
    dataframe = MagicMock()
    session.table.return_value = dataframe
    dataframe.filter.return_value = dataframe
    dataframe.with_column.return_value = dataframe
    dataframe.select.return_value = dataframe

    result = lesson2.build_urgent_shipped_orders(session)

    session.table.assert_called_once_with("SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS")
    assert dataframe.filter.call_count == 3
    assert [call.args[0] for call in dataframe.with_column.call_args_list] == [
        "IS_HIGH_VALUE",
        "ORDER_URGENCY",
        "ROUNDED_ORDERS",
    ]
    dataframe.select.assert_called_once_with(*lesson2.OUTPUT_COLUMNS)
    assert result is dataframe
    dataframe.show.assert_not_called()


def test_output_columns_include_derived_columns_in_display_order():
    lesson2 = load_lesson2()

    assert "ROUNDED_ORDERS" in lesson2.OUTPUT_COLUMNS
    assert lesson2.OUTPUT_COLUMNS[-2:] == ["IS_HIGH_VALUE", "ORDER_URGENCY"]


def test_import_does_not_create_local_snowflake_session():
    with patch("snowpark_session.create_session") as create_session:
        load_lesson2()

    create_session.assert_not_called()


def test_main_creates_closes_session_and_shows_dataframe():
    lesson2 = load_lesson2()
    session = MagicMock()
    dataframe = MagicMock()

    with (
        patch.object(lesson2, "create_session", return_value=session) as create_session,
        patch.object(lesson2, "build_urgent_shipped_orders", return_value=dataframe) as build,
    ):
        lesson2.main()

    create_session.assert_called_once_with()
    build.assert_called_once_with(session)
    dataframe.show.assert_called_once_with()
    session.close.assert_called_once_with()
