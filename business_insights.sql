CREATE DATABASE pizzahut;
use pizzahut;
select * from pizzas;

create table orders(
  order_id int primary key not null,
  order_date date not null,
  order_time time not null
);

create table order_details(
  order_details_id int primary key not null,
  order_id int not null,
  pizza_id text not null,
  quantity int not null
);

-- Retrieve the total number of orders placed.

select count(order_id) as Orders_placed from orders;

-- Calculate the total revenue generated from pizza sales.

select round(SUM(order_details.quantity * pizzas.price),2) as total_revenue
from order_details  join pizzas
on pizzas.pizza_id = order_details.pizza_id;

-- Identify the highest-priced pizza.

select pt.name,p.price from pizzas p
join pizza_types pt
on pt.pizza_type_id = p.pizza_type_id
order by p.price desc
limit 1;

-- Identify the most common pizza size ordered.

select p.size,count(*) as times_ordered
from pizzas p join order_details od 
on p.pizza_id = od.pizza_id
group by p.size;

-- List the top 5 most ordered pizza types along with their quantities.

select pt.name,SUM(od.quantity) as quantity
from pizza_types pt join pizzas p
on pt.pizza_type_id = p.pizza_type_id
join order_details od
on od.pizza_id = p.pizza_id
group by pt.name
order by quantity desc
limit 5;

-- Join the necessary tables to find the total quantity of each pizza category ordered.

select pt.category as pizza_category,sum(od.quantity) as quantity 
from pizza_types pt join pizzas p 
on p.pizza_type_id = pt.pizza_type_id
join order_details od 
on od.pizza_id = p.pizza_id
group by pt.category
order by quantity desc;

-- Determine the distribution of orders by hour of the day.

select hour(order_time) as hourly_orders,count(order_id) from orders
group by hour(order_time)
order by hour(order_time);

-- Join relevant tables to find the category-wise distribution of pizzas.

select category,count(name) from pizza_types
group by category;

-- Group the orders by date and calculate the average number of pizzas ordered per day.

select round(avg(quantity),0) as avg_pizzas_ordered_per_day from
(select o.order_date,sum(od.quantity) as quantity from orders o 
join order_details od 
on o.order_id = od.order_id
group by o.order_date) as order_quantity;

-- Determine the top 3 most ordered pizza types based on revenue.

select pt.name, sum(p.price * od.quantity) as revenue from pizza_types pt
join pizzas p on pt.pizza_type_id = p.pizza_type_id
join order_details od on p.pizza_id = od.pizza_id
group by pt.name
order by revenue desc
limit 3;

-- Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pt.category,
    ROUND(SUM(p.price * od.quantity), 2) AS category_sales,
    ROUND(
        (SUM(p.price * od.quantity) / 
        (SELECT SUM(p2.price * od2.quantity)
         FROM pizzas p2
         JOIN order_details od2 ON p2.pizza_id = od2.pizza_id)
        ) * 100, 2
    ) AS total_revenue_percentage
FROM pizza_types pt
JOIN pizzas p ON pt.pizza_type_id = p.pizza_type_id
JOIN order_details od ON p.pizza_id = od.pizza_id
GROUP BY pt.category
ORDER BY category_sales DESC;

-- Analyze the cumulative revenue generated over time.

select order_date,revenue,sum(revenue) over(order by order_date) as cum_revenue from
(select o.order_date, ROUND(SUM(p.price * od.quantity), 2) AS revenue
from order_details od join pizzas p
on od.pizza_id = p.pizza_id
join orders o on o.order_id = od.order_id
group by o.order_date) as sales;

-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select name,revenue from
(select category,name,revenue,
rank() over(partition by category order by revenue desc) as rn from
(select pt.category,pt.name,ROUND(SUM(p.price * od.quantity), 2) AS revenue 
from pizza_types pt 
join pizzas p on pt.pizza_type_id = p.pizza_type_id
join order_details od on od.pizza_id = p.pizza_id
group by pt.category,pt.name) as a) as b where rn <= 3;
