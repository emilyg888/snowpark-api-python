from __future__ import annotations

import importlib.util
import sys
from pathlib import Path
from unittest.mock import MagicMock, patch


PROJECT_ROOT = Path(__file__).resolve().parents[1]
SRC_ROOT = PROJECT_ROOT / "src"
LESSON11_PATH = SRC_ROOT / "LESSON11.py"


class FakeColumn:
    def __init__(self, path):
        self.path = tuple(path)
        self.cast_type = None
        self.alias = None
        self.is_not_null_called = False

    def __getitem__(self, key):
        return FakeColumn((*self.path, key))

    def cast(self, cast_type):
        self.cast_type = cast_type
        return self

    def as_(self, alias):
        self.alias = alias
        return self

    def is_not_null(self):
        self.is_not_null_called = True
        return ("is_not_null", self.path)


def load_lesson11():
    if str(SRC_ROOT) not in sys.path:
        sys.path.insert(0, str(SRC_ROOT))

    spec = importlib.util.spec_from_file_location("lesson11", LESSON11_PATH)
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


def test_build_vehicle_extras_flattens_selects_filters_and_sorts():
    lesson11 = load_lesson11()
    session = MagicMock()
    car_sales = MagicMock()
    flattened = MagicMock()
    selected = MagicMock()
    filtered = MagicMock()
    string_type = object()
    flattened_call = object()

    session.table.return_value = car_sales
    car_sales.select.return_value = flattened
    flattened.select.return_value = selected
    selected.filter.return_value = filtered
    filtered.sort.return_value = filtered

    def fake_col(name):
        return FakeColumn((name,))

    with (
        patch.object(lesson11, "col", side_effect=fake_col) as col,
        patch.object(lesson11, "flatten", return_value=flattened_call) as flatten,
        patch.object(lesson11, "StringType", return_value=string_type) as string_type_cls,
    ):
        result = lesson11.build_vehicle_extras(session)

    session.table.assert_called_once_with("SNOWPARK_SAMPLE_DATA.PUBLIC.CAR_SALES")
    assert col.call_count == 6
    assert string_type_cls.call_count == 4

    first_select_columns = car_sales.select.call_args.args
    assert [(column.path, column.cast_type, column.alias) for column in first_select_columns[:3]] == [
        (("SRC", "dealership"), string_type, "DEALERSHIP"),
        (("SRC", "vehicle", 0, "make"), string_type, "MAKE"),
        (("SRC", "vehicle", 0, "model"), string_type, "MODEL"),
    ]
    assert first_select_columns[3] is flattened_call
    flatten.assert_called_once()
    assert flatten.call_args.args[0].path == ("SRC", "vehicle", 0, "extras")

    second_select_columns = flattened.select.call_args.args
    assert second_select_columns[:3] == ("DEALERSHIP", "MAKE", "MODEL")
    assert (
        second_select_columns[3].path,
        second_select_columns[3].cast_type,
        second_select_columns[3].alias,
    ) == (("VALUE",), string_type, "EXTRA")

    selected.filter.assert_called_once_with(("is_not_null", ("EXTRA",)))
    filtered.sort.assert_called_once_with(*lesson11.OUTPUT_COLUMNS)
    filtered.show.assert_not_called()
    assert result is filtered


def test_output_columns_match_lesson11_display_order():
    lesson11 = load_lesson11()

    assert lesson11.OUTPUT_COLUMNS == [
        "DEALERSHIP",
        "MAKE",
        "MODEL",
        "EXTRA",
    ]


def test_import_does_not_create_local_snowflake_session():
    with patch("snowpark_session.create_session") as create_session:
        load_lesson11()

    create_session.assert_not_called()


def test_save_vehicle_extras_builds_dataframe_and_writes_target_table():
    lesson11 = load_lesson11()
    session = MagicMock()
    vehicle_extras = MagicMock()

    with patch.object(
        lesson11,
        "build_vehicle_extras",
        return_value=vehicle_extras,
    ) as build_vehicle_extras:
        result = lesson11.save_vehicle_extras(session, mode="append")

    build_vehicle_extras.assert_called_once_with(session)
    vehicle_extras.write.save_as_table.assert_called_once_with(
        "SNOWPARK_SAMPLE_DATA.PUBLIC.VEHICLE_EXTRAS",
        mode="append",
    )
    vehicle_extras.save_as_table.assert_not_called()
    assert result is None


def test_main_saves_previews_target_and_closes_session():
    lesson11 = load_lesson11()
    session = MagicMock()
    target_table = MagicMock()
    session.table.return_value = target_table

    with (
        patch.object(lesson11, "create_session", return_value=session) as create_session,
        patch.object(lesson11, "save_vehicle_extras") as save_vehicle_extras,
    ):
        lesson11.main()

    create_session.assert_called_once_with()
    save_vehicle_extras.assert_called_once_with(session, mode="overwrite")
    session.table.assert_called_once_with("SNOWPARK_SAMPLE_DATA.PUBLIC.VEHICLE_EXTRAS")
    target_table.show.assert_called_once_with()
    session.close.assert_called_once_with()
