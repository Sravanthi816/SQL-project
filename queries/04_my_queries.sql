# select all products and order them by price in ascending order
SELECT P.product_id, P.product_name, P.price FROM PRODUCTS P
ORDER BY P.price ASC;

# select all products and order them by price in descending order
SELECT P.product_id, P.product_name, P.price FROM PRODUCTS P
ORDER BY P.price DESC;

# Using LIMIT to get the top 5 most expensive products
SELECT P.product_id, P.product_name, P.price FROM PRODUCTS P
ORDER BY P.price DESC
LIMIT 5;    

# Using LIMIT to get the top 5 least expensive products
SELECT P.product_id, P.product_name, P.price FROM PRODUCTS P
ORDER BY P.price ASC
LIMIT 5;

#Write a SQL query to show:
	•	product_id
	•	product_name
	•	price

SELECT p.product_id, p.product_name, p.price
FROM products p
WHERE p.price > 50
ORDER BY p.price DESC;
#Write a SQL query to show:
    •	customer_id
    •	first_name
    •	last_name
    • total_orders (the total number of orders placed by each customer)

SELECT c.customer_id, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_orders DESC;

Select c.customer_id, c.first_name, c.last_name, count(o.order_id) as total_orders from customers c 
left join orders o on c.customer_id = o.customer_id
group by c.first_name, c.last_name, c.customer_id
order by total_orders asc;

#Write a SQL query to show:
    •	customer_id
    •	first_name
    •	last_name
    • total_amount (the total amount spent by each customer)

SELECT c.customer_id, c.first_name, c.last_name, coalesce(sum(o.total_amount),0) as total_amount 
from customers c
Left join  orders o on  c.customer_id=o.customer_id
Group by c.first_name, c.last_name, c.customer_id
Order by total_amount  desc;


Select  customer_id, Count(o.order_id) from orders o
Group by customer_id;

#Write a SQL query to show:
	•	customer_id
	•	total amount spent by each customer

But show only customers whose total spending is greater than 200.

Sort the result from highest spending to lowest.

Select customer_id, sum(total_amount) as total_spent
From orders
Group by customer_id
Having sum(total_amount) >200
Order by total_spent desc;


#Write a SQL query to show:
	•	c.customer_id
	•	c.first_name
	•	total number of orders placed by each customer
    Using:
	•	customers table
	•	orders table
    Condition

👉 show only customers who placed more than 1 order

Sort

👉 highest number of orders first

Select c.customer_id, c.first_name , count(o.order_id) as total_orders 
from customers c
Left join orders o on c.customer_id=o.customer_id
Group by c.customer_id, c.first_name
Having count(o.order_id)>1
Order by total_orders Desc;

#Write a SQL query to show:
	•	c.category_name
	•	average product price in each category

Using:
	•	categories table
	•	products table

Sort the result from highest average price to lowest average price.

SELECT c.category_name, AVG(p.price) AS average_price
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name
ORDER BY average_price DESC;

