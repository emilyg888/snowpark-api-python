from __future__ import annotations

import importlib.util
import sys
from pathlib import Path
from unittest.mock import MagicMock, patch


PROJECT_ROOT = Path(__file__).resolve().parents[1]
SRC_ROOT = PROJECT_ROOT / "src"
LESSON9_PATH = SRC_ROOT / "LESSON9.py"


class FakeColumn:
    def __init__(self, path):
        self.path = tuple(path)
        self.cast_type = None
        self.alias = None
        self.desc_called = False

    def __getitem__(self, key):
        return FakeColumn((*self.path, key))

    def cast(self, cast_type):
        self.cast_type = cast_type
        return self

    def as_(self, alias):
        self.alias = alias
        return self

    def desc(self):
        self.desc_called = True
        return ("desc", self.path)


def load_lesson9():
    if str(SRC_ROOT) not in sys.path:
        sys.path.insert(0, str(SRC_ROOT))

    spec = importlib.util.spec_from_file_location("lesson9", LESSON9_PATH)
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


def test_build_vehicle_prices_extracts_casts_selects_and_sorts():
    lesson9 = load_lesson9()
    session = MagicMock()
    car_sales = MagicMock()
    selected = MagicMock()
    string_type = object()
    integer_type = object()

    session.table.return_value = car_sales
    car_sales.select.return_value = selected
    selected.sort.return_value = selected

    def fake_col(name):
        return FakeColumn((name,))

    with (
        patch.object(lesson9, "col", side_effect=fake_col) as col,
        patch.object(lesson9, "StringType", return_value=string_type) as string_type_cls,
        patch.object(lesson9, "IntegerType", return_value=integer_type) as integer_type_cls,
    ):
        result = lesson9.build_vehicle_prices(session)

    session.table.assert_called_once_with("SNOWPARK_SAMPLE_DATA.PUBLIC.CAR_SALES")
    assert col.call_count == 6
    assert string_type_cls.call_count == 3
    assert integer_type_cls.call_count == 2
    car_sales.select.assert_called_once()

    selected_columns = car_sales.select.call_args.args
    assert [(column.path, column.cast_type, column.alias) for column in selected_columns] == [
        (("SRC", "dealership"), string_type, "DEALERSHIP"),
        (("SRC", "vehicle", 0, "make"), string_type, "MAKE"),
        (("SRC", "vehicle", 0, "model"), string_type, "MODEL"),
        (("SRC", "vehicle", 0, "year"), integer_type, "YEAR"),
        (("SRC", "vehicle", 0, "price"), integer_type, "PRICE"),
    ]

    selected.sort.assert_called_once_with(("desc", ("PRICE",)))
    selected.show.assert_not_called()
    assert result is selected


def test_output_columns_match_lesson9_display_order():
    lesson9 = load_lesson9()

    assert lesson9.OUTPUT_COLUMNS == [
        "DEALERSHIP",
        "MAKE",
        "MODEL",
        "YEAR",
        "PRICE",
    ]


def test_import_does_not_create_local_snowflake_session():
    with patch("snowpark_session.create_session") as create_session:
        load_lesson9()

    create_session.assert_not_called()


def test_main_creates_closes_session_prints_schema_and_shows_dataframe():
    lesson9 = load_lesson9()
    session = MagicMock()
    dataframe = MagicMock()

    with (
        patch.object(lesson9, "create_session", return_value=session) as create_session,
        patch.object(lesson9, "build_vehicle_prices", return_value=dataframe) as build,
    ):
        lesson9.main()

    create_session.assert_called_once_with()
    build.assert_called_once_with(session)
    dataframe.print_schema.assert_called_once_with()
    dataframe.show.assert_called_once_with()
    session.close.assert_called_once_with()
