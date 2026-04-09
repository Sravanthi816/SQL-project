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

👉 Sort the result from highest average price to lowest average price.

SELECT c.category_name, AVG(p.price) AS average_price
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name
ORDER BY average_price DESC;

#Write a SQL query to show:
    •	customer_id
	•	first_name
	•	total number of orders
	•	total amount spent
#👉Show all customers (even with no orders)
#👉Sort by total amount spent (highest → lowest)

Select c.customer_id, c.first_name, count(o.order_id) as total_orders, coalesce(sum(o.total_amount),0) as total_money_spent
From customers c 
Left join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name
Order by total_money_spent desc;

#Write a SQL query to show:
	•	product_name
	•	category_name
	•	price

for all products whose price is greater than the average price of all products.

Sort the result by price from highest to lowest.

Select p.product_name, c.category_name, p.price
From products p
Join categories c on p.category_id = c.category_id 
Where p.price>(select avg(price) from products)
Order by p.price desc;

#Write a SQL query to show:
	•	customer_id
	•	first_name
	•	last_name

for customers who have not placed any orders.

Select c.customer_id, c.first_name, c.last_name
From customers c 
Left join orders o on c.customer_id= o.customer_id
Where  o.order_id is NULL
Order by o.customer_id desc;


SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(o.order_id) = 0;


#Write a SQL query to show:
	•	product_name
	•	price

for the top 3 most expensive products.

Select p.product_name, p.price from products p
Order by p.price desc
Limit 3;

#Write a SQL query to show:
	•	category_name
	•	total number of products in each category

but show only categories that have more than 1 product.
Select c.customer_id, c.first_name, c.last_name, count(o.order_id) as total_number_of_orders
From customers c
Left join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having (count(o.order_id))>=2
Order by c.customer_id asc;


#Write a SQL query to show:
	•	product_name
	•	price

for products whose price is between 20 and 80.

Sort the result by price from lowest to highest.

Select p.product_name, p.price from products p 
Where p.price between 20 and 80
Order by p.price asc;
#Where  p.price >=20 AND p.price<=80


#
Write a SQL query to show:
	•	customer_id
	•	total number of orders
	•	total amount spent

for each customer in the orders table only.

Sort the result by total amount spent from highest to lowest.

# Write a SQL query to show:
	•	customer_id
	•	average order amount

from the orders table,

but show only customers whose average order amount is greater than 100.

Sort the result by average order amount from highest to lowest.

Select customer_id, count(o.order_id)
From orders o
Group by customer_id
Having (count(o.order_id) =2)
Order by customer_id asc;

#Write a SQL query to show:
	•	product_name
	•	category_name
	•	price

for all products in the Electronics category.

Sort the result by price from highest to lowest.

Select c.category_id, c.category_name, p.product_name, p.price from categories c
Join products p on c.category_id =p.category_id
where c.category_name= 'Electronics'
Order by p.price desc;

#Write a SQL query to show:
	•	customer_id
	•	first_name
	•	last_name

for customers who placed at least one order.

Sort the result by customer_id.

#Write a SQL query to show:
	•	product_name
	•	price

for products that are not in the Electronics category.

Sort the result by price from highest to lowest

Select p.product_name, p.price from categories c
Join products p on c.category_id =p.category_id
where c.category_name<> 'Electronics'
Order by p.price desc;

SELECT p.product_name, p.price
FROM products p
JOIN categories c ON p.category_id = c.category_id
WHERE c.category_name <> 'Electronics'
ORDER BY p.price DESC;

SELECT p.product_name, p.price
FROM products p
JOIN categories c ON p.category_id = c.category_id
WHERE c.category_name != 'Electronics'
ORDER BY p.price DESC;

#Write a SQL query to show:
	•	customer_id
	•	first_name
	•	last_name
	•	total amount spent

for customers whose total spending is between 100 and 300.

Sort the result by total amount spent from highest to lowest.

Select c.customer_id, c.first_name, c.last_name, coalesce(sum(o.total_amount),0) as total_amount_spent
From customers c
Left join orders o on c.customer_id=o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having coalesce(sum(o.total_amount),0) between 100 and 300
Order by  total_amount_spent desc;

#Write a SQL query to show:
	•	category_name
	•	average product price

but show only categories whose average product price is greater than 30.

Sort the result by average product price from highest to lowest.

Select c.category_name, avg(p.price) as average_product_price
From categories c
Join products p on c.category_id = p.category_id
GROUP BY c.category_id, c.category_name
Having (avg(p.price) >30)
Order by average_product_price desc;

