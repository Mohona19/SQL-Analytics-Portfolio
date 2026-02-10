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

--pattern matching--
SELECT customer_name
FROM customers
WHERE customer_name LIKE '%Co%';

--Total Revenue per customer--
SELECT customer_id, SUM(total_amount) AS total_revenue 
FROM orders
GROUP BY customer_id;

--Total quantity sold per product--
SELECT
  product_id,
  SUM(quantity) AS total_units_sold
FROM orders
GROUP BY product_id;

--Total revenue per sales rep--
SELECT
  sales_rep_id,
  SUM(total_amount) AS total_revenue
FROM orders
GROUP BY sales_rep_id;

--Number of orders per customer--
SELECT
  customer_id,
  COUNT(*) AS order_count
FROM orders
GROUP BY customer_id;

--Average order value per customer--
SELECT
  customer_id,
  AVG(total_amount) AS avg_order_value
FROM orders
GROUP BY customer_id;

--Customers with total revenue greater than 2000--
SELECT
  customer_id,
  SUM(total_amount) AS total_revenue
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 2000;

--Products with more than 15 units sold--
SELECT
  product_id,
  SUM(quantity) AS total_units_sold
FROM orders
GROUP BY product_id
HAVING SUM(quantity) > 15;

--Sales reps with more than 2 orders--
SELECT
  sales_rep_id,
  COUNT(*) AS order_count
FROM orders
GROUP BY sales_rep_id
HAVING COUNT(*) > 2;

--Customers with average order value above 1000--
SELECT
  customer_id,
  AVG(total_amount) AS avg_order_value
FROM orders
GROUP BY customer_id
HAVING AVG(total_amount) > 1000;

--High-value customers (at least 2 large orders)--
SELECT
  customer_id,
  COUNT(*) AS large_order_count
FROM orders
WHERE total_amount > 1000
GROUP BY customer_id
HAVING COUNT(*) >= 2;
