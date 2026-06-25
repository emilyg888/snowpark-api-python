from __future__ import annotations

import importlib.util
import sys
from pathlib import Path
from unittest.mock import MagicMock, patch


PROJECT_ROOT = Path(__file__).resolve().parents[1]
SRC_ROOT = PROJECT_ROOT / "src"
LESSON12_PATH = SRC_ROOT / "LESSON12.py"


def load_lesson12():
    if str(SRC_ROOT) not in sys.path:
        sys.path.insert(0, str(SRC_ROOT))

    spec = importlib.util.spec_from_file_location("lesson12", LESSON12_PATH)
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


def test_save_vehicle_prices_builds_dataframe_and_writes_target_table():
    lesson12 = load_lesson12()
    session = MagicMock()
    vehicle_prices = MagicMock()

    with patch.object(
        lesson12,
        "build_vehicle_prices",
        return_value=vehicle_prices,
    ) as build_vehicle_prices:
        result = lesson12.save_vehicle_prices(session, mode="append")

    build_vehicle_prices.assert_called_once_with(session)
    vehicle_prices.write.save_as_table.assert_called_once_with(
        "SNOWPARK_SAMPLE_DATA.PUBLIC.VEHICLE_PRICES",
        mode="append",
    )
    vehicle_prices.save_as_table.assert_not_called()
    assert result is None


def test_save_vehicle_prices_defaults_to_overwrite_mode():
    lesson12 = load_lesson12()
    session = MagicMock()
    vehicle_prices = MagicMock()

    with patch.object(lesson12, "build_vehicle_prices", return_value=vehicle_prices):
        lesson12.save_vehicle_prices(session)

    vehicle_prices.write.save_as_table.assert_called_once_with(
        "SNOWPARK_SAMPLE_DATA.PUBLIC.VEHICLE_PRICES",
        mode="overwrite",
    )


def test_target_table_matches_lesson12_contract():
    lesson12 = load_lesson12()

    assert lesson12.TARGET_TABLE == "SNOWPARK_SAMPLE_DATA.PUBLIC.VEHICLE_PRICES"


def test_import_does_not_create_local_snowflake_session():
    with patch("snowpark_session.create_session") as create_session:
        load_lesson12()

    create_session.assert_not_called()


def test_main_saves_previews_target_and_closes_session():
    lesson12 = load_lesson12()
    session = MagicMock()
    target_table = MagicMock()
    session.table.return_value = target_table

    with (
        patch.object(lesson12, "create_session", return_value=session) as create_session,
        patch.object(lesson12, "save_vehicle_prices") as save_vehicle_prices,
    ):
        lesson12.main()

    create_session.assert_called_once_with()
    save_vehicle_prices.assert_called_once_with(session, mode="overwrite")
    session.table.assert_called_once_with("SNOWPARK_SAMPLE_DATA.PUBLIC.VEHICLE_PRICES")
    target_table.show.assert_called_once_with()
    session.close.assert_called_once_with()
