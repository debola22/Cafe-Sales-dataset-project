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
- Cafe_Sales_EDA_sql_project.sql

  ## KEY INSIGHTS
  - Instore location generated the highest total revenue
  - Cake had the strongest purchase frequency
  - Digital Wallet was the most preferred payment method across all regions
  - Most transactions occurred on Sundays and Mondays.
  - High-value purchases mainly came from premium items.
 
    ## ABOUT ME
    Omole Adebola
    4th-Year Radiography Student - Beginner Data Analyst
    Learning SQL, & EDA

    ## If you found this helpful
    Please star the repo - it motivates me to keep learning and building new projects.
    
 ## PROJECT SUMMARY
 In this project, I worked with a cafe sales dataset that different issues such as **missing values (NULLs)**, **incosistent entries**, and **incorrect data formats**. The main goal was to clean the data and then perform  **exploratory data analysis (EDA)** using **MySQL**.

 During the cleaning process, I handled:
 - NULL values in important columns such as 'item','payment_method', 'location', and 'transaction_date'
 - Inconsistent text values in the 'item' and 'payment_method' columns
 - Incorrect data type in the 'transaction_date' column
 - Errors in 'total_spent' by verifying it with 'quantity * price_per_unit'

   After cleaning the dataset, I carried out EDA to better understand the sales patterns. Some of the key insights I discovered include:
   - The **best-selling items** based on total quantity sold
   - The **top revenue-generating items** using total spent
   - The most frequently used **payment method**
   - The most active **location** for transactions
   - The general **trend of transactions over time**
  
   This project helped me improve my skills in:
   - Writing SQL queries
   - Updating and cleaning data properly
   - Using aggregate functions (SUM, COUNT, AVG, GROUP BY)
   - Thinking like a data analyst when exploring a dataset
  
   Overall, this project served as a strong foundation for learning **data cleaning** and **exploratory data anaysis using SQL**.