#Write a SQL query to show:
	•	customer_id
	•	first_name
	•	last_name
	•	total number of orders

for customers who placed between 1 and 2 orders.

Sort the result by total number of orders from highest to lowest.

Select c.customer_id, c.first_name, c.last_name, count(o.order_id) as total_orders
From customers c
Join orders o on c.customer_id =o.customer_id
Group by  c.customer_id, c.first_name, c.last_name
Having (count(o.order_id)) between 1 and 2
Order by total_orders desc;

# Write a SQL query to show:
	•	category_name
	•	total number of products
	•	average product price

for each category.

Sort the result by average product price from highest to lowest.

Select c.category_name, count(p.product_id) as total_number_products, avg(p.price) as average_product_price
From categories c
Join products p on c.category_id = p.category_id
Group by c.category_id, c.category_name
Order by average_product_price desc; 

#Write a SQL query to show:
	•	customer_id
	•	first_name
	•	last_name
	•	average order amount

for customers whose average order amount is between 100 and 200.

Sort the result by average order amount from highest to lowest.
Select c.customer_id, c.first_name, c.last_name, round(avg(o.total_amount) :: numeric, 2)as average_order_amount 
From customers c
Join orders o on c.customer_id =o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having (avg(o.total_amount) between 100 and 200)
Order by average_order_amount desc;

#Write a SQL query to show:
	•	product_name
	•	price
	•	category_name

for products whose price is less than the average price of all products.

Sort the result by price from lowest to highest.

Select p.product_name, p.price, c.category_name
From products p
Join categories c on p.category_id =c.category_id
Group by p.product_name, p.price, c.category_name
Having (p.price < avg(p.price))
Order by p.price asc;

#Write a SQL query to show:
	•	customer_id
	•	first_name
	•	last_name
	•	total amount spent

for customers whose total spending is greater than the average total spending of all customers.

Select c.customer_id, c.first_name, c.last_name, sum(o.total_amount) as total_amount_spent
from customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having (sum(o.total_amount) > 
(Select avg(customer_total)
from(
Select customer_id, sum(total_amount) as customer_total
From orders
Group by customer_id
)As customer_spending
)
)
order by total_amount_spent desc;

#Now write the next SQL query:

Show:
	•	product_name
	•	price
	•	category_name

for products whose price is greater than the average price of products in the same category.

Select p.product_name, p.price, c.category_name
From products p
Join categories c on p.category_id =c.category_id
Where p.price>(select avg(p2.price)
From products p2
Where p2.category_id=p.category_id);

#Write a SQL query to show:
	•	customer_id
	•	first_name
	•	last_name
	•	total number of orders
	•	total amount spent

for customers who have spent more than 200 in total
and placed more than 1 order

Sort the result by total amount spent from highest to lowest.

Select c.customer_id, c.first_name, c.last_name, count(o.order_id) as total_orders, sum(o.total_amount) as total_amount_spent
From customers c
Join orders o on c.customer_id =o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having ((sum(o.total_amount)>200) and (count(o.order_id)>1))
Order by total_amount_spent desc;


#Write a SQL query to show:
	•	category_name
	•	total number of products
	•	total value of all product prices in that category

for categories whose total value is greater than 100.

Sort the result by total value from highest to lowest

Select c.category_id, c.category_name, count(p.product_id) as total_no_of_products, sum(p.price) as total_value
From categories c
Join products p on c.category_id = p.category_id
Group by c.category_id, c.category_name
Having (sum(p.price) >100)
Order by total_value desc;

#Write a SQL query to show:
	•	product_name
	•	price

for products whose price is greater than the average price of all products.

Select product_name, price from products
Where price >( select avg(price) from products );

#Subquery Question 2

Write a SQL query to show:
	•	customer_id
	•	first_name
	•	last_name

for customers whose total spending is greater than the average total spending of all customers.
Select c.customer_id, c.first_name, c.last_name, count(o.order_id), sum(o.total_amount) as total_amount_spent
From customers c
Join orders o on c.customer_id=o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having (sum(o.total_amount) > (
Select avg(customer_total) from
(select customer_id, sum(total_amount) as customer_total
From orders
Group by customer_id) as customer_spending
))
Order by total_amount_spent desc;


#Write a SQL query to show:
	•	customer_id
	•	first_name
	•	last_name

for customers who have placed at least one order

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name
FROM customers c
WHERE c.customer_id IN (
    SELECT o.customer_id
    FROM orders o
);

#Write a SQL query to show:
	•	product_name
	•	price

for products that belong to categories that have more than 2 products

