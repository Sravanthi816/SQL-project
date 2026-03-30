# SQL E-Commerce Project

## Overview
This project is a PostgreSQL-based e-commerce database designed to simulate a real-world business system for managing customers, products, orders, payments, and sales analytics.

## Features
- Relational database design using PostgreSQL
- Tables for customers, categories, products, orders, order items, and payments
- Sample data for testing
- Basic SQL queries for analysis and reporting
- Joins, grouping, aggregation, and filtering

## Project Structure
- `schema/01_create_tables.sql` - table creation and indexes
- `data/02_insert_sample_data.sql` - sample data inserts
- `queries/03_basic_queries.sql` - practice and business queries

## Tables
- customers
- categories
- products
- orders
- order_items
- payments

## Concepts Practiced
- SELECT
- WHERE
- ORDER BY
- JOIN / LEFT JOIN / RIGHT JOIN / FULL JOIN
- GROUP BY
- HAVING
- COUNT
- SUM
- COALESCE
- Foreign keys
- Indexes

## How to Run

### 1. Create the database
```sql
CREATE DATABASE ecommerce_db;