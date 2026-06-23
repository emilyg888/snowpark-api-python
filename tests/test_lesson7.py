from __future__ import annotations

import importlib.util
import sys
from pathlib import Path
from unittest.mock import MagicMock, call, patch


PROJECT_ROOT = Path(__file__).resolve().parents[1]
SRC_ROOT = PROJECT_ROOT / "src"
LESSON7_PATH = SRC_ROOT / "LESSON7.py"


def load_lesson7():
    if str(SRC_ROOT) not in sys.path:
        sys.path.insert(0, str(SRC_ROOT))

    spec = importlib.util.spec_from_file_location("lesson7", LESSON7_PATH)
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


def test_debug_dataframe_prints_schema_plan_queries_and_sample():
    lesson7 = load_lesson7()
    dataframe = MagicMock()
    limited = MagicMock()
    dataframe.queries = {"queries": ["select 1", "select 2"]}
    dataframe.limit.return_value = limited

    with patch.object(lesson7, "print") as print_:
        lesson7.debug_dataframe(dataframe, sample_size=5)

    dataframe.print_schema.assert_called_once_with()
    dataframe.explain.assert_called_once_with()
    dataframe.limit.assert_called_once_with(5)
    limited.show.assert_called_once_with()
    assert print_.call_args_list == [
        call("Schema:"),
        call("Query plan:"),
        call("Generated SQL:"),
        call("select 1"),
        call("select 2"),
        call("Small sample:"),
    ]


def test_debug_dataframe_defaults_to_ten_row_sample():
    lesson7 = load_lesson7()
    dataframe = MagicMock()
    dataframe.queries = {"queries": []}
    dataframe.limit.return_value = MagicMock()

    lesson7.debug_dataframe(dataframe)

    dataframe.limit.assert_called_once_with(10)


def test_import_does_not_create_local_snowflake_session():
    with patch("snowpark_session.create_session") as create_session:
        load_lesson7()

    create_session.assert_not_called()


def test_main_builds_debugs_and_closes_session():
    lesson7 = load_lesson7()
    session = MagicMock()
    dataframe = MagicMock()

    with (
        patch.object(lesson7, "create_session", return_value=session) as create_session,
        patch.object(
            lesson7,
            "build_orders_with_customers",
            return_value=dataframe,
        ) as build_orders_with_customers,
        patch.object(lesson7, "debug_dataframe") as debug_dataframe,
    ):
        lesson7.main()

    create_session.assert_called_once_with()
    build_orders_with_customers.assert_called_once_with(session)
    debug_dataframe.assert_called_once_with(dataframe)
    session.close.assert_called_once_with()


def test_main_closes_session_when_debug_fails():
    lesson7 = load_lesson7()
    session = MagicMock()
    dataframe = MagicMock()

    with (
        patch.object(lesson7, "create_session", return_value=session),
        patch.object(lesson7, "build_orders_with_customers", return_value=dataframe),
        patch.object(lesson7, "debug_dataframe", side_effect=RuntimeError("debug failed")),
    ):
        try:
            lesson7.main()
        except RuntimeError as exc:
            assert str(exc) == "debug failed"
        else:
            raise AssertionError("Expected RuntimeError")

    session.close.assert_called_once_with()
