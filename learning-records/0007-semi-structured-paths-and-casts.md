# Semi-structured paths and casts

The user completed Lesson 9 and can now read a JSON hierarchy, map Snowflake variant paths such as `SRC:vehicle[0].make::string`, and translate that idea into Snowpark expressions such as `col("SRC")["vehicle"][0]["make"].cast(StringType())`. This raises the floor for future lessons because nested objects and arrays can now be treated as source data, not as opaque blobs.

**Evidence**: The user loaded a `CAR_SALES` semi-structured source, asked how to inspect JSON hierarchy, confirmed the meaning of `SRC:vehicle[0].make::string`, and implemented/reviewed `src/LESSON9.py` with tests.
