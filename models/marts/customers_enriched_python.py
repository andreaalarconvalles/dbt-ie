import polars as pl


def model(dbt, session):
    # Configure the model
    dbt.config(materialized="table")

    # Reference the upstream model
    # dbt.ref returns a DuckDBPyRelation in dbt-duckdb
    dim_customers = dbt.ref("dim_customers")

    # Convert to Polars DataFrame
    df = dim_customers.pl()

    # Define the logic using Polars expressions
    email_domain = pl.col("email").str.split("@").list.get(1)

    df = df.with_columns(
        pl.when(email_domain.str.contains("gmail"))
        .then(pl.lit("Gmail"))
        .when(email_domain.str.contains("yahoo"))
        .then(pl.lit("Yahoo"))
        .when(
            email_domain.str.contains("hotmail") | email_domain.str.contains("outlook")
        )
        .then(pl.lit("Microsoft"))
        .otherwise(pl.lit("Other"))
        .alias("email_provider")
    )

    # Return the result
    return df
