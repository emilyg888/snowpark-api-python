from __future__ import annotations

import importlib.util
from pathlib import Path
from unittest.mock import MagicMock, patch


PROJECT_ROOT = Path(__file__).resolve().parents[1]
LESSON1_PATH = PROJECT_ROOT / "src" / "LESSON1.py"


def load_lesson1():
    spec = importlib.util.spec_from_file_location("lesson1", LESSON1_PATH)
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


def test_build_urgent_shipped_orders_uses_tpch_orders_table_and_selects_columns():
    lesson1 = load_lesson1()
    session = MagicMock()
    dataframe = MagicMock()
    session.table.return_value = dataframe
    dataframe.filter.return_value = dataframe
    dataframe.select.return_value = dataframe

    result = lesson1.build_urgent_shipped_orders(session)

    session.table.assert_called_once_with("SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS")
    assert dataframe.filter.call_count == 3
    dataframe.select.assert_called_once_with(*lesson1.OUTPUT_COLUMNS)
    assert result is dataframe
    dataframe.show.assert_not_called()


def test_import_does_not_request_active_snowflake_session():
    with patch("snowflake.snowpark.context.get_active_session") as get_active_session:
        load_lesson1()

    get_active_session.assert_not_called()


def test_main_gets_active_session_and_shows_dataframe():
    lesson1 = load_lesson1()
    session = MagicMock()
    dataframe = MagicMock()

    with (
        patch.object(lesson1, "get_active_session", return_value=session) as get_active_session,
        patch.object(lesson1, "build_urgent_shipped_orders", return_value=dataframe) as build,
    ):
        lesson1.main()

    get_active_session.assert_called_once_with()
    build.assert_called_once_with(session)
    dataframe.show.assert_called_once_with()
