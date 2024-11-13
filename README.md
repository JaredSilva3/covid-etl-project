# Overview
The main focus of this project is to engineer an ETL pipeline for relavent Covid-19 data. ETL is comprised of three distinct steps, Extract, Transform, and Load. Step one begins with extracting data from csv files. Next is the transformation of the data for a cleaner analysis. Lastly the updated data is loaded onto a database, PostgreSQL.
# Group Members
* Dylon
* Jared
* Lauren
* Grant
* Calum
# Operation Instructions
1. Run the SQL schema: Execute [create_tables.sql](https://github.com/JaredSilva3/covid-etl-project/blob/master/Scripts/create_tables.sql) inside PostgreSQL.
2. Import each CSV file.
# Ethical Considerations
It is of upmost importance that this project is kept to a high ethical standard. As such, certain considerations were made. For starters, it's imperative a dataset is chosen that does not leak any users personal information. This was taken into account and one was selected that keeps anonymity. Next, transparency of the datasets source is equally important. A user viewing this project should have the oppurtunity to investigate the raw data. As such a section is included that provides the data sources. Lastly, to mitigate bias in the dataset, several measures were implemented to ensure diverse representation. The dataset includes countries from across the globe, each with diverse individuals from various socioeconomic backgrounds, races, and genders.
# References
* [Coronavirus (Covid-19) Deaths](https://ourworldindata.org/covid-deaths)
