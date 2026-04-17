# 🍕 Pizza Hut Sales Analysis — SQL Project

A comprehensive SQL-based Business Intelligence project analyzing **21,350 customer orders** and generating **$817,860.05 revenue** using a Pizza Hut sales dataset.

---

## 📌 Project Overview

This project explores a real-world pizza restaurant dataset using **MySQL** to solve business problems and uncover valuable insights.

### Key Objectives:

- Analyze sales performance
- Understand customer ordering behavior
- Identify top-selling pizzas
- Find peak business hours
- Measure category-wise revenue contribution

### Skills Demonstrated:

- SQL Joins
- Aggregations
- Subqueries
- Window Functions
- Date & Time Analysis
- Business Intelligence Reporting

---

## 🗄️ Database Schema

### Tables Used:

#### 1. orders

- order_id
- order_date
- order_time

#### 2. order_details

- order_details_id
- order_id
- pizza_id
- quantity

#### 3. pizzas

- pizza_id
- pizza_type_id
- size
- price

#### 4. pizza_types

- pizza_type_id
- name
- category
- ingredients

### Relationships:

orders → order_details → pizzas → pizza_types

---

## 📊 Business Questions & Insights

| No | Business Question | Insight |
|----|------------------|---------|
| 1 | Total Orders Placed | 21,350 |
| 2 | Total Revenue Generated | $817,860.05 |
| 3 | Highest Priced Pizza | The Greek Pizza ($35.95) |
| 4 | Most Common Size Ordered | Large (L) |
| 5 | Top 5 Most Ordered Pizzas | Classic Deluxe, BBQ Chicken, Hawaiian, Pepperoni, Thai Chicken |
| 6 | Category-wise Quantity Sold | Classic > Supreme > Veggie > Chicken |
| 7 | Peak Order Hours | 12 PM–1 PM, 5 PM–7 PM |
| 8 | Average Pizzas Ordered Per Day | 138 |
| 9 | Top 3 Revenue Generating Pizzas | Thai Chicken, BBQ Chicken, California Chicken |
| 10 | Revenue Contribution by Category | Classic (26.91%), Supreme (25.46%), Chicken (23.96%), Veggie (23.68%) |
| 11 | Cumulative Revenue Growth | Tracked using SQL Window Functions |
| 12 | Top 3 Pizzas Per Category | Ranked using RANK() |

---

## 🧠 SQL Concepts Used

### Joins

- INNER JOIN across multiple tables

### Aggregate Functions

- SUM()
- COUNT()
- AVG()
- ROUND()

### Grouping & Sorting

- GROUP BY
- ORDER BY

### Subqueries

- Percentage revenue contribution

### Window Functions

- SUM() OVER()
- RANK() OVER(PARTITION BY category)

### Date & Time Functions

- HOUR()
- Daily Sales Analysis

---

## 📁 Project Structure

pizza-hut-sql-analysis/  
│── business_insights.sql  
│── orders.csv  
│── order_details.csv  
│── pizzas.csv  
│── pizza_types.csv  
└── README.md

---

## 🚀 How to Run This Project

```sql
CREATE DATABASE pizzahut;
USE pizzahut;

/* Import CSV files into respective tables using MySQL Workbench 
   or LOAD DATA INFILE command */

LOAD DATA INFILE 'orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

LOAD DATA INFILE 'order_details.csv'
INTO TABLE order_details
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

LOAD DATA INFILE 'pizzas.csv'
INTO TABLE pizzas
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

LOAD DATA INFILE 'pizza_types.csv'
INTO TABLE pizza_types
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

/* Run business_insights.sql queries */
