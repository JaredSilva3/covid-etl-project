import os
import pandas as pd
from sqlalchemy import create_engine

# Database connection setup
DATABASE_URL = 'postgresql://postgres:RoaMBTL%400207@localhost:5432/covid19_data'  # Update with your credentials
engine = create_engine(DATABASE_URL)

# Dynamically construct file paths
base_dir = os.path.dirname(os.path.abspath(__file__))
covid_full_data_path = os.path.join(base_dir, '../Resources/Covid-19 full data.csv')
owid_data_path = os.path.join(base_dir, '../Resources/OWID COVID Data.csv')

def extract_data():
    # Load CSV files into pandas DataFrames
    covid_full_data = pd.read_csv(covid_full_data_path)
    owid_data = pd.read_csv(owid_data_path)
    return covid_full_data, owid_data

def transform_data(covid_full_data, owid_data):
    # Transform data based on the available fields

    # Cases and deaths from Covid-19 full data
    cases_and_deaths_full_data = covid_full_data[['date', 'location', 'new_cases', 'new_deaths', 'total_cases', 'total_deaths']].copy()
    cases_and_deaths_full_data['date'] = pd.to_datetime(cases_and_deaths_full_data['date'])

    # Cases and deaths from OWID data
    cases_and_deaths_owid = owid_data[['date', 'location', 'new_cases', 'new_deaths', 'total_cases', 'total_deaths']].copy()
    cases_and_deaths_owid['date'] = pd.to_datetime(cases_and_deaths_owid['date'])

    # Death rates from OWID data
    death_rates = owid_data[['continent', 'location', 'date', 'total_cases', 'total_deaths']].copy()
    death_rates = death_rates[death_rates[['total_cases', 'total_deaths']].notnull().all(axis=1)]
    death_rates['death_rate'] = (death_rates['total_deaths'] / death_rates['total_cases']) * 100
    death_rates['date'] = pd.to_datetime(death_rates['date'])

    # Regional deaths comparison from OWID data
    regional_deaths = owid_data[['continent', 'location', 'date', 'new_deaths', 'total_deaths']].copy()
    regional_deaths = regional_deaths[regional_deaths['total_deaths'].notnull()]
    regional_deaths['date'] = pd.to_datetime(regional_deaths['date'])

    # Debugging: Print row counts for each DataFrame to ensure data is not empty
    print("Row count for cases_and_deaths_full_data:", len(cases_and_deaths_full_data))
    print("Row count for cases_and_deaths_owid:", len(cases_and_deaths_owid))
    print("Row count for death_rates:", len(death_rates))
    print("Row count for regional_deaths:", len(regional_deaths))

    return {
        "cases_and_deaths_full_data": cases_and_deaths_full_data,
        "cases_and_deaths_owid": cases_and_deaths_owid,
        "death_rates": death_rates,
        "regional_deaths": regional_deaths
    }

def load_data(transformed_data, covid_full_data, owid_data):
    # Load each DataFrame into its respective table in the database
    transformed_data["cases_and_deaths_full_data"].to_sql('cases_and_deaths_full_data', engine, if_exists='replace', index=False)
    transformed_data["cases_and_deaths_owid"].to_sql('cases_and_deaths_owid', engine, if_exists='replace', index=False)
    transformed_data["death_rates"].to_sql('death_rates', engine, if_exists='replace', index=False)
    transformed_data["regional_deaths"].to_sql('regional_deaths', engine, if_exists='replace', index=False)

    # Load raw CSV data directly into respective tables
    covid_full_data.to_sql('covid_full_data', engine, if_exists='replace', index=False)
    owid_data.to_sql('owid_data', engine, if_exists='replace', index=False)

    print("Data loaded successfully.")

def main():
    # ETL Workflow
    covid_full_data, owid_data = extract_data()
    transformed_data = transform_data(covid_full_data, owid_data)
    load_data(transformed_data, covid_full_data, owid_data)

if __name__ == "__main__":
    main()

