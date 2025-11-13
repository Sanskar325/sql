SELECT * FROM xeno.xeno_data;
-- ALTER TABLE xeno_data
--   ADD COLUMN first_name VARCHAR(100);
-- SET SQL_SAFE_UPDATES = 0;
-- UPDATE xeno_data
-- SET first_name = TRIM(SUBSTRING_INDEX(full_name, ' ', 1));
-- SET SQL_SAFE_UPDATES = 1;
--------------------------------------------------------------------------
-- ALTER TABLE xeno_data
--   ADD COLUMN signup_month VARCHAR(20);
--   SET SQL_SAFE_UPDATES = 0;
-- UPDATE xeno_data
-- SET signup_month = MONTHNAME(STR_TO_DATE(signup_date, '%d-%m-%Y'));
-- SET SQL_SAFE_UPDATES = 1;
----------------------------------------------------------
-- SELECT
--   DAYNAME(STR_TO_DATE(signup_date, '%d-%m-%Y')) AS signup_day,
--   COUNT(*) AS gmail_signups
-- FROM xeno_data
-- WHERE LOWER(email) LIKE '%@gmail.com'
-- GROUP BY signup_day
-- ORDER BY FIELD(signup_day, 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');
---------------------------------------------
-- DROP TABLE IF EXISTS vip_customers;vip_customers
-- CREATE TABLE vip_customers AS
-- SELECT *
-- FROM xeno_data
-- WHERE city IN ('Delhi', 'Mumbai', 'Bangalore')
--   AND STR_TO_DATE(signup_date, '%d-%m-%Y')
--       BETWEEN DATE_SUB('2025-04-16', INTERVAL 60 DAY) AND '2025-04-16';

-- ------------------------------------------------------------------Analytics & Reporting
-- SELECT
--   DATE_FORMAT(STR_TO_DATE(signup_date, '%d-%m-%Y'), '%Y-%m') AS month,
--   COUNT(*) AS signup_count
-- FROM xeno_data
-- WHERE STR_TO_DATE(signup_date, '%d-%m-%Y') >= DATE_SUB('2025-04-16', INTERVAL 6 MONTH)
-- GROUP BY month
-- ORDER BY month;
-------------------------------------------------------
-- SELECT city, COUNT(*) AS customer_count
-- FROM xeno_data
-- GROUP BY city
-- HAVING customer_count > 20
-- ORDER BY customer_count DESC;
---------------------------------------------------------------------
-- SELECT signup_date, COUNT(*) AS total_signups
-- FROM xeno_data
-- GROUP BY signup_date
-- ORDER BY total_signups DESC
-- LIMIT 1;
--------------------------------
-- ALTER TABLE xeno_data
--   ADD COLUMN signup_day VARCHAR(20);
SET SQL_SAFE_UPDATES = 0;
UPDATE xeno_data
SET signup_day = DAYNAME(STR_TO_DATE(signup_date, '%d-%m-%Y'));

SELECT signup_day, COUNT(*) AS signups
FROM xeno_data
GROUP BY signup_day
ORDER BY signups DESC
LIMIT 1;
SET SQL_SAFE_UPDATES = 1;

