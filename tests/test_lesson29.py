from __future__ import annotations

import importlib.util
from pathlib import Path
from unittest.mock import MagicMock, call, patch


PROJECT_ROOT = Path(__file__).resolve().parents[1]
LESSON29_PATH = PROJECT_ROOT / "snowpark" / "lesson29_ifrs9_stage_base.py"


class FakeColumn:
    def __init__(self, expression):
        self.expression = expression
        self.alias_name = None

    def __eq__(self, other):
        return FakeColumn(("eq", self.expression, expression_for(other)))

    def __ge__(self, other):
        return FakeColumn(("ge", self.expression, expression_for(other)))

    def __or__(self, other):
        return FakeColumn(("or", self.expression, expression_for(other)))

    def alias(self, name):
        self.alias_name = name
        return self


class FakeWhen:
    def __init__(self, condition, value):
        self.conditions = [(condition, expression_for(value))]
        self.otherwise_value = None
        self.alias_name = None

    def when(self, condition, value):
        self.conditions.append((condition, expression_for(value)))
        return self

    def otherwise(self, value):
        self.otherwise_value = expression_for(value)
        return self

    def alias(self, name):
        self.alias_name = name
        return self


def expression_for(value):
    return value.expression if isinstance(value, FakeColumn) else value


def load_lesson29():
    spec = importlib.util.spec_from_file_location("lesson29", LESSON29_PATH)
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


def test_build_ifrs9_stage_base_filters_selects_and_derives_stage():
    lesson29 = load_lesson29()
    session = MagicMock()
    loans = MagicMock()
    with_date = MagicMock()
    filtered = MagicMock()
    selected = MagicMock()

    session.table.return_value = loans
    loans.with_column.return_value = with_date
    with_date.filter.return_value = filtered
    filtered.select.return_value = selected

    def fake_col(name):
        return FakeColumn(("col", name))

    def fake_lit(value):
        return FakeColumn(("lit", value))

    with (
        patch.object(lesson29, "col", side_effect=fake_col) as col,
        patch.object(lesson29, "lit", side_effect=fake_lit) as lit,
        patch.object(lesson29, "dateadd", return_value=("dateadd",)) as dateadd,
        patch.object(lesson29, "when", side_effect=FakeWhen) as when,
    ):
        result = lesson29.build_ifrs9_stage_base(session, reporting_date="2026-06-30")

    session.table.assert_called_once_with("IFRS9.SAMPLE_DATA.IFRS_LOAN_ACCOUNT")
    dateadd.assert_called_once()
    assert dateadd.call_args.args[0] == "day"
    assert dateadd.call_args.args[1].expression == ("col", "AS_OF_DT")
    assert dateadd.call_args.args[2].expression == ("lit", "1960-01-01")
    loans.with_column.assert_called_once_with("AS_OF_DATE", ("dateadd",))
    filter_condition = with_date.filter.call_args.args[0]
    assert filter_condition.expression == (
        "eq",
        ("col", "AS_OF_DATE"),
        ("lit", "2026-06-30"),
    )

    select_columns = filtered.select.call_args.args
    assert [column.expression for column in select_columns[:8]] == [
        ("col", "ACCOUNT_ID"),
        ("col", "CUST_ID"),
        ("col", "PORTFOLIO_CD"),
        ("col", "PROD_CD"),
        ("col", "DRAWN_AMT"),
        ("col", "UNDRAWN_AMT"),
        ("col", "DPD"),
        ("col", "CURR_RISK_GRADE"),
    ]
    stage_column = select_columns[8]
    assert stage_column.alias_name == "IFRS9_STAGE"
    assert stage_column.conditions == [
        (
            ("or", ("eq", ("col", "DEFAULT_FLG"), ("lit", "Y")), ("ge", ("col", "DPD"), ("lit", 90))),
            ("lit", "3"),
        ),
        (
            ("or", ("ge", ("col", "DPD"), ("lit", 30)), ("eq", ("col", "FORBEARANCE_FLG"), ("lit", "Y"))),
            ("lit", "2"),
        ),
    ]
    assert stage_column.otherwise_value == ("lit", "1")
    assert select_columns[9].expression == ("col", "AS_OF_DATE")
    assert select_columns[9].alias_name == "AS_OF_DT"

    when.assert_called_once()
    assert col.call_count == 15
    assert lit.call_count == 9
    assert result is selected
    selected.show.assert_not_called()


def test_build_ifrs9_stage_base_uses_default_reporting_date():
    lesson29 = load_lesson29()
    session = MagicMock()
    loans = MagicMock()
    with_date = MagicMock()
    filtered = MagicMock()

    session.table.return_value = loans
    loans.with_column.return_value = with_date
    with_date.filter.return_value = filtered

    with (
        patch.object(lesson29, "col", side_effect=lambda name: FakeColumn(("col", name))),
        patch.object(lesson29, "lit", side_effect=lambda value: FakeColumn(("lit", value))),
        patch.object(lesson29, "dateadd", return_value=("dateadd",)),
        patch.object(lesson29, "when", side_effect=FakeWhen),
    ):
        lesson29.build_ifrs9_stage_base(session)

    filter_condition = with_date.filter.call_args.args[0]
    assert filter_condition.expression == (
        "eq",
        ("col", "AS_OF_DATE"),
        ("lit", "2026-05-31"),
    )


def test_build_ifrs9_stage_base_summary_writes_aggregates_sorts_and_shows():
    lesson29 = load_lesson29()
    session = MagicMock()
    stage_base = MagicMock()
    grouped = MagicMock()
    aggregated = MagicMock()
    result = MagicMock()
    drawn_sum = MagicMock()
    undrawn_sum = MagicMock()

    stage_base.group_by.return_value = grouped
    grouped.agg.return_value = aggregated
    aggregated.sort.return_value = result

    with (
        patch.object(
            lesson29,
            "build_ifrs9_stage_base",
            return_value=stage_base,
        ) as build_stage_base,
        patch.object(lesson29, "sum_", side_effect=[drawn_sum, undrawn_sum]) as sum_,
    ):
        returned = lesson29.build_ifrs9_stage_base_summary(session)

    build_stage_base.assert_called_once_with(session)
    stage_base.write.mode.assert_called_once_with("overwrite")
    stage_base.write.mode.return_value.save_as_table.assert_called_once_with(
        "IFRS9.STG.STAGE_RESULT_SP"
    )
    stage_base.group_by.assert_called_once_with("IFRS9_STAGE")
    assert sum_.call_args_list == [call("DRAWN_AMT"), call("UNDRAWN_AMT")]
    drawn_sum.alias.assert_called_once_with("TOTAL_DRAWN_AMT")
    undrawn_sum.alias.assert_called_once_with("TOTAL_UNDRAWN_AMT")
    grouped.agg.assert_called_once_with(
        drawn_sum.alias.return_value,
        undrawn_sum.alias.return_value,
    )
    aggregated.sort.assert_called_once_with("IFRS9_STAGE")
    result.show.assert_called_once_with(10)
    assert returned is result


def test_main_delegates_to_summary_builder():
    lesson29 = load_lesson29()
    session = MagicMock()

    with patch.object(lesson29, "build_ifrs9_stage_base_summary") as build_summary:
        lesson29.main(session)

    build_summary.assert_called_once_with(session)
