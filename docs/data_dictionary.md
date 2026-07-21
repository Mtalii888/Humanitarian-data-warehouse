# Data Dictionary

## AidFlow Analytics Platform

**Version:** 1.0

**Description:** This document defines the datasets used in the AidFlow Analytics Platform, including column names, data types, descriptions, and business rules.

---

# Countries

**Description:** Stores countries where humanitarian operations are conducted.

| Column | Data Type | Description | Example |
|------|------|------|------|
| country_id | Integer | Unique country identifier | 1 |
| country_name | Text | Official country name | Kenya |
| region | Text | Geographic region | East Africa |
| iso_code | Text | ISO 3-letter country code | KEN |

**Business Rules:**

- country_id must be unique.
- country_name cannot be null.
- iso_code must contain three characters.

---

# Donors

**Description:** Contains organizations that fund humanitarian projects.

| Column | Data Type | Description | Example |
|------|------|------|------|
| donor_id | Integer | Unique donor identifier | 3 |
| donor_name | Text | Name of donor organization | USAID |
| donor_type | Text | Type of donor | Government |
| headquarters_country | Text | Donor headquarters country | USA |

**Business Rules:**

- donor_id must be unique.
- donor_name cannot be null.

---

# Field Offices

**Description:** Represents operational offices managing humanitarian activities.

| Column | Data Type | Description | Example |
|------|------|------|------|
| office_id | Integer | Unique office identifier | 1 |
| office_code | Text | Unique office code | FO-001 |
| country | Text | Country where office operates | Kenya |
| city | Text | City where office is located | Nairobi |

**Business Rules:**

- office_code must be unique.
- country and city must correspond correctly.

---

# Projects

**Description:** Contains humanitarian projects managed by field offices.

| Column | Data Type | Description | Example |
|------|------|------|------|
| project_id | Integer | Unique project identifier | 101 |
| project_name | Text | Name of project | Emergency Food Response |
| office_id | Integer | Managing field office | 5 |
| start_date | Date | Project start date | 2024-01-01 |
| end_date | Date | Project end date | 2025-12-31 |
| project_status | Text | Current project status | Active |

**Business Rules:**

- project_id must be unique.
- end_date cannot be before start_date.

---

# Beneficiaries

**Description:** Contains demographic information about aid recipients.

| Column | Data Type | Description | Example |
|------|------|------|------|
| beneficiary_id | Integer | Unique beneficiary identifier | 2054 |
| full_name | Text | Beneficiary full name | John Doe |
| gender | Text | Gender | Male |
| age | Integer | Age in years | 35 |
| country | Text | Country of residence | Kenya |
| refugee_status | Text | Refugee or host community status | Refugee |

**Business Rules:**

- beneficiary_id must be unique.
- age must be greater than zero.
- gender cannot be blank.

---

# Refugees

**Description:** Contains refugee registration and settlement information.

| Column | Data Type | Description | Example |
|------|------|------|------|
| refugee_id | Integer | Unique refugee identifier | 120 |
| beneficiary_id | Integer | Linked beneficiary | 2501 |
| camp_name | Text | Refugee settlement | Kakuma |
| country | Text | Host country | Kenya |
| registration_date | Date | Registration date | 2024-05-15 |

**Business Rules:**

- beneficiary_id must exist in beneficiaries.
- registration_date cannot be in the future.

---

# Inventory

**Description:** Tracks humanitarian supplies stored in warehouses.

| Column | Data Type | Description | Example |
|------|------|------|------|
| inventory_id | Integer | Inventory identifier | 800 |
| product_name | Text | Name of relief item | Rice |
| warehouse | Text | Storage location | Nairobi Warehouse |
| quantity_in_stock | Integer | Current stock quantity | 2500 |
| unit | Text | Measurement unit | Kg |

**Business Rules:**

- quantity_in_stock cannot be negative.
- product_name cannot be null.

---

# Food Distribution

**Description:** Records food distributed to beneficiaries.

