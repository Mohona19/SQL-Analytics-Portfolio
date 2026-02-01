INSERT INTO customers (customer_id, customer_name, region, customer_type) VALUES
(1, 'Alpha Corp', 'East', 'Enterprise'),
(2, 'Beta LLC', 'West', 'SMB'),
(3, 'Gamma Inc', 'South', 'Enterprise'),
(4, 'Delta Co', 'North', 'SMB'),
(5, 'Epsilon Partners', 'East', 'SMB'),
(6, 'Zeta Group', 'West', 'Enterprise');

INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Quicklime (Q)', 'Raw Materials', 120.00),
(2, 'Hydrated Lime (HL)', 'Processed', 200.00),
(3, 'Limestone (LS)', 'Raw Materials', 90.00),
(4, 'Dolomitic Lime (DL)', 'Processed', 150.00),
(5, 'Slaked Lime (SL)', 'Processed', 180.00);

INSERT INTO sales_reps (sales_rep_id, sales_rep_name, territory) VALUES
(1, 'John Smith', 'East'),
(2, 'Maria Lopez', 'West'),
(3, 'Kevin Brown', 'South'),
(4, 'Aisha Rahman', 'North');

-- Orders span multiple months to support time-trend analysis
INSERT INTO orders (order_id, customer_id, product_id, sales_rep_id, order_date, quantity, unit_price, total_amount) VALUES
(101, 1, 1, 1, '2025-01-10', 10, 120.00, 1200.00),
(102, 2, 4, 2, '2025-01-12', 5, 150.00, 750.00),
(103, 3, 2, 3, '2025-02-05', 8, 200.00, 1600.00),
(104, 1, 4, 1, '2025-02-10', 6, 150.00, 900.00),
(105, 4, 3, 4, '2025-03-01', 20, 90.00, 1800.00),
(106, 5, 1, 1, '2025-03-08', 7, 120.00, 840.00),
(107, 6, 5, 2, '2025-03-15', 4, 180.00, 720.00),
(108, 2, 3, 2, '2025-04-02', 18, 90.00, 1620.00),
(109, 3, 2, 3, '2025-04-18', 3, 200.00, 600.00),
(110, 1, 5, 1, '2025-05-04', 6, 180.00, 1080.00),
(111, 4, 1, 4, '2025-05-20', 12, 120.00, 1440.00),
(112, 6, 4, 2, '2025-06-09', 9, 150.00, 1350.00);
