from __future__ import annotations

import importlib.util
import sys
from pathlib import Path
from unittest.mock import MagicMock, patch


PROJECT_ROOT = Path(__file__).resolve().parents[1]
SRC_ROOT = PROJECT_ROOT / "src"
LESSON3_PATH = SRC_ROOT / "LESSON3.py"


def load_lesson3():
    if str(SRC_ROOT) not in sys.path:
        sys.path.insert(0, str(SRC_ROOT))

    spec = importlib.util.spec_from_file_location("lesson3", LESSON3_PATH)
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


def test_build_order_priority_summary_groups_aggregates_selects_and_sorts():
    lesson3 = load_lesson3()
    session = MagicMock()
    dataframe = MagicMock()
    grouped = MagicMock()
    aggregated = MagicMock()
    selected = MagicMock()
    order_count = MagicMock()
    total_revenue = MagicMock()
    avg_order_value = MagicMock()

    session.table.return_value = dataframe
    dataframe.group_by.return_value = grouped
    grouped.agg.return_value = aggregated
    aggregated.select.return_value = selected
    selected.sort.return_value = selected

    with (
        patch.object(lesson3, "count", return_value=order_count) as count,
        patch.object(lesson3, "sum_", return_value=total_revenue) as sum_,
        patch.object(lesson3, "avg", return_value=avg_order_value) as avg,
    ):
        result = lesson3.build_order_priority_summary(session)

    session.table.assert_called_once_with("SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS")
    dataframe.group_by.assert_called_once_with("O_ORDERSTATUS", "O_ORDERPRIORITY")
    count.assert_called_once_with("*")
    sum_.assert_called_once_with("O_TOTALPRICE")
    avg.assert_called_once_with("O_TOTALPRICE")
    order_count.as_.assert_called_once_with("ORDER_COUNT")
    total_revenue.as_.assert_called_once_with("TOTAL_REVENUE")
    avg_order_value.as_.assert_called_once_with("AVG_ORDER_VALUE")
    assert grouped.agg.call_count == 1
    assert len(grouped.agg.call_args.args) == 3
    aggregated.select.assert_called_once_with(*lesson3.OUTPUT_COLUMNS)
    selected.sort.assert_called_once_with("O_ORDERSTATUS", "O_ORDERPRIORITY")
    assert result is selected
    selected.show.assert_not_called()


def test_output_columns_match_lesson3_display_order():
    lesson3 = load_lesson3()

    assert lesson3.OUTPUT_COLUMNS == [
        "O_ORDERSTATUS",
        "O_ORDERPRIORITY",
        "ORDER_COUNT",
        "TOTAL_REVENUE",
        "AVG_ORDER_VALUE",
    ]


def test_import_does_not_create_local_snowflake_session():
    with patch("snowpark_session.create_session") as create_session:
        load_lesson3()

    create_session.assert_not_called()


def test_main_creates_closes_session_and_shows_dataframe():
    lesson3 = load_lesson3()
    session = MagicMock()
    dataframe = MagicMock()

    with (
        patch.object(lesson3, "create_session", return_value=session) as create_session,
        patch.object(
            lesson3,
            "build_order_priority_summary",
            return_value=dataframe,
        ) as build,
    ):
        lesson3.main()

    create_session.assert_called_once_with()
    build.assert_called_once_with(session)
    dataframe.show.assert_called_once_with()
    session.close.assert_called_once_with()
