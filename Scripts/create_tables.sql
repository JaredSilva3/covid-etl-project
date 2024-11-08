-- SQL script for setting up the COVID-19 ETL Project database and tables
-- This script should be run in a PostgreSQL environment.
-- If the database already exists, skip the CREATE DATABASE line.

-- Step 1: Create the database (uncomment this line if the database is not yet created)
CREATE DATABASE covid19_data;

-- Step 2: Connect to the covid19_data database
\c covid19_data;

-- Step 3: Create the Covid_19_full_data table
CREATE TABLE IF NOT EXISTS Covid_full_data (
    date DATE,
    location VARCHAR,
    new_cases INT,
    new_deaths INT,
    total_cases INT,
    total_deaths INT,
    weekly_cases INT,
    weekly_deaths INT,
    biweekly_cases INT,
    biweekly_deaths INT,
    PRIMARY KEY (date, location)
);

-- Step 4: Create the OWID_Covid table
CREATE TABLE IF NOT EXISTS OWID_data (
    iso_code VARCHAR,
    continent VARCHAR,
    location VARCHAR,
    date DATE,
    total_cases INT,
    new_cases INT,
    new_cases_smoothed FLOAT,
    total_deaths INT,
    new_deaths INT,
    new_deaths_smoothed FLOAT,
    total_cases_per_million FLOAT,
    new_cases_per_million FLOAT,
    new_cases_smoothed_per_million FLOAT,
    total_deaths_per_million FLOAT,
    new_deaths_per_million FLOAT,
    new_deaths_smoothed_per_million FLOAT,
    reproduction_rate FLOAT,
    icu_patients INT,
    icu_patients_per_million FLOAT,
    hosp_patients INT,
    hosp_patients_per_million FLOAT,
    weekly_icu_admissions INT,
    weekly_icu_admissions_per_million FLOAT,
    weekly_hosp_admissions INT,
    weekly_hosp_admissions_per_million FLOAT,
    total_tests BIGINT,
    new_tests INT,
    total_tests_per_thousand FLOAT,
    new_tests_per_thousand FLOAT,
    new_tests_smoothed FLOAT,
    new_tests_smoothed_per_thousand FLOAT,
    positive_rate FLOAT,
    tests_per_case FLOAT,
    tests_units VARCHAR,
    total_vaccinations BIGINT,
    people_vaccinated BIGINT,
    people_fully_vaccinated BIGINT,
    total_boosters BIGINT,
    new_vaccinations INT,
    new_vaccinations_smoothed FLOAT,
    total_vaccinations_per_hundred FLOAT,
    people_vaccinated_per_hundred FLOAT,
    people_fully_vaccinated_per_hundred FLOAT,
    total_boosters_per_hundred FLOAT,
    new_vaccinations_smoothed_per_million FLOAT,
    new_people_vaccinated_smoothed FLOAT,
    new_people_vaccinated_smoothed_per_hundred FLOAT,
    stringency_index FLOAT,
    population_density FLOAT,
    median_age FLOAT,
    aged_65_older FLOAT,
    aged_70_older FLOAT,
    gdp_per_capita FLOAT,
    extreme_poverty FLOAT,
    cardiovasc_death_rate FLOAT,
    diabetes_prevalence FLOAT,
    female_smokers FLOAT,
    male_smokers FLOAT,
    handwashing_facilities FLOAT,
    hospital_beds_per_thousand FLOAT,
    life_expectancy FLOAT,
    human_development_index FLOAT,
    population FLOAT,
    excess_mortality_cumulative_absolute FLOAT,
    excess_mortality_cumulative FLOAT,
    excess_mortality FLOAT,
    excess_mortality_cumulative_per_million FLOAT,
    PRIMARY KEY (location, date)
);