| Column | Data Type | Description | Example |
|------|------|------|------|
| distribution_id | Integer | Distribution identifier | 5001 |
| beneficiary_id | Integer | Recipient beneficiary | 2054 |
| project_id | Integer | Associated project | 12 |
| product_name | Text | Food item distributed | Rice |
| quantity | Decimal | Quantity distributed | 25.5 |
| distribution_date | Date | Date of distribution | 2024-08-10 |

**Business Rules:**

- quantity must be greater than zero.
- distribution_date must be valid.

---

# Health Services

**Description:** Records healthcare services provided to beneficiaries.

| Column | Data Type | Description | Example |
|------|------|------|------|
| service_id | Integer | Service identifier | 4020 |
| beneficiary_id | Integer | Patient identifier | 1400 |
| facility_code | Text | Health facility code | HF-005 |
| service_type | Text | Type of service | Vaccination |
| country | Text | Service country | Uganda |
| service_date | Date | Date service was provided | 2024-09-11 |
| outcome | Text | Service outcome | Recovered |

**Business Rules:**

- beneficiary_id must exist.
- service_date cannot be in the future.

---

# Education Services

**Description:** Tracks education assistance delivered to beneficiaries.

| Column | Data Type | Description | Example |
|------|------|------|------|
| education_id | Integer | Education record identifier | 205 |
| beneficiary_id | Integer | Student identifier | 900 |
| school_code | Text | School identifier | SCH-020 |
| education_level | Text | Level of education | Secondary |
| country | Text | Country | Ethiopia |
| enrollment_date | Date | Enrollment date | 2024-02-01 |
| status | Text | Enrollment status | Enrolled |

**Business Rules:**

- education_level cannot be null.
- enrollment_date must be valid.

---

# Cash Assistance

**Description:** Records financial assistance issued to beneficiaries.

| Column | Data Type | Description | Example |
|------|------|------|------|
| cash_assistance_id | Integer | Payment identifier | 600 |
| beneficiary_id | Integer | Recipient beneficiary | 3001 |
| project_id | Integer | Associated project | 18 |
| country | Text | Country | Somalia |
| amount | Decimal | Amount issued | 150.00 |
| currency | Text | Currency | USD |
| payment_method | Text | Payment method | Mobile Money |
| payment_date | Date | Date of payment | 2024-07-12 |

**Business Rules:**

- amount must be greater than zero.
- currency should follow ISO currency codes.
- payment_date cannot be in the future.

---

# Funding

**Description:** Stores donor funding allocated to humanitarian projects.

| Column | Data Type | Description | Example |
|------|------|------|------|
| funding_id | Integer | Funding record identifier | 20 |
| project_id | Integer | Supported project | 10 |
| donor_id | Integer | Funding organization | 2 |
| approved_budget | Decimal | Approved project budget | 350000.00 |
| amount_spent | Decimal | Total expenditure | 175000.00 |
| remaining_budget | Decimal | Remaining funds | 175000.00 |
| currency | Text | Budget currency | USD |
| fiscal_year | Integer | Financial year | 2025 |

**Business Rules:**

- approved_budget must be greater than zero.
- amount_spent cannot be negative.
- remaining_budget = approved_budget − amount_spent.
- fiscal_year must be a valid year.

---

# Dataset Relationships

| Parent Table | Child Table | Relationship |
|------|------|------|
| Countries | Field Offices | One-to-Many |
| Field Offices | Projects | One-to-Many |
| Projects | Food Distribution | One-to-Many |
| Projects | Cash Assistance | One-to-Many |
| Projects | Funding | One-to-Many |
| Donors | Funding | One-to-Many |
| Beneficiaries | Refugees | One-to-Many |
| Beneficiaries | Food Distribution | One-to-Many |
| Beneficiaries | Health Services | One-to-Many |
| Beneficiaries | Education Services | One-to-Many |
| Beneficiaries | Cash Assistance | One-to-Many |

---

# General Data Quality Rules

- Primary keys must be unique.
- Foreign keys must reference valid parent records.
- Mandatory fields cannot be null.
- Dates must follow the YYYY-MM-DD format.
- Country names should be standardized.
- Duplicate records should be removed during ETL.
- Numeric measures should not be negative unless explicitly allowed by business rules.
- Data should be validated before loading into PostgreSQL.