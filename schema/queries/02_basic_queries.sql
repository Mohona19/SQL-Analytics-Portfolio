--List all customer--
SELECT * FROM csutomers;

--View only specific columns--
SELECT customer_name,region,customer_type FROM customers;

--Filtering Enterprise customers only--
SELECT customer_name,region FROM customers
WHERE customer_type= 'Enterprise';

--Filtering customers in the East Region only--
SELECT customer_name FROM customers
WHERE region = 'East';

--Orders sorted by revenue (highest first)--
SELECT order_id,total_amount FROM orders
ORDER BY total_amount DESC;

--Most recent orders--
SELECT order_id, order_date, total_amount FROM orders
ORDER BY order_date DESC;

--Top 5 highest-value orders--
SELECT order_id, total_amount FROM orders
ORDER BY total_amount DESC
LIMIT 5;

--Top 3 largest orders after March 2025--
SELECT order_id, order_date,total_amount FROM orders
WHERE order_date>= '2025-03-01'
ORDER BY total_amount DESC
LIMIT 3;

