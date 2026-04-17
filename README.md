๐ Pizza Hut Sales Analysis SQL Project
A comprehensive SQL-based business intelligence project analyzing 21,350 orders and $817,860 in revenue from a Pizza Hut dataset.

๐ Project Overview
This project explores a real-world pizza restaurant dataset using MySQL, answering key business questions across sales performance, customer behavior, and product analysis. It demonstrates proficiency in SQL joins, aggregations, window functions, and subqueries.

๐ Database Schema
orders โ order_id, order_date, order_time order_details โ order_details_id, order_id, pizza_id, quantity pizzas โ pizza_id, pizza_type_id, size, price pizza_types โ pizza_type_id, name, category, ingredients

Relationships: orders โโ< order_details >โโ pizzas โโ< pizza_types

๐ Business Questions & Insights
#	Question	Key Finding
1	Total orders placed	21,350 orders
2	Total revenue generated	$817,860.05
3	Highest-priced pizza	The Greek Pizza โ $35.95
4	Most common size ordered	Large (L) โ 18,956 units
5	Top 5 most ordered pizzas	Classic Deluxe, BBQ Chicken, Hawaiian, Pepperoni, Thai Chicken
6	Category-wise quantity	Classic > Supreme > Veggie > Chicken
7	Peak order hours	12 PMโ1 PM and 5 PMโ7 PM
8	Avg pizzas ordered per day	138 pizzas/day
9	Top 3 pizzas by revenue	Thai Chicken, BBQ Chicken, California Chicken
10	Revenue % by category	Classic 26.91% ยท Supreme 25.46% ยท Chicken 23.96% ยท Veggie 23.68%
11	Cumulative revenue over time	Steady growth tracked via window functions
12	Top 3 per category by revenue	Ranked using RANK() OVER (PARTITION BY category)
๐  SQL Concepts Used
Joins  INNER JOIN across 3โ4 tables
Aggregations  SUM(), COUNT(), AVG(), ROUND()
Group By & Order By  category/size/date grouping
Subqueries for percentage contribution calculation
Window Functions  SUM() OVER(), RANK() OVER(PARTITION BY ...)
Date/Time Functions โ HOUR(), date grouping
๐ Project Structure
๐ pizza-hut-sql-analysis/  ๐ business_insights.sql  All 12 SQL queries โโโ ๐ orders.csv โ Order timestamps โโโ ๐ order_details.csv โ Line items per order โโโ ๐ pizza_types.csv โ Pizza names, categories, ingredients โโโ ๐ pizzas.csv โ Pizza sizes and prices โโโ ๐ README.md

๐ How to Run
Create the database: sql CREATE DATABASE pizzahut; USE pizzahut;

Import the CSV files into the respective tables using MySQL Workbench or: sql LOAD DATA INFILE 'orders.csv' INTO TABLE orders FIELDS TERMINATED BY ',' IGNORE 1 ROWS;

Run the queries from business_insights.sql in sequence.

๐ Tools Used
MySQL Query execution
MySQL Workbench Schema design & import
CSV Raw dataset files

