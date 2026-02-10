/* ============================================================
   JOINS (SQLite)
   Dataset: customers, products, sales_reps, orders
   Goal: Move from IDs to business-readable analysis
   ============================================================ */

-- 0) Sanity check: confirm row counts
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'sales_reps', COUNT(*) FROM sales_reps
UNION ALL
SELECT 'orders', COUNT(*) FROM orders;


-- ============================================================
-- 1) INNER JOIN fundamentals (fact -> dimension)
-- ============================================================

-- 1.1 Orders with customer name + region
SELECT
  o.order_id,
  o.order_date,
  c.customer_name,
  c.region,
  o.total_amount
FROM orders o
JOIN customers c
  ON o.customer_id = c.customer_id
ORDER BY o.order_date;

-- 1.2 Orders with product details
SELECT
  o.order_id,
  o.order_date,
  p.product_name,
  p.category,
  o.quantity,
  o.unit_price,
  o.total_amount
FROM orders o
JOIN products p
  ON o.product_id = p.product_id
ORDER BY o.order_date;

-- 1.3 Orders with sales rep details
SELECT
  o.order_id,
  o.order_date,
  s.sales_rep_name,
  s.territory,
  o.total_amount
FROM orders o
JOIN sales_reps s
  ON o.sales_rep_id = s.sales_rep_id
ORDER BY o.order_date;


-- ============================================================
-- 2) Multi-table JOIN (portfolio “business view”)
-- ============================================================

-- 2.1 Full business view: one row per order with all context
SELECT
  o.order_id,
  o.order_date,
  c.customer_name,
  c.customer_type,
  c.region,
  p.product_name,
  p.category,
  s.sales_rep_name,
  s.territory,
  o.quantity,
  o.unit_price,
  o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p  ON o.product_id  = p.product_id
JOIN sales_reps s ON o.sales_rep_id = s.sales_rep_id
ORDER BY o.order_date;


-- ============================================================
-- 3) JOIN + GROUP BY (analytics)
-- ============================================================

-- 3.1 Total revenue by customer (names instead of IDs)
SELECT
  c.customer_name,
  SUM(o.total_amount) AS total_revenue
FROM orders o
JOIN customers c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_revenue DESC;

-- 3.2 Total revenue by region
SELECT
  c.region,
  SUM(o.total_amount) AS total_revenue
FROM orders o
JOIN customers c
  ON o.customer_id = c.customer_id
GROUP BY c.region
ORDER BY total_revenue DESC;

-- 3.3 Units sold and revenue by product
SELECT
  p.product_name,
  SUM(o.quantity) AS total_units_sold,
  SUM(o.total_amount) AS total_revenue
FROM orders o
JOIN products p
  ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- 3.4 Revenue by sales rep
SELECT
  s.sales_rep_name,
  s.territory,
  SUM(o.total_amount) AS total_revenue
FROM orders o
JOIN sales_reps s
  ON o.sales_rep_id = s.sales_rep_id
GROUP BY s.sales_rep_name, s.territory
ORDER BY total_revenue DESC;


-- ============================================================
-- 4) LEFT JOIN patterns (find missing relationships)
-- ============================================================

-- 4.1 Customers with NO orders (should be none with current seed data)
SELECT
  c.customer_id,
  c.customer_name,
  c.region
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 4.2 Products that have NEVER been ordered (if any)
SELECT
  p.product_id,
  p.product_name,
  p.category
FROM products p
LEFT JOIN orders o
  ON p.product_id = o.product_id
WHERE o.order_id IS NULL;

-- 4.3 Sales reps with NO orders (if any)
SELECT
  s.sales_rep_id,
  s.sales_rep_name,
  s.territory
FROM sales_reps s
LEFT JOIN orders o
  ON s.sales_rep_id = o.sales_rep_id
WHERE o.order_id IS NULL;


-- ============================================================
-- 5) Join-based business questions (portfolio-ready)
-- ============================================================

-- 5.1 Top customers by revenue (with type + region)
SELECT
  c.customer_name,
  c.customer_type,
  c.region,
  SUM(o.total_amount) AS total_revenue
FROM orders o
JOIN customers c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_name, c.customer_type, c.region
ORDER BY total_revenue DESC;

-- 5.2 Enterprise vs SMB revenue contribution
SELECT
  c.customer_type,
  SUM(o.total_amount) AS total_revenue
FROM orders o
JOIN customers c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_type
ORDER BY total_revenue DESC;

-- 5.3 Revenue by rep within their territory (spot misalignment later)
SELECT
  s.territory,
  s.sales_rep_name,
  SUM(o.total_amount) AS total_revenue
FROM orders o
JOIN sales_reps s
  ON o.sales_rep_id = s.sales_rep_id
GROUP BY s.territory, s.sales_rep_name
ORDER BY s.territory, total_revenue DESC;
