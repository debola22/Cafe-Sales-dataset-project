# Cafe-Sales-dataset-project
Data Cleaning and Exploratory Data Analysis using SQL

This project focuses on cleaning, organizing, and analyzing a retail transaction dataset using MySQL.
As a beginner data analyst, this project helped me practice;
- transaction_id
- item
- quantity
- price_per_unit
- total_spent
- payment_method
- location
- transaction_date
This project was completed using MySQL for data cleaning and analysis.
It demonstrates skills in data preparation, feature engineering, SQL analytics, and reporting.

## DATA CLEANING SUMMARY
The following cleaning operations were performed in MYSQL:
## Handling missing values
- Replaced NULL values in item, payment_method and loaction.
- Replaced or standardized NULL values in transaction_date
- Checked for blank spaces " ", ERROR and UNKNOWN, and converted to NULL before cleaning
## Standardized column values
- Removed spaces in column names
- Converted inconsistent string formats
- Fixed typos and unified category names
## Fixed numerical columns
- Calculated missing total_spent using:
  total_spent = quantity * price_per_unit
- Validated negative or abnormal values
- Ensured price and quantity values were numeric
## Ensured consistent data types
- Converted transaction_date to DATE
- Converted numeric columns to INT and DECIMAL

## EXPLORATORY DATA ANALYSIS (EDA)
The project includes 25 SQL-based EDA questions, covering:
## Basic EDA
- Total records and duplicates
- Unique item count
- Summary statistics (min, max, avg)
- Most frequent locations and payment methods
- Daily, weekly and monthly sales trends
## Advanced EDA 
- Item co-occurence (basket analysis)
- Location-based revenue analysis
- Price-demand correlation
- Revenue distribution across payment methods
- Coefficient of variation to detect unstable sales locations

All queries are available
- 
