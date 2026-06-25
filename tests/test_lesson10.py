from __future__ import annotations

import importlib.util
import sys
from pathlib import Path
from unittest.mock import MagicMock, patch


PROJECT_ROOT = Path(__file__).resolve().parents[1]
SRC_ROOT = PROJECT_ROOT / "src"
LESSON10_PATH = SRC_ROOT / "LESSON10.py"


def load_lesson10():
    if str(SRC_ROOT) not in sys.path:
        sys.path.insert(0, str(SRC_ROOT))

    spec = importlib.util.spec_from_file_location("lesson10", LESSON10_PATH)
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


def test_build_revenue_by_status_groups_aggregates_selects_and_sorts():
    lesson10 = load_lesson10()
    session = MagicMock()
    orders = MagicMock()
    grouped = MagicMock()
    aggregated = MagicMock()
    selected = MagicMock()
    total_revenue = MagicMock()
    sort_column = MagicMock()

    session.table.return_value = orders
    orders.group_by.return_value = grouped
    grouped.agg.return_value = aggregated
    aggregated.select.return_value = selected
    selected.sort.return_value = selected

    with (
        patch.object(lesson10, "sum_", return_value=total_revenue) as sum_,
        patch.object(lesson10, "col", return_value=sort_column) as col,
    ):
        result = lesson10.build_revenue_by_status(session)

    session.table.assert_called_once_with("SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS")
    orders.group_by.assert_called_once_with("O_ORDERSTATUS")
    sum_.assert_called_once_with("O_TOTALPRICE")
    total_revenue.as_.assert_called_once_with("TOTAL_REVENUE")
    grouped.agg.assert_called_once_with(total_revenue.as_.return_value)
    aggregated.select.assert_called_once_with(*lesson10.OUTPUT_COLUMNS)
    col.assert_called_once_with("TOTAL_REVENUE")
    sort_column.desc.assert_called_once_with()
    selected.sort.assert_called_once_with(sort_column.desc.return_value)
    selected.show.assert_not_called()
    selected.to_pandas.assert_not_called()
    assert result is selected


def test_output_columns_match_lesson10_display_order():
    lesson10 = load_lesson10()

    assert lesson10.OUTPUT_COLUMNS == [
        "O_ORDERSTATUS",
        "TOTAL_REVENUE",
    ]


def test_import_does_not_create_local_snowflake_session():
    with patch("snowpark_session.create_session") as create_session:
        load_lesson10()

    create_session.assert_not_called()


def test_main_creates_closes_session_shows_and_prints_pandas_shape():
    lesson10 = load_lesson10()
    session = MagicMock()
    dataframe = MagicMock()
    pandas_dataframe = MagicMock()
    pandas_dataframe.shape = (3, 2)
    dataframe.to_pandas.return_value = pandas_dataframe

    with (
        patch.object(lesson10, "create_session", return_value=session) as create_session,
        patch.object(
            lesson10,
            "build_revenue_by_status",
            return_value=dataframe,
        ) as build,
        patch.object(lesson10, "print") as print_,
    ):
        lesson10.main()

    create_session.assert_called_once_with()
    build.assert_called_once_with(session)
    dataframe.show.assert_called_once_with()
    dataframe.to_pandas.assert_called_once_with()
    print_.assert_called_once_with("pandas shape=(3, 2)")
    session.close.assert_called_once_with()
