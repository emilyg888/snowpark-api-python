from __future__ import annotations

import importlib.util
import sys
from pathlib import Path
from unittest.mock import MagicMock, patch


PROJECT_ROOT = Path(__file__).resolve().parents[1]
SRC_ROOT = PROJECT_ROOT / "src"
LESSON8_PATH = SRC_ROOT / "LESSON8.py"


def load_lesson8():
    if str(SRC_ROOT) not in sys.path:
        sys.path.insert(0, str(SRC_ROOT))

    spec = importlib.util.spec_from_file_location("lesson8", LESSON8_PATH)
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


def test_build_top_orders_by_status_ranks_filters_selects_and_sorts():
    lesson8 = load_lesson8()
    session = MagicMock()
    orders = MagicMock()
    ranked = MagicMock()
    filtered = MagicMock()
    selected = MagicMock()
    rank_function = MagicMock()
    rank_expression = MagicMock()
    rank_column = MagicMock()
    rank_filter = MagicMock()

    session.table.return_value = orders
    orders.with_column.return_value = ranked
    ranked.filter.return_value = filtered
    filtered.select.return_value = selected
    selected.sort.return_value = selected

    rank_function.over.return_value = rank_expression
    rank_column.__le__.return_value = rank_filter

    with (
        patch.object(lesson8, "row_number", return_value=rank_function) as row_number,
        patch.object(lesson8, "col", return_value=rank_column) as col,
    ):
        result = lesson8.build_top_orders_by_status(session)

    session.table.assert_called_once_with("SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS")
    row_number.assert_called_once_with()
    rank_function.over.assert_called_once_with(lesson8.status_window)
    orders.with_column.assert_called_once_with("STATUS_RANK", rank_expression)
    col.assert_called_once_with("STATUS_RANK")
    rank_column.__le__.assert_called_once_with(5)
    ranked.filter.assert_called_once_with(rank_filter)
    filtered.select.assert_called_once_with(*lesson8.OUTPUT_COLUMNS)
    selected.sort.assert_called_once_with("O_ORDERSTATUS", "STATUS_RANK")
    selected.show.assert_not_called()
    assert result is selected


def test_output_columns_include_status_rank_for_lesson8_display():
    lesson8 = load_lesson8()

    assert lesson8.OUTPUT_COLUMNS == [
        "O_ORDERKEY",
        "O_CUSTKEY",
        "O_ORDERSTATUS",
        "O_TOTALPRICE",
        "O_ORDERDATE",
        "STATUS_RANK",
    ]


def test_import_does_not_create_local_snowflake_session():
    with patch("snowpark_session.create_session") as create_session:
        load_lesson8()

    create_session.assert_not_called()


def test_main_creates_closes_session_and_shows_dataframe():
    lesson8 = load_lesson8()
    session = MagicMock()
    dataframe = MagicMock()

    with (
        patch.object(lesson8, "create_session", return_value=session) as create_session,
        patch.object(
            lesson8,
            "build_top_orders_by_status",
            return_value=dataframe,
        ) as build,
    ):
        lesson8.main()

    create_session.assert_called_once_with()
    build.assert_called_once_with(session)
    dataframe.show.assert_called_once_with()
    session.close.assert_called_once_with()
