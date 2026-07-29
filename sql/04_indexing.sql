set search_path to aidflow;

explain analyze
select * from dim_beneficiaries
where country_id = 12;

create index indx_beneficiaries_country
on dim_beneficiaries(country_id);

create index indx_projects_donor
on dim_projects(donor_id);

create index indx_projects_offices
on dim_projects(office_id);

create index indx_refugees_country_of_origin 
on fact_refugees(country_of_origin_id);

create index indx_refugees_country_of_asylum 
on fact_refugees(country_of_asylum_id);

create index indx_food_distribution_project 
on fact_fooddistribution(project_id);

create index indx_food_distribution_ben_id 
on fact_fooddistribution(ben_id);

create index indx_food_distribution_country_id
on fact_fooddistribution(country_id);

create index  indx_health_services_ben_id 
on fact_health_services(ben_id);

create index  indx_health_services_country_id 
on fact_health_services(country_id);

create index  indx_education_services_ben_id 
on fact_education_services(ben_id);

create index  indx_education_services_country_id 
on fact_education_services(country_id);

create index  indx_cash_assistance_country_id 
on fact_cash_assistance(country_id);

create index  indx_cash_assistance_ben_id 
on fact_cash_assistance(ben_id);

create index  indx_cash_assistance_project_id 
on fact_cash_assistance(project_id);

create index indx_fact_funding_project_id 
on fact_funding(project_id);

create index indx_fact_funding_donor_id 
on fact_funding(donor_id);

create index indx_dim_offices_country_id 
on dim_offices(country_id);


