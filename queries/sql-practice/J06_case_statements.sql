#🚀 Now your practice

Question (resume)

Show:

* customer_id
* first_name
* completed_orders
* pending_orders

Use:

* customers
* orders
* CASE
* aggregation

Select c.customer_id, c.first_name, 
sum(case when o.order_status='completed' then 1 else 0 end ) as completed_orders,
sum(case when o.order_status='pending' then 1 else 0 end ) as pending_orders
From customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name
Order by c.customer_id;


Show:

* customer_id
* first_name
* completed_revenue
* pending_revenue

Use CASE and sum only total_amount for each status.

Select c.customer_id, c.first_name, 
sum(case when o.order_status='completed' then o.total_amount else 0 end ) as completed_revenue,
sum(case when o.order_status='pending' then o.total_amount else 0 end ) as pending_revenue
From customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name
Order by c.customer_id;


Show customer_id, first_name, high_value_orders, low_value_orders.

Where:

* total_amount >= 500 → high value
* total_amount < 500 → low value

Select c.customer_id, c.first_name, 
sum(case when o.total_amount>=100 then 1 else 0 end ) as high_value,
sum(case when o.total_amount<100 then 1 else 0 end ) as low_value
From customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name
Order by c.customer_id;

Next question:

Show:

* customer_id
* first_name
* high_value_revenue
* low_value_revenue

Where:

* total_amount >= 500 → high value revenue
* total_amount < 500 → low value revenue

select c.customer_id, c.first_name,
sum(case when o.total_amount>=100 then o.total_amount else 0 end ) as high_value_revenue,
sum(case when o.total_amount<100 then o.total_amount else 0 end ) as low_value_revenue
From customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name
Order by c.customer_id;


🚀 Next Question (CASE + Conditional Aggregation – Advanced)

Show:

* category_name
* total_orders
* high_value_orders
* low_value_orders

👉 Definitions:

* high_value_orders → total_amount >= 500
* low_value_orders → total_amount < 500

SELECT 
    c.category_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT CASE WHEN o.total_amount >= 100 THEN o.order_id END) AS high_value_orders,
    COUNT(DISTINCT CASE WHEN o.total_amount < 100 THEN o.order_id END) AS low_value_orders
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
GROUP BY c.category_id, c.category_name
ORDER BY c.category_name;

Show:

* category_name
* completed_orders
* pending_orders
* completed_revenue

Use:

* CASE
* COUNT(DISTINCT ...)
* SUM(...)

SELECT 
    c.category_name,
    COUNT(DISTINCT CASE WHEN o.order_status = 'completed' THEN o.order_id END) AS completed_orders,
    COUNT(DISTINCT CASE WHEN o.order_status = 'pending' THEN o.order_id END) AS pending_orders,
    SUM(CASE WHEN o.order_status = 'completed' THEN o.total_amount ELSE 0 END) AS completed_revenue
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
GROUP BY c.category_id, c.category_name
ORDER BY c.category_name;

🎯 Next question

Show:

* customer_id
* first_name
* completed_orders
* high_value_completed_orders

Where:

* completed + amount ≥ 500

SELECT 
	c.customer_id,
	c.first_name,
	COUNT(DISTINCT CASE WHEN o.order_status = 'completed' THEN o.order_id END) AS completed_orders,
	COUNT(DISTINCT CASE WHEN o.order_status = 'completed' AND o.total_amount >= 100 THEN o.order_id END) AS high_value_completed_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name
ORDER BY c.customer_id;
Question

Show:

* customer_id
* completed_orders

👉 Only count how many completed orders per customer
👉 No joins with order_items


Select c.customer_id,
count(case when o.order_status = 'completed' then 1  end) as completed_orders
From customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id
Order by c.customer_id;


Select c.customer_id,
sum(case when o.order_status = 'completed' then 1 else 0 end) as completed_orders
From customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id
Order by c.customer_id;

Show:

* customer_id
* total_orders
* high_value_orders

Where:total_amount >= 500 → high value

select c.customer_id,
count(o.order_id) as total_orders,
count(case when o.total_amount >= 100 then 1 end) as high_value_orders
From customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id
Order by c.customer_id;

Select c.customer_id, count(o.order_id) as total_orders,
sum(case when total_amount>=100 then 1 else 0 end) as high_value_orders
From customers c
Join orders o on c.customer_id= o.customer_id
Group by c.customer_id
Order by c.customer_id;

Now do Question 1:

Show:

* customer_id
* completed_orders

Count completed orders per customer using SUM(CASE...).

Select c.customer_id, 
sum(case when o.order_status = 'completed' then 1 else 0 end) as completed_orders
from customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id
Order by c.customer_id;

Next: Question 2

Show:

* customer_id
* completed_orders
* pending_orders

Count both in one query using SUM(CASE...).

Select c.customer_id,
sum(case when o.order_status = 'completed' then 1 else 0 end ) as completed_orders,
sum(case when o.order_status = 'pending' then 1 else 0 end ) as pending_orders
From customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id
Order by c.customer_id;

Next question

Show:

* customer_id
* completed_revenue
* pending_revenue

Use SUM(CASE...), but this time sum total_amount, not 1.


Select c.customer_id, 
sum(case when o.order_status = 'completed' then o.total_amount else 0 end) as completed_revenue,
sum(case when o.order_status = 'pending' then o.total_amount else 0 end) as pending_revenue
From customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id
Order by c.customer_id;

Next question:

Show:

* customer_id
* total_orders
* completed_orders
* completed_revenue

Use CASE + aggregation.

Select c.customer_id, count(o.order_id) as total_orders,
sum(case when o.order_status = 'completed' then 1 else 0 end) as completed_orders,
sum(case when o.order_status = 'completed' then o.total_amount else 0 end) as completed_revenue
From customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id
Order by c.customer_id;

Next question:

Show customer_id, high_value_orders, and high_value_revenue, where total_amount >= 500.

select c.customer_id,
sum(case when o.total_amount >= 100 then 1 else 0 end) as high_value_orders,
sum(case when o.total_amount >= 100 then o.total_amount else 0 end) as high_value_revenue
From customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id
Order by c.customer_id;

Next question:

Show customer_id, low_value_orders, and low_value_revenue, where total_amount < 500.
select c.customer_id,
sum(case when o.total_amount < 100 then 1 else 0 end) as low_value_orders,
sum(case when o.total_amount < 100 then o.total_amount else 0 end) as low_value_revenue
From customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id
Order by c.customer_id;

Show:

* customer_id
* completed_high_value_orders
* completed_high_value_revenue

Where:
order_status = 'completed'
AND total_amount >= 100

Select c.customer_id,
sum(case when o.order_status = 'completed' and o.total_amount >= 100 then 1 else 0 end) as completed_high_value_orders,
sum(case when o.order_status = 'completed' and o.total_amount >= 100 then o.total_amount else 0 end) as completed_high_value_revenue
From customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id
Order by c.customer_id;


Next question:

Show customer_id, pending_low_value_orders, and pending_low_value_revenue, where:
order_status = 'pending'
AND total_amount < 100

SELECT 
    c.customer_id,
    SUM(CASE WHEN o.order_status = 'pending' AND o.total_amount < 100 THEN 1 ELSE 0 END) AS pending_low_value_orders,
    SUM(CASE WHEN o.order_status = 'pending' AND o.total_amount < 100 THEN o.total_amount ELSE 0 END) AS pending_low_value_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY c.customer_id;
