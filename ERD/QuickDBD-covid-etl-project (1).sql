﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Rm9Pfa
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Covid_19_full_data" (
    "date" DATE,
    "location" VARCHAR,
    "new_cases" INT,
    "new_deaths" INT,
    "total_cases" INT,
    "total_deaths" INT,
    "weekly_cases" INT,
    "weekly_deaths" INT,
    "biweekly_cases" INT,
    "biweekly_deaths" INT,
    CONSTRAINT "pk_Covid_19_full_data" PRIMARY KEY ("date", "location")

CREATE TABLE "OWID_Covid" (
    "iso_code" VARCHAR,
    "continent" VARCHAR,
    "location" VARCHAR,
    "date" DATE,
    "total_cases" INT,
    "new_cases" INT,
    "new_cases_smoothed" FLOAT,
    "total_deaths" INT,
    "new_deaths" INT,
    "new_deaths_smoothed" FLOAT,
    "total_cases_per_million" FLOAT,
    "new_cases_per_million" FLOAT,
    "new_cases_smoothed_per_million" FLOAT,
    "total_deaths_per_million" FLOAT,
    "new_deaths_per_million" FLOAT,
    "new_deaths_smoothed_per_million" FLOAT,
    "reproduction_rate" FLOAT,
    "icu_patients" INT,
    "icu_patients_per_million" FLOAT,
    "hosp_patients" INT,
    "hosp_patients_per_million" FLOAT,
    "weekly_icu_admissions" INT,
    "weekly_icu_admissions_per_million" FLOAT,
    "weekly_hosp_admissions" INT,
    "weekly_hosp_admissions_per_million" FLOAT,
    "total_tests" BIGINT,
    "new_tests" INT,
    "total_tests_per_thousand" FLOAT,
    "new_tests_per_thousand" FLOAT,
    "new_tests_smoothed" FLOAT,
    "new_tests_smoothed_per_thousand" FLOAT,
    "positive_rate" FLOAT,
    "tests_per_case" FLOAT,
    "tests_units" VARCHAR,
    "total_vaccinations" BIGINT,
    "people_vaccinated" BIGINT,
    "people_fully_vaccinated" BIGINT,
    "total_boosters" BIGINT,
    "new_vaccinations" INT,
    "new_vaccinations_smoothed" FLOAT,
    "total_vaccinations_per_hundred" FLOAT,
    "people_vaccinated_per_hundred" FLOAT,
    "people_fully_vaccinated_per_hundred" FLOAT,
    "total_boosters_per_hundred" FLOAT,
    "new_vaccinations_smoothed_per_million" FLOAT,
    "new_people_vaccinated_smoothed" FLOAT,
    "new_people_vaccinated_smoothed_per_hundred" FLOAT,
    "stringency_index" FLOAT,
    "population_density" FLOAT,
    "median_age" FLOAT,
    "aged_65_older" FLOAT,
    "aged_70_older" FLOAT,
    "gdp_per_capita" FLOAT,
    "extreme_poverty" FLOAT,
    "cardiovasc_death_rate" FLOAT,
    "diabetes_prevalence" FLOAT,
    "female_smokers" FLOAT,
    "male_smokers" FLOAT,
    "handwashing_facilities" FLOAT,
    "hospital_beds_per_thousand" FLOAT,
    "life_expectancy" FLOAT,
    "human_development_index" FLOAT,
    "population" FLOAT,
    "excess_mortality_cumulative_absolute" FLOAT,
    "excess_mortality_cumulative" FLOAT,
    "excess_mortality" FLOAT,
    "excess_mortality_cumulative_per_million" FLOAT);

	
