# SQL Analytics Portfolio – Sales Performance & Customer Segmentation

## Project Overview
This repository showcases my SQL skills through the design and analysis of a relational sales database. The project focuses on writing clean, business-driven SQL queries to analyze sales performance, customer behavior, and product trends using SQLite.

The work progresses from foundational SQL queries to analytical aggregations and will later expand into multi-table joins and advanced SQL concepts.

---

## Dataset Description
The dataset consists of four relational tables:

- **customers**: customer attributes such as name, region, and customer type  
- **products**: product details including category and unit price  
- **sales_reps**: sales representative information and assigned territory  
- **orders**: transaction-level sales data including order date, quantity, unit price, and total revenue  

The schema is designed with **orders as the fact table** and the remaining tables as **dimension tables**, connected via primary and foreign keys to support aggregation, segmentation, and future multi-table analysis.

---

## Repository Structure
- `schema/01_schema.sql` – table definitions and relationships  
- `schema/02_seed_data.sql` – sample data for analysis  
- `queries/02_basic_queries.sql` – basic SELECT, filtering, sorting,limiting queries, aggregation and group level analysis using GROUP BY and HAVING

---

## SQL Concepts Practiced

### 1️⃣ Basic Data Retrieval & Filtering
- SELECT all columns vs. specific columns
- Filtering using WHERE
- Sorting with ORDER BY
- Limiting results using LIMIT
- Pattern matching using LIKE

### 2️⃣ Aggregation with GROUP BY
- Total revenue per customer
- Total units sold per product
- Revenue per sales representative
- Order counts and average order value per customer

These queries demonstrate how transactional data can be summarized into meaningful business metrics.

### 3️⃣ Group-Level Filtering with HAVING
- Identifying high-value customers based on total spend
- Finding products with high sales volume
- Identifying sales reps with multiple orders
- Filtering customers based on average order value

### 4️⃣ Combining WHERE and HAVING
Queries demonstrate how:
- `WHERE` filters rows before aggregation
- `HAVING` filters aggregated results after GROUP BY

Example business question answered:
> Which customers placed at least two high-value orders?

---

## Key Takeaways
- GROUP BY defines the level of aggregation (one row per group)
- HAVING filters aggregated results
- WHERE and HAVING serve different but complementary roles
- SQL queries should always map to clear business questions

---

## Tools Used
- SQLite
- DB Browser for SQLite
- GitHub

---

## Next Steps
- Expand analysis using JOINs to enrich results with customer, product, and sales rep attributes
- Perform time-based trend analysis
- Implement advanced SQL concepts such as CTEs, window functions, and customer segmentation logic
