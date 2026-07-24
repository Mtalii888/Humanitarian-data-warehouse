set search_path to aidflow;

create table dim_country(
country_code varchar(5) not null,
country_name varchar(20) unique,
region varchar(20) not null,
country_id int primary key );

create table dim_donors(
donor_id int primary key,
donor_name varchar(10) unique,
donor_type varchar(20) not null
);

create table dim_offices(
office_id int primary key,
office_code varchar(10) unique,
country_id int not null references dim_country(country_id),
city varchar(20) not null 
);
select * from dim_country;

create table dim_projects(
project_id int primary key,
project_code varchar(10) unique,
theme varchar(15) not null,
donor_id int not null references dim_donors(donor_id),
office_id int not null references dim_offices(office_id)
);

create table dim_beneficiaries(
ben_id int primary key,
ben_code varchar(15) unique,
full_name varchar(60) not null,
gender varchar(10) not null,
age int not null,
country_id int not null references dim_country(country_id),
status varchar(20)
);

create table dim_inventory(
inventory_id int primary key,
warehouse_code varchar(10) not null,
item_name varchar(20) not null,
stock_quantity int not null,
last_updated date not null 
);

create table fact_refugees(
record_id int primary key,
year int not null,
country_of_origin_id int not null references dim_country(country_id),
country_of_asylum_id int not null references dim_country(country_id),
refugees int not null,
asylum_seekers int not null,
idps int not null
);

create table fact_fooddistribution(
distribution_id int primary key,
project_id int not null references dim_projects(project_id),
ben_id int not null references dim_beneficiaries(ben_id),
food_item varchar(30) not null,
quantity int not null,
unit varchar(2),
country_id int not null references dim_country(country_id),
date date,
warehouse_code varchar(10) not null 
);

create table fact_health_services(
service_id int primary key,
ben_id int not null references dim_beneficiaries(ben_id),
facility_code varchar(10) not null,
service_type varchar(20) not null,
country_id int not null references dim_country(country_id),
service_date date not null,
outcome varchar(20)
);

create table fact_education_services(
education_id int primary key,
ben_id int not null references dim_beneficiaries(ben_id),
school_code varchar(10) not null,
education_level varchar(16) not null,
country_id int not null references dim_country(country_id),
enrollment_date date,
status varchar(20)
);

create table fact_cash_assistance(
cash_id int primary key,
ben_id int not null references dim_beneficiaries(ben_id),
project_id int not null references dim_projects(project_id),
country_id int not null references dim_country(country_id),
amount float,
currency varchar(5) not null,
payment_method varchar(15) not null,
payment_date date
);

create table fact_funding(
funding_id int primary key,
project_id int not null references dim_projects(project_id),
donor_id int not null references dim_donors(donor_id),
approved_budget numeric(15,2),
amount_spent numeric(15,2),
remaining_budget numeric(15,2),
currency varchar(5) not null,
fiscal_year int
);



