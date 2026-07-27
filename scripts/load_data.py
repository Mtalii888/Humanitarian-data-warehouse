import os
import logging
from datetime import datetime

import pandas as pd
from sqlalchemy import create_engine

# ==========================================================
# DATABASE CONFIGURATION
# ==========================================================

DB_USER = "postgres"
DB_PASSWORD = "Mutalibwke2004!"
DB_HOST = "localhost"
DB_PORT = "5432"
DB_NAME = "postgres"

SCHEMA = "aidflow"

DATA_DIR = r"C:\Users\ELITEX21012G2\Desktop\REFUGEES PROJECT\data\clean"

engine = create_engine(
    f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
)

# ==========================================================
# LOGGING
# ==========================================================

os.makedirs("logs", exist_ok=True)

logging.basicConfig(
    filename=f"logs/load_{datetime.now():%Y%m%d_%H%M%S}.log",
    level=logging.INFO,
    format="%(asctime)s %(levelname)s %(message)s"
)

console = logging.StreamHandler()
console.setLevel(logging.INFO)
logging.getLogger().addHandler(console)

logger = logging.getLogger(__name__)

# ==========================================================
# LOAD ORDER
# ==========================================================

LOAD_ORDER = [

    ("countries.csv", "dim_country"),

    ("donors.csv", "dim_donors"),

    ("inventory.csv", "dim_inventory"),

    ("field_offices.csv", "dim_offices"),

    ("projects.csv", "dim_projects"),

    ("beneficiaries.csv", "dim_beneficiaries"),

    ("refugees.csv", "fact_refugees"),

    ("funding.csv", "fact_funding"),

    ("food_distribution.csv", "fact_fooddistribution"),

    ("health_services.csv", "fact_health_services"),

    ("education_services.csv", "fact_education_services"),

    ("cash_assistance.csv", "fact_cash_assistance")

]

# ==========================================================
# FOREIGN KEY VALIDATION
# ==========================================================

FK_TABLES = {

    "country_id": "dim_country",

    "donor_id": "dim_donors",

    "office_id": "dim_offices",

    "project_id": "dim_projects",

    "ben_id": "dim_beneficiaries",

    "country_of_origin_id": "dim_country",

    "country_of_asylum_id": "dim_country"

}

# ==========================================================
# READ VALID IDS
# ==========================================================

def get_valid_ids(table, column):

    query = f"""
    SELECT {column}
    FROM {SCHEMA}.{table}
    """

    df = pd.read_sql(query, engine)

    return set(df[column])

# ==========================================================
# VALIDATE FOREIGN KEYS
# ==========================================================

def validate_foreign_keys(df):

    for column, parent_table in FK_TABLES.items():

        if column not in df.columns:
            continue

        valid_ids = get_valid_ids(parent_table, column)

        invalid = df[
            (~df[column].isin(valid_ids)) &
            (df[column].notna())
        ]

        if len(invalid) > 0:

            logger.warning(
                f"{len(invalid)} invalid rows removed because of {column}"
            )

            df = df[
                (df[column].isin(valid_ids)) |
                (df[column].isna())
            ]

    return df

# ==========================================================
# LOAD TABLE
# ==========================================================

def load_table(file_name, table_name):

    path = os.path.join(DATA_DIR, file_name)

    if not os.path.exists(path):

        logger.error(f"{file_name} not found.")

        return

    logger.info(f"Loading {file_name}")

    df = pd.read_csv(path)

    df = df.drop_duplicates()

    # Convert date columns

    for col in df.columns:

        if "date" in col.lower():

            df[col] = pd.to_datetime(df[col], errors="coerce")

    # Validate FK columns

    df = validate_foreign_keys(df)

    # Insert

    df.to_sql(

        table_name,

        engine,

        schema=SCHEMA,

        if_exists="append",

        index=False,

        chunksize=1000,

        method="multi"

    )

    logger.info(f"{len(df)} rows loaded into {table_name}")

# ==========================================================
# MAIN
# ==========================================================

def main():

    logger.info("========== ETL STARTED ==========")

    for file_name, table_name in LOAD_ORDER:

        load_table(file_name, table_name)

    logger.info("========== ETL FINISHED ==========")

if __name__ == "__main__":

    main()