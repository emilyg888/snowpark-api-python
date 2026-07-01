from snowflake.snowpark import Session
from snowflake.snowpark.functions import col, dateadd, lit, sum as sum_, when


def build_ifrs9_stage_base(session: Session, reporting_date: str = "2026-05-31"):
    loans = session.table("IFRS9.SAMPLE_DATA.IFRS_LOAN_ACCOUNT")

    return (
        loans.with_column("AS_OF_DATE", dateadd(
            "day", col("AS_OF_DT"), lit("1960-01-01")))
        .filter(col("AS_OF_DATE") == lit(reporting_date))
        .select(
            col("ACCOUNT_ID"),
            col("CUST_ID"),
            col("PORTFOLIO_CD"),
            col("PROD_CD"),
            col("DRAWN_AMT"),
            col("UNDRAWN_AMT"),
            col("DPD"),
            col("CURR_RISK_GRADE"),
            when((col("DEFAULT_FLG") == lit("Y")) |
                 (col("DPD") >= lit(90)), lit("3"))
            .when(
                (col("DPD") >= lit(30)) | (col("FORBEARANCE_FLG") == lit("Y")),
                lit("2"),
            )
            .otherwise(lit("1"))
            .alias("IFRS9_STAGE"),
            col("AS_OF_DATE").alias("AS_OF_DT"),
        )
    )


def build_ifrs9_stage_base_summary(session: Session):
    stage_base = build_ifrs9_stage_base(session)
    stage_base.write.mode("overwrite").save_as_table(
        "IFRS9.STG.LOAN_ACCOUNT")

    print("IFRS9 Stage Base Summary")
    result = (
        stage_base.group_by("IFRS9_STAGE")
        .agg(
            sum_("DRAWN_AMT").alias("TOTAL_DRAWN_AMT"),
            sum_("UNDRAWN_AMT").alias("TOTAL_UNDRAWN_AMT"),
        )
        .sort("IFRS9_STAGE")
    )

    result.show(10)
    return result


def main(session: Session):
    build_ifrs9_stage_base_summary(session)


if __name__ == "__main__":
    session = Session.builder.configs({}).create()
    main(session)