👉 Use a subquery with IN
👉 Do NOT use JOIN in the outer query

Select p.product_name, p.price from products p 
Where p.category_id in (
Select category_id from products
Group by category_id
having (count(product_id)>2));


Write a SQL query to show:
	•	first_name
	•	last_name

for customers whose customer_id does not appear in the orders table.
Select c.first_name, c.last_name from customers c
Where  not exists (select  1 
from orders o
Where o.customer_id=c.customer_id);


Select c.first_name, c.last_name from customers c
Where c.customer_id not in (select o.customer_id from orders o);

#Write a SQL query to show:
	•	product_name
	•	price

for products whose price is equal to the maximum price in the entire products table

Select p.product_name, p.price from products p
Where p.price = (select max(price) from products); 

Write a SQL query to show:
	•	product_name
	•	price

for products whose price is greater than the average price of their own category
Select p.product_name, p.price from products p
Where p.price> ( select avg(p2.price) from
Products p2
Where p2.category_id = p.category_id);

Select p.product_name, p.price from products p
Where p.price< ( select avg(p2.price) from
Products p2
Where p2.category_id = p.category_id);

Select p.product_name, p.price from products p
Where p.price< ( select avg(p2.price) from
Products p2
Where p2.category_id <> p.category_id);
Write a SQL query to show:
	•	customer_id
	•	first_name
	•	last_name

for customers whose total spending is less than the average total spending of all customers


Select c.customer_id, c.first_name, c.last_name, sum(o.total_amount) as total_amount_spent
from customers c 
Join orders o on c.customer_id =o.customer_id
Group by c.customer_id, c.first_name, c.last_name 
Having (sum(o.total_amount)<(
Select avg(customer_total) From 
(select customer_id, sum(total_amount) as customer_total 
from orders
Group by customer_id)as customer_spending
))
Order by total_amount_spent desc;

Write a SQL query to show:
	•	product_name
	•	price

for products whose price is less than the average price of products in the same category.

Select p.product_name, p.price from products p
Where p.price < (select(avg(p2.price)) from
Products p2
Where p2.category_id=p.category_id);

Select p.product_name, p.price from products p
Where p.price >(select(avg(p2.price)) from
Products p2
Where p2.category_id=p.category_id);

#Write a SQL query to show:
	•	first_name
	•	last_name

for customers whose customer_id appears more than once in the orders table.
Select c.first_name, c.last_name from customers c
Where customer_id in (select o.customer_id from orders o);

Write a SQL query to show:
	•	product_name
	•	price

for products whose category_id appears only once in the products table.



Select p.product_name, p.price from products p
Where p.category_id in (
select category_id from products
group by category_id
having count(product_id) = 1 );

#Write a SQL query to show:
	•	customer_id
	•	first_name
	•	last_name
	•	total number of orders

for customers whose total number of orders is equal to the maximum number of orders placed by any customer

select c.customer_id, c.first_name, c.last_name, count(o.order_id) as total_orders
from customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having count(o.order_id) = (
select max(order_count) from (
select customer_id, count(order_id) as order_count
from orders
group by customer_id) as order_counts
);	

#Write a SQL query to show:
	•	category_name
	•	average price of products in that category

for categories where the average price is greater than the overall average price of all products

Select c.category_name, avg(p.price) as average_price
From categories c
Join products p on c.category_id = p.category_id 
Group by c.category_id,c.category_name
Having ((avg(p.price))> (select avg(p2.price) from products p2));

#Write a SQL query to show:
	•	first_name
	•	last_name

for customers whose total spending is exactly equal to the maximum total spending by any customer.
Select c.first_name, c.last_name, sum(o.total_amount) as total_spent
from customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having (sum(o.total_amount))=( select (max(max_spent)) 
from (select customer_id, sum(o2.total_amount) as max_spent from orders o2
Group by customer_id)as total_money);


#Write a SQL query to show:
	•	product_name
	•	price

for products whose price is equal to the minimum price in their own category.

Select p.product_name, p.price from products p 
Where p.price = (select min(p2.price) from products p2
Where p2.category_id =p.category_id);

Select p.product_name, p.price from products p 
Where p.price != (select min(p2.price) from products p2
Where p2.category_id =p.category_id);

#Write a SQL query to show:
	•	first_name
	•	last_name

for customers whose total number of orders is less than the average number of orders per customer.

select c.first_name, c.last_name, count(o.order_id) as total_orders
from customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having count(o.order_id) < (select avg(order_count) from (
select customer_id, count(order_id) as order_count
from orders
group by customer_id) as order_counts
);


