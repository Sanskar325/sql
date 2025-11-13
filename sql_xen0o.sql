
-- SELECT * FROM xeno_data 
-- WHERE city = 'Delhi';
------------------------------
-- SELECT COUNT(*) AS signups_last_30_days
-- FROM xeno_data
-- WHERE STR_TO_DATE(signup_date, '%d-%m-%Y')
--       BETWEEN DATE_SUB('2025-04-16', INTERVAL 30 DAY) AND '2025-04-16';
---------------------------------------
-- SELECT DISTINCT city
-- FROM xeno_data
-- ORDER BY city;

---------------------------------------------
-- SELECT city, COUNT(*) AS total_signups
-- FROM xeno_data
-- GROUP BY city
-- ORDER BY total_signups DESC
-- LIMIT 3;

-----------------------------------------

-- CREATE TABLE orders (
--   order_id INT AUTO_INCREMENT PRIMARY KEY,
--   customer_id INT,
--   amount DECIMAL(10,2)
-- );
-- SELECT c.*
-- FROM xeno_data c
-- LEFT JOIN orders o ON c.customer_id = o.customer_id
-- WHERE o.customer_id IS NULL;
-- ------------------------------------------ Data Transformation & Enrichment

UPDATE xeno_data
SET is_gmail = CASE
  WHEN LOWER(email) LIKE '%@gmail.com' THEN 'Yes'
  ELSE 'No'
END;



