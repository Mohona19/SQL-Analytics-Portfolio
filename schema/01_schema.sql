DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS sales_reps;

CREATE TABLE customers (
customer_id INTEGER PRIMARY KEY,
customer_name TEXT NOT NULL,
region TEXT NOT NULL,
customer_type TEXT NOT NULL
);

CREATE TABLE products (
product_id INTEGER PRIMARY KEY,
product_name TEXT NOT NULL,
category TEXT NOT NULL,
price REAL NOT NULL
);

CREATE TABLE sales_reps (
sales_rep_id INTEGER PRIMARY KEY,
sales_rep_name TEXT NOT NULL,
territory TEXT NOT NULL
);

CREATE TABLE orders (
order_id INTEGER PRIMARY KEY,
customer_id INTEGER NOT NULL,
product_id INTEGER NOT NULL,
sales_rep_id INTEGER NOT NULL,
order_date DATE NOT NULL,
quantity INTEGER NOT NULL,
unit_price REAL NOT NULL,
total_amount REAL NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id),
FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

