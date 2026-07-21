# System Architecture

## Overview

The AidFlow Analytics Platform follows a layered analytics architecture that transforms raw operational data into analytics-ready datasets for reporting and decision-making.

The architecture is designed to demonstrate a complete analytics engineering workflow, including data ingestion, cleaning, validation, warehousing, SQL transformations, and Power BI reporting.

---

## Architecture Flow

```text
Raw CSV Files
    ↓
Python ETL (Pandas)
    ↓
Data Cleaning & Validation
    ↓
Clean CSV Files
    ↓
PostgreSQL Data Warehouse
    ↓
SQL Transformations & Views
    ↓
Power BI Dashboards
    ↓
Business Insights
```

---

## Architecture Layers

### 1. Raw Data Layer

The raw data layer contains the original CSV files collected from multiple operational sources. These files are stored without modification to preserve the original source data.

**Location:**

```text
data/raw/
```

**Datasets:**

- countries_raw.csv
- donors_raw.csv
- field_offices_raw.csv
- projects_raw.csv
- beneficiaries_raw.csv
- refugees_raw.csv
- inventory_raw.csv
- food_distribution_raw.csv
- health_services_raw.csv
- education_services_raw.csv
- cash_assistance_raw.csv
- funding_raw.csv

**Characteristics:**

- May contain missing values
- May contain duplicates
- May contain inconsistent formatting
- May contain invalid records
- Serves as the immutable source layer

---

### 2. ETL and Data Cleaning Layer

Python and Pandas are used to extract, clean, standardize, and validate the raw datasets.

**Key cleaning tasks:**

- Remove leading and trailing whitespace
- Standardize text casing
- Handle missing values
- Remove duplicate records
- Validate dates
- Validate numeric values
- Standardize country names
- Correct invalid location mappings
- Recalculate derived fields where necessary

**Tools used:**

- Python
- Pandas
- NumPy

---

### 3. Clean Data Layer

The clean data layer contains validated and standardized datasets that are ready for loading into PostgreSQL.

**Location:**

```text
data/clean/
```

**Purpose:**

- Provide analytics-ready data
- Ensure consistent formatting
- Preserve referential integrity
- Remove invalid records
- Support repeatable ETL processes

---

### 4. PostgreSQL Data Warehouse Layer

The cleaned datasets are loaded into a PostgreSQL database designed using a dimensional model.

#### Dimension Tables

- dim_country
- dim_donor
- dim_office
- dim_project
- dim_beneficiary
- dim_date

#### Fact Tables

- fact_food_distribution
- fact_health_services
- fact_education_services
- fact_cash_assistance
- fact_funding

**Purpose:**

- Store historical data
- Support analytical queries
- Optimize reporting performance
- Enable star schema relationships

---

### 5. SQL Transformation Layer

SQL is used to create analytical views and business-ready datasets.

**Examples:**

- Food distribution summaries
- Funding utilization reports
- Beneficiary statistics
- Country-level dashboards
- Project performance metrics
- Monthly trend analysis

**SQL techniques demonstrated:**

- Joins
- Common Table Expressions (CTEs)
- Window functions
- Aggregations
- Views
- Query optimization

---

### 6. Reporting and Visualization Layer

Power BI connects to the PostgreSQL warehouse and analytical views to create interactive dashboards.

**Dashboards include:**

- Executive overview
- Beneficiary demographics
- Food distribution analysis
- Health service delivery
- Education support analysis
- Cash assistance tracking
- Donor funding analysis
- Budget utilization

---

## Data Flow Diagram

```text
┌─────────────────────┐
│   Raw CSV Files     │
└─────────┬───────────┘
          ↓
┌─────────────────────┐
│ Python ETL (Pandas) │
└─────────┬───────────┘
          ↓
┌─────────────────────┐
│ Data Cleaning       │
│ & Validation        │
└─────────┬───────────┘
          ↓
┌─────────────────────┐
│ Clean CSV Files     │
└─────────┬───────────┘
          ↓
┌─────────────────────┐
│ PostgreSQL          │
│ Data Warehouse      │
└─────────┬───────────┘
          ↓
┌─────────────────────┐
│ SQL Views           │
│ & Transformations   │
└─────────┬───────────┘
          ↓
┌─────────────────────┐
│ Power BI Dashboards │
└─────────┬───────────┘
          ↓
┌─────────────────────┐
│ Business Insights   │
└─────────────────────┘
```

---

## Star Schema Overview

```text
                     dim_date
                        │
                        │
dim_donor ────────┐    │
                   │    │
dim_project ─────┼────┼──────── fact_funding
                   │    │
dim_office ──────┘    │
                        │
                        │
dim_beneficiary ──┼──────── fact_food_distribution
                        │
                        ├──────── fact_health_services
                        │
                        ├──────── fact_education_services
                        │
                        └──────── fact_cash_assistance
```

---

## Technology Stack

| Layer | Technology |
|------|------|
| Data Storage | CSV Files |
| ETL | Python, Pandas |
| Data Cleaning | Pandas, NumPy |
| Database | PostgreSQL |
| Transformations | SQL |
| Visualization | Power BI |
| Version Control | Git, GitHub |
| Development | VS Code |

---

## Data Quality Controls

The ETL process includes the following validation checks:

- Duplicate detection
- Missing value checks
- Data type validation
- Date format validation
- Numeric range validation
- Foreign key validation
- Country and city validation
- Budget consistency checks
- Negative value checks

---

## Design Principles

- Raw data remains unchanged.
- Clean data is stored separately.
- Transformations are reproducible.
- The warehouse uses a star schema.
- Reporting is based on analytical views.
- Documentation is maintained for all datasets and processes.

---

## Purpose of the Architecture

This architecture demonstrates how an analytics engineering solution can transform operational humanitarian data into reliable, scalable, and analytics-ready information for decision-makers.