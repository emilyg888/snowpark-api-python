"""Snowpark session helpers for local development."""

from __future__ import annotations

import os

from snowflake.snowpark import Session


def create_session(connection_name: str | None = None) -> Session:
    """Create a Snowpark session from ~/.snowflake/connections.toml."""
    name = connection_name or os.environ.get("SNOWFLAKE_CONNECTION_NAME", "default")
    return Session.builder.config("connection_name", name).create()
