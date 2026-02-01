# SQL Analytics Portfolio – Sales Performance & Customer Segmentation

## Project Overview
This repository showcases SQL skills through the design and analysis of a relational sales database. The project focuses on writing clean, business-driven SQL queries to analyze sales performance, customer behavior, and product trends.

## Dataset Description
The dataset consists of four relational tables:

- **customers**: customer attributes such as name, region, and customer type
- **products**: product details including category and unit price
- **sales_reps**: sales representative information and assigned territory
- **orders**: transaction-level sales data including order date, quantity, unit price, and total revenue

The schema is designed with **orders** as the fact table and the remaining tables as dimensions, connected via primary and foreign keys to support multi-table joins and time-based analysis.

## Repository Structure
- `schema/01_schema.sql` – table definitions and relationships
- `schema/02_seed_data.sql` – sample data for analysis
- `queries/` – SQL queries organized by topic/day

## Tools Used
- SQLite
- GitHub

## Next Steps
- Add basic SELECT and filtering queries
- Expand to JOIN-based analysis
- Implement advanced SQL (CTEs, window functions, segmentation)
