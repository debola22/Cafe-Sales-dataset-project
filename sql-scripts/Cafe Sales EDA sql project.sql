-- Exploratory Data Analysis

-- To count the total number of transactions;
SELECT COUNT(*) AS total_transactions
FROM dcf_staging;

-- To count how many unique items were sold;
SELECT COUNT(DISTINCT item) AS unique_items
FROM dcf_staging;

-- To calculate the total revenue generated;
SELECT SUM(total_spent) AS total_revenue
FROM dcf_staging;

-- To calculate the average amount spent per transaction;
SELECT AVG(total_spent) AS avg_spent
FROM dcf_staging;

-- To know the total quantity sold for each item;
SELECT item, SUM(quantity) AS total_quantity
FROM dcf_staging
GROUP BY item
ORDER BY total_quantity DESC;

-- To calculate the revenue generated per item;
SELECT item, SUM(total_spent) AS revenue
FROM dcf_staging
GROUP BY item
ORDER BY revenue DESC;

-- To know the most popular item (highest sales volume);
SELECT item, COUNT(*) AS times_purchased
FROM dcf_staging
GROUP BY item
ORDER BY times_purchased DESC
LIMIT 1;

-- To know the most profitable item (highest revenue);
SELECT item, SUM(total_spent) AS total_revenue
FROM dcf_staging
GROUP BY item
ORDER BY total_revenue DESC
LIMIT 1;

-- To know the number of transactions per payment method;
SELECT payment_method, COUNT(*) AS total_transactions
FROM dcf_staging
GROUP BY payment_method
ORDER BY total_transactions DESC;

-- To calculate the revenue per payment method;
SELECT payment_method, SUM(total_spent) AS revenue
FROM dcf_staging
GROUP BY payment_method
ORDER BY revenue DESC;

-- To know the most used location;
SELECT location, COUNT(*) AS usage_count
FROM dcf_staging
GROUP BY location
ORDER BY usage_count DESC;

-- To know the revenue per location;
SELECT location, SUM(total_spent) AS revenue
FROM dcf_staging
GROUP BY location
ORDER BY revenue DESC;

-- To calculate the transactions by date;
SELECT transaction_date, COUNT(*) AS transactions
FROM dcf_staging
GROUP BY transaction_date
ORDER BY transaction_date;

-- To calculate the revenue by date;
SELECT transaction_date, SUM(total_spent) AS daily_revenue
FROM dcf_staging
GROUP BY transaction_date
ORDER BY transaction_date;

-- To know the top 5 highest value transactions;
SELECT *
FROM dcf_staging
ORDER BY total_spent DESC
LIMIT 5;

-- To calculate the average price per item;
SELECT item, AVG(price_per_unit) AS avg_price
FROM dcf_staging
GROUP BY item
ORDER BY avg_price DESC;

-- To know the items with missing/NULL values (data quality check);
SELECT *
FROM dcf_staging
WHERE item IS NULL
   OR payment_method IS NULL
   OR location IS NULL
   OR transaction_date IS NULL;
   
-- To calculate the daily average quantity sold;
SELECT transaction_date, AVG(quantity) AS avg_quantity
FROM dcf_staging
GROUP BY transaction_date
ORDER BY transaction_date;

-- Compare revenue across items and locations;
SELECT item, location, SUM(total_spent) AS revenue
FROM dcf_staging
GROUP BY item, location
ORDER BY revenue DESC;

-- To know the daily transaction trends;
SELECT DAYNAME(transaction_date) AS day_name, COUNT(*) AS transactions
FROM dcf_staging
GROUP BY day_name
ORDER BY day_name;

-- To check the locations that have the highest average transaction value;
SELECT location, ROUND(AVG(total_spent), 2) AS avg_transaction_value
FROM dcf_staging
GROUP BY location
ORDER BY avg_transaction_value DESC;

-- To check which items show the strongest price-demand relationship;
SELECT 
    item, ROUND(
               (SUM(quantity * price_per_unit) -
               (SUM(quantity) *  SUM(price_per_unit) / COUNT(*))) /
               (SQRT(SUM(quantity * quantity) - (SUM(quantity) * SUM(quantity) / COUNT(*))) *
               SQRT(SUM(price_per_unit * price_per_unit) - (SUM(price_per_unit) * SUM(price_per_unit) / COUNT(*))))
               , 3) AS correlation_q_p
               FROM dcf_staging
               GROUP BY item;
               
-- To identify customers' preferred payment method for each location;
SELECT location, payment_method, COUNT(*) AS total_used
FROM dcf_staging
GROUP BY location, payment_method
ORDER BY location, total_used DESC;

-- To know what day of the week generates the highest revenue;
SELECT 
     DAYNAME(transaction_date) AS day_of_week,
     SUM(total_spent) AS total_revenue
FROM dcf_staging
GROUP BY day_of_week
ORDER BY total_revenue DESC;

-- To know which items are mostly bought together?
SELECT a.item AS item1, b.item AS item2,
COUNT(*) AS frequency
FROM dcf_staging a
JOIN dcf_staging b
  ON a.transaction_id = b.transaction_id
   AND a.item < b.item
GROUP BY item1, item2
ORDER BY frequency DESC;
