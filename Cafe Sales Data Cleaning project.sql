-- Data Cleaning

-- Firstly, let's create a duplicate dataset to work on for later comparison,
CREATE TABLE dcf_staging
LIKE dirty_cafe_sales;

INSERT dcf_staging
SELECT *
FROM dirty_cafe_sales;

SELECT *
FROM dcf_staging;

-- Next is to rename the columns heading to change the ' ' to '_';
ALTER TABLE dcf_staging
RENAME COLUMN `Transaction ID` TO transaction_id;

ALTER TABLE dcf_staging
RENAME COLUMN `Item` TO item;

ALTER TABLE dcf_staging
RENAME COLUMN `Quantity` TO quantity;

ALTER TABLE dcf_staging
RENAME COLUMN `Price Per Unit` TO price_per_unit;

ALTER TABLE dcf_staging
RENAME COLUMN `Total Spent` TO total_spent;

ALTER TABLE dcf_staging
RENAME COLUMN `Payment Method` TO payment_method;

ALTER TABLE dcf_staging
RENAME COLUMN `Location` TO location;

ALTER TABLE dcf_staging
RENAME COLUMN `Transaction Date` TO transaction_date;

RENAME TABLE dcf_raw_data TO dcf_staging;

-- STEP 1: Remove Duplicates;
SELECT *,
ROw_NUMBER () OVER(
PARTITION BY transaction_id, item, quantity, price_per_unit, total_spent, location) AS row_num
FROM dcf_staging;

WITH duplicate_cte AS 
(
SELECT *,
ROw_NUMBER () OVER(
PARTITION BY transaction_id, item, quantity, price_per_unit, total_spent, location) AS row_num
FROM dcf_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;
-- There are no duplicates.

-- STEP 2: Standardizing data;
SELECT *
FROM dcf_staging;

SELECT LENGTH(transaction_id) AS character_count 
FROM dcf_staging
ORDER BY 1;

-- There are blank, ERROR and UNKNOWN characters in the 'item, total_spent, payment_method, location and transaction_date' column. To remove them,
UPDATE dcf_staging
SET item = NULL 
WHERE item IN ('ERROR', 'UNKNOWN', '', ' ');

SELECT DISTINCT item
FROM dcf_staging
ORDER BY 1;

UPDATE dcf_staging
SET total_spent = NULL 
WHERE total_spent IN ('ERROR', 'UNKNOWN', '', ' ');

SELECT DISTINCT total_spent
FROM dcf_staging
ORDER BY 1;

UPDATE dcf_staging
SET payment_method = NULL 
WHERE payment_method IN ('ERROR', 'UNKNOWN', '', ' ');

SELECT DISTINCT payment_method
FROM dcf_staging;

SELECT DISTINCT location
FROM dcf_staging;

UPDATE dcf_staging
SET location = NULL 
WHERE location IN ('ERROR', 'UNKNOWN', '', ' ');

UPDATE dcf_staging
SET transaction_date = NULL 
WHERE transaction_date IN ('ERROR', 'UNKNOWN', '', ' ');

ALTER TABLE dcf_staging
MODIFY COLUMN `transaction_date`DATE;

-- STEP 3: Remove NULL and blanks;
SELECT quantity, price_per_unit, total_spent
FROM dcf_staging
WHERE total_spent IS NULL;

SELECT quantity * price_per_unit AS total_spent_updated
FROM dcf_staging;

UPDATE dcf_staging
SET total_spent = quantity * price_per_unit;

SELECT DISTINCT(item), price_per_unit
FROM dcf_staging
WHERE item NOT IN ('', ' ', 'UNKNOWN', 'ERROR')
ORDER BY 1;

UPDATE dcf_staging
SET item = CASE
WHEN item IS NULL AND price_per_unit = 3 THEN 'Cake'
WHEN item IS NULL AND price_per_unit = 2 THEN 'Coffee'
WHEN item IS NULL AND price_per_unit = 1 THEN 'Cookie'
WHEN item IS NULL AND price_per_unit = 3 THEN 'Juice'
WHEN item IS NULL AND price_per_unit = 5 THEN 'Salad'
WHEN item IS NULL AND price_per_unit = 4 THEN 'Sandwich'
WHEN item IS NULL AND price_per_unit =4 THEN 'Smoothie'
WHEN item IS NULL AND price_per_unit = 1.5 THEN 'Tea'
ELSE item
END;

SELECT transaction_date
FROM dcf_staging
WHERE transaction_date IS NULL;

UPDATE dcf_staging
SET payment_method = 'Unknown'
WHERE payment_method IS NULL;

UPDATE dcf_staging
SET location = 'Unknown'
WHERE location IS NULL;

UPDATE dcf_staging
SET transaction_date = '2023-01-01'
WHERE transaction_date IS NULL;