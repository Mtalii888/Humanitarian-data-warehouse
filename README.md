# AidFlow Analytics Platform

## Overview

AidFlow Analytics Platform is an end-to-end analytics engineering project that simulates a real-world humanitarian data platform. The project integrates multiple operational datasets into a centralized PostgreSQL data warehouse to support reporting, analytics, and decision-making.

The platform demonstrates the complete analytics lifecycle, including data cleaning, ETL, dimensional modeling, SQL analytics, and interactive Power BI dashboards.

---

## Project Objectives

- Build an analytics-ready humanitarian data warehouse.
- Clean and validate raw datasets using Python (Pandas).
- Design a star schema in PostgreSQL.
- Develop advanced SQL queries for analytical reporting.
- Build executive dashboards using Power BI.
- Demonstrate analytics engineering best practices.

---

## Technologies Used

- Python
- Pandas
- PostgreSQL
- SQL
- Power BI
- Git & GitHub
- Visual Studio Code

---

## Project Structure

```text
aidflow-analytics-platform/
│
├── data/
│   ├── raw/
│   └── clean/
│
├── docs/
│
├── notebooks/
│
├── sql/
│
├── scripts/
│
├── powerbi/
│
├── requirements.txt
│
└── README.md
```

---

## Data Sources

This project uses realistic humanitarian datasets inspired by publicly available information from organizations such as:

- Humanitarian Data Exchange (HDX)
- UNHCR
- World Bank
- UNICEF

The datasets were transformed into a simulated enterprise environment for educational and portfolio purposes.

---

## Datasets

The project includes the following datasets:

- Countries
- Donors
- Field Offices
- Projects
- Beneficiaries
- Refugees
- Inventory
- Food Distribution
- Health Services
- Education Services
- Cash Assistance
- Funding

---

## ETL Workflow

1. Load raw CSV files.
2. Explore and profile the data.
3. Clean data using Pandas.
4. Validate data quality.
5. Export cleaned datasets.
6. Load data into PostgreSQL.
7. Create fact and dimension tables.
8. Build analytical SQL views.
9. Connect Power BI for reporting.

---

## Data Warehouse

The project follows a dimensional model using fact and dimension tables.

### Dimension Tables

- dim_country
- dim_donor
- dim_office
- dim_project
- dim_beneficiary
- dim_date

### Fact Tables

- fact_food_distribution
- fact_health_services
- fact_education_services
- fact_cash_assistance
- fact_funding

---

## Dashboards

The Power BI dashboards provide insights into:

- Beneficiary demographics
- Food distribution
- Health service delivery
- Education support
- Cash assistance
- Donor funding
- Budget utilization
- Project performance


---

## Repository Documentation

Additional documentation is available in the **docs/** folder:

- Project Overview
- Data Dictionary
- System Architecture
- Star Schema

---




## Author

**Ben Muchilwa**

Data Analyst | Analytics Engineering Enthusiast

Skills:

- SQL
- Python
- PostgreSQL
- Power BI
- Excel
- Git

---

## License

This project is intended for educational and portfolio purposes.
