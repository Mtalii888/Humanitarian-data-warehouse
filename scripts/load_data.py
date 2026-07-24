from sqlalchemy import create_engine
import pandas as pd

engine = create_engine(
    "postgresql+psycopg2://postgres:Mutalibwke2004!@localhost:5432/postgres"
)

tables = {
    "countries.csv": "dim_countries",
    "donors.csv": "dim_donor",
    "field_offices.csv": "dim_offices",
    "projects.csv": "dim_projects",
    "beneficiaries.csv": "dim_beneficiaries",
    "funding.csv": "fact_funding",
    "food_distribution.csv": "fact_fooddistribution",
    "health_services.csv": "fact_health_services",
    "education_services.csv": "fact_education_services",
    "cash_assistance.csv": "fact_cash_assistance",
    "inventory.csv": "dim_inventory",
    "refugees.csv": "fact_refugees"

}

for file_name, table_name in tables.items():
    df = pd.read_csv(fr"C:\Users\ELITEX21012G2\Desktop\REFUGEES PROJECT\data\clean\{file_name}")

    df.to_sql(
        table_name,
        engine,
        schema="aidflow",
        if_exists="append",
        index=False
    )

    print(f"Loaded {table_name}")