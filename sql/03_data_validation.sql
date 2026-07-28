set search_path to aidflow;

select * from dim_beneficiaries;
alter table dim_beneficiaries 
drop column beneficiary_id,drop column beneficiary_code;
select ben_id,count(*)
from dim_beneficiaries 
group by ben_id 
having count(*) > 1;

select * from dim_country;
select country_id, count(*)
from dim_country 
group by country_id 
having count(*) > 1;

select * from dim_donors;
select donor_id,count(*)
from dim_donors 
group by donor_id
having count(*) > 1;

select * from dim_inventory;
select inventory_id,count(*)
from dim_inventory
group by inventory_id
having count(*) > 1;

select * from dim_offices;
select office_id,count(*)
from dim_offices 
group by office_id
having count(*) > 1;

select * from dim_projects;
select project_id,count(*)
from dim_projects 
group by project_id
having count(*) > 1;

select * from fact_cash_assistance;
alter table fact_cash_assistance
drop column cash_assistance_id;
select cash_id,count(*)
from fact_cash_assistance 
group by cash_id
having count(*) > 1;

select * from fact_education_services;
select education_id,count(*)
from fact_education_services 
group by education_id
having count(*) > 1;

select * from fact_fooddistribution;
alter table fact_fooddistribution 
drop column beneficiary_id;
alter table fact_fooddistribution 
drop column date;
select distribution_id,count(*)
from fact_fooddistribution 
group by distribution_id
having count(*) > 1;

select * from fact_funding;
alter table fact_funding 
drop column column1;
select funding_id,count(*)
from fact_funding
group by funding_id
having count(*) > 1;

select * from fact_health_services;
select service_id,count(*)
from fact_health_services
group by service_id
having count(*) > 1;

select * from fact_refugees;
select record_id,count(*)
from fact_refugees
group by record_id
having count(*) > 1;
