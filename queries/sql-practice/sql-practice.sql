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

Write a SQL query to show:
	•	category_name
	•	the highest product price in that category

for categories whose highest product price is less than the overall highest product price in the products table

Select c.category_name, max(p.price) from categories c
Join products p on c.category_id = p.category_id
Group by c.category_id, c.category_name
Having max(p.price) <(select max(p2.price) from products p2 );


Write a SQL query to show:
	•	customer_id
	•	first_name
	•	last_name

for customers who have placed exactly the same number of orders as the average number of orders per customer

Select c.customer_id, c.first_name, c.last_name, count(o.order_id) as total_orders from customers c
Join orders o on c.customer_id = o.customer_id 
Group by c.customer_id, c.first_name, c.last_name
Having count(o.order_id) =(select round(avg(avg_number_orders)) from 
(Select customer_id, count(o2.order_id) as avg_number_orders from orders o2 
Group by customer_id) as totat_avg_orders);

Select c.customer_id, c.first_name, c.last_name, count(o.order_id) as total_orders from customers c
Join orders o on c.customer_id = o.customer_id 
Group by c.customer_id, c.first_name, c.last_name
Having count(o.order_id) =(select cast(avg(avg_number_orders) as integer) from 
(Select customer_id, count(o2.order_id) as avg_number_orders from orders o2 
Group by customer_id) as totat_avg_orders);


Write a SQL query to show:
	•	product_name
	•	price

for products whose price is greater than the average price of all products but less than the maximum price in their category


Select p.product_name, p.price from products p
Where p.price > (select avg(p1.price) from products p1)
And  p.price < (select max(p2.price) from products p2
Where p2.category_id = p.category_id);


Write a SQL query to show:
	•	first_name
	•	last_name

for customers whose total spending is greater than the minimum total spending by any customer.


Select c.first_name, c.last_name, sum(total_amount) as total_spending  from customers c
Join orders o on c.customer_id = o.customer_id 
Group by c.customer_id, c.first_name, c.last_name
Having sum(total_amount) >(select min(total_spent) from 
( select customer_id, sum(o.total_amount) as total_spent from orders o
Group by customer_id) 
As total_spending_amount)
Order by total_spending desc;


Write a SQL query to show:
	•	category_name
	•	total number of products

for categories whose product count is greater than the average product count across all categories.

Select c.category_name, count(p.product_id) as total_number_of_products from categories c
Join products p on c.category_id = p.category_id
Group by c.category_id, c.category_name
Having  count(p.product_id) > (select  avg(product_count) from 
(Select category_id, count(product_id) as product_count from products
Group by category_id) as category_product_counts);


Write a SQL query to show:
	•	first_name
	•	last_name

for customers whose total spending is between the minimum and maximum total spending of all customers, but not equal to either one.

select c.first_name, c.last_name, sum(o.total_amount) as total_spent from customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having sum(o.total_amount) > (select min(total_spent) from
(select customer_id, sum(o2.total_amount) as total_spent from orders o2
Group by customer_id) as total_spending_amount)
And sum(o.total_amount) < (select max(total_spent) from
(select customer_id, sum(o3.total_amount) as total_spent from orders o3
Group by customer_id) as total_spending_amount)
Order by total_spent desc;
#Write a SQL query to show:
	•	product_name
	•	price

for products whose price is between the average and maximum price of their own category, but not equal to either one.
select p.product_name, p.price from products p
Where p.price > (select avg(p1.price) from products p1
Where p1.category_id = p.category_id)		
And p.price < (select max(p2.price) from products p2
Where p2.category_id = p.category_id);
#Write a SQL query to show:
	•	customer_id
	•	first_name
	•	last_name

for customers who have placed more orders than at least one other customer


Select c.customer_id, c.first_name, c.last_name, count(o.order_id) as total_orders from customers c
Join orders o on c.customer_id =o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having count(o.order_id) > (select min(orders) from (select customer_id, count(o1.order_id) as orders from orders o1
Group by customer_id) as order_counts);

#Write a SQL query to show:
	•	customer_id
	•	total number of orders

for customers who have placed more orders than the average number of orders across all customers
Select c.customer_id , count(o.order_id) as total_orders from customers c 
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id
Having count(o.order_id) > (select avg(avg_no_orders) from 
(Select customer_id, count(o1.order_id) as avg_no_orders 
from orders o1
Group by customer_id) as total_avg_orders);

#Write a SQL query to show:
	•	product_name
	•	price

for products whose price is greater than the average price of all products
but less than the maximum price of all products.

Select p.product_name, p.price from products p
Where p.price > (select avg(p1.price) from products p1) 
And  p.price < (select max(p2.price) from products p2);

#Write a SQL query to show:
	•	first_name
	•	last_name

for customers whose total spending is greater than the average total spending of all customers
but less than the maximum total spending of any customer.

select c.first_name, c.last_name, sum(o.total_amount) as total_spent from customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having sum(o.total_amount) > (select avg(total_spent) from
(select customer_id, sum(o1.total_amount) as total_spent from orders o1
Group by customer_id) as total_spending_amount)
And sum(o.total_amount) < (select max(total_spent) from
(select customer_id, sum(o2.total_amount) as total_spent from orders o2
Group by customer_id) as total_spending_amount);

#Write a SQL query to show:
	•	category_name
	•	total value of products (sum of prices)

for categories whose total value is greater than the average total value across all categories
Select c.category_name, sum(p.price) from categories c
Join products p on c.category_id = p.category_id
Group by c.category_id,c.category_name
Having sum(p.price) > (select avg(total_value) from
(Select category_id, sum(p1.price) as total_value from products p1
Group by category_id) as total_value_of_products);
#Write a SQL query to show:
	•	first_name
	•	last_name
	•	total number of orders

for customers whose total number of orders is equal to the minimum number of orders placed by any customer.
select c.first_name, c.last_name, count(o.order_id) as total_orders from customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having count(o.order_id) = (select min(order_count) from
(select customer_id, count(o1.order_id) as order_count from orders o1
Group by customer_id) as order_counts);

#Write a SQL query to show:
	•	product_name
	•	price
for products whose price is equal to the average price of their own category

select p.product_name, p.price from products p
Where p.price = (select round(avg(p1.price)::numeric, 2) from products p1
Where p1.category_id =p.category_id);

#Write a SQL query to show:
	•	first_name
	•	last_name

for customers whose total spending is equal to the average total spending of all customers.

Select c.first_name, c.last_name, sum(o.total_amount) as total_spending from customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having sum(total_amount) = (select round(avg(total_spending)::numeric,2) from 
(Select customer_id, sum(o1.total_amount) as total_spending from orders o1
Group by customer_id ) as total_spending_amount);

#Write a SQL query to show:
	•	category_name
	•	average product price

for categories whose average price is equal to the minimum average price across all categories

Select c.category_name, avg(p.price) as average_price from categories c
Join products p on c.category_id =p.category_id
Group by c.category_id, c.category_name
Having avg(p.price) = (select min(avg_price) from 
(Select category_id, avg(p1.price) as avg_price from products p1
Group by category_id) as min_avg_price);

#Write a SQL query to show:
	•	first_name
	•	last_name
	•	total spending

for customers whose total spending is equal to the second highest total spending among all customers.
Select c.first_name, c.last_name, sum(o.total_amount) as total_spending from customers c
Join orders o on c.customer_id= o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having sum(o.total_amount) = (select max(second_total_spending) from 
(Select customer_id, sum(o1.total_amount) as second_total_spending from orders o1
Group by customer_id) as second_highest_spending
Where second_total_spending < (select max(total_spent) from
(Select customer_id, sum(o2.total_amount) as total_spent from orders o2
Group by customer_id) as total_spending_amount));

#Write a SQL query to show:
	•	customer_id
	•	total spending

for customers whose total spending is greater than at least one other customer’s total spending
select c.customer_id, sum(o.total_amount) as total_spending from customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id
Having sum(o.total_amount) > (select min(total_spent) from
(Select customer_id, sum(o1.total_amount) as total_spent from orders o1
Group by customer_id) as total_spending_amount);

#Write a SQL query to show:
	•	category_name
	•	total number of products

for categories whose product count is less than at least one other category’s product count.
select c.category_name, count(p.product_id) as total_products from categories c
Join products p on c.category_id = p.category_id
Group by c.category_id, c.category_name
Having count(p.product_id) < (select max(product_count) from
(Select category_id, count(product_id) as product_count from products
Group by category_id) as category_product_counts);

#Write a SQL query to show:
	•	product_name
	•	price

for products whose price is greater than at least one other product in the same category
select p.product_name, p.price from products p
Where p.price > (select min(p1.price) from products p1
Where p1.category_id = p.category_id);
#Write a SQL query to show:
	•	first_name
	•	last_name

for customers whose total spending is less than at least one other customer’s total spending.

Select c.first_name, c.last_name, sum(o.total_amount) as total_spending from customers c
Join orders o on c.customer_id=o.customer_id
Group by c.customer_id, c.first_name, c.last_name 
Having sum(o.total_amount)< (select min(customer_totals) from 
(Select customer_id, sum(o1.total_amount) as customer_totals from orders o1
Group by customer_id) as customer_total_spending);

#Write a SQL query to show:
	•	category_name
	•	total value of products

for categories whose total value is less than at least one other category’s total value.

Select c.category_name, sum(p.price) from categories c 
Join products p on c.category_id = p.category_id 
Group by c.category_id, c.category_name
Having sum(p.price) < (select max(category_total) from 
(Select category_id, sum(p1.price) as category_total from products p1
Group by category_id) as category_total_value);
#Write a SQL query to show:
	•	product_name
	•	price

for products whose price is equal to the second lowest price in their own category.

select p.product_name, p.price from products p
Where p.price = (select min(p1.price) from products p1
Where p1.category_id =p.category_id
And p1.price > (select min(p2.price) from products p2
Where p2.category_id = p.category_id));
#Write a SQL query to show:
	•	first_name
	•	last_name

for customers whose total spending is equal to the second lowest total spending among all customers.


Select c.first_name, c.last_name , sum(o.total_amount) as total_spending from customers c 
Join orders o on c.customer_id=o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having sum(total_amount) =( select min(second_lowest) from
(Select customer_id, sum(o1.total_amount) as second_lowest from orders o1
Group by customer_id) as second_lowest_spent
Where second_lowest > (select min(lowest_amount) from
(Select customer_id, sum(o2.total_amount) as lowest_amount from orders o2
Group by customer_id) as second_lowest_amount));

#Write a SQL query to show:
	•	category_name
	•	average product price

for categories whose average product price is equal to the second highest average price among all categories.
Select c.category_name, avg(p.price) from categories c
Join products p on c.category_id = p.category_id
Group by c.category_id, c.category_name
Having avg(p.price) = (select max(second_highest_price) from 
(Select category_id, avg(p1.price) as second_highest_price from products p1
Group by category_id ) as second_price 
Where second_highest_price < (select max(lowest_price) from
(Select category_id, avg(p2.price) as lowest_price from products p2
Group by category_id ) as highest_price));
#Write a SQL query to show:
	•	product_name
	•	price

for products whose price is equal to the second highest price in their own category.

Select p.product_name, p.price from products p 
Where p.price=(select max(p1.price) from products p1
Where p1.category_id = p.category_id
And p1.price < (select max(p2.price) from products p2
Where p2.category_id=p.category_id));
#Write a SQL query to show:
	•	customer_id
	•	total number of orders

for customers whose total number of orders is greater than all other customers’ total orders.
Select c.customer_id, count(o.order_id) as total_orders from customers c
Join orders o on c.customer_id =o.customer_id
Group by c.customer_id
Having count(o.order_id)=(select max(orders) from 
(Select customer_id, count(o1.order_id) as orders from orders o1
Group by customer_id) as total_no_orders);


#Write a SQL query to show:
	•	category_name
	•	average product price

for categories whose average product price is greater than all other categories’ average prices.


Select c.category_name, avg(p.price) as avg_price from categories c
Join products p on c.category_id =p.category_id
Group by c.category_id, c.category_name
Having avg(p.price)=(select max(average_price) from 
(Select category_id, avg(p1.price) as average_price from products p1
Group by category_id) as total_average_price);

Write a SQL query to show:
	•	product_name
	•	price

for products whose price is less than all other products in the same category

Select p.product_name, p.price from products p
Where p.price = (select min(p1.price) from products p1
Where p1.category_id =p.category_id);

#Write a SQL query to show:
	•	first_name
	•	last_name

for customers whose total spending is less than all other customers’ total spending.


Select c.first_name, c.last_name, sum(o.total_amount) as total_spending from customers c
Join orders o on c.customer_id =o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having sum(o.total_amount) =(select min(customer_total) from 
(Select customer_id, sum(o1.total_amount) as customer_total from orders o1
Group by customer_id) as total_customer_spending);

#Write a SQL query to show:
	•	category_name
	•	total number of products

for categories whose product count is equal to the second highest product count among all categories.

select c.category_name, count(p.product_id) as total_products from categories c
Join products p on c.category_id = p.category_id		
Group by c.category_id, c.category_name
Having count(p.product_id) = (select max(second_highest) from
(Select category_id, count(product_id) as second_highest from products
Group by category_id) as second_highest_count
Where second_highest < (select max(highest) from
(Select category_id, count(product_id) as highest from products
Group by category_id) as highest_count));

#Write a SQL query to show:
	•	product_name
	•	price

for products whose price is greater than the average price of all products in the same category but less than the maximum price in that category
Select p.product_name, p.price from products p 
Where p.price >(select avg(p1.price) from products p1 
Where p1.category_id =p.category_id)
And p.price <(select max(p2.price) from products p2 
Where p2.category_id =p.category_id);


Write a SQL query to show:
	•	first_name
	•	last_name

for customers whose total spending is greater than the average total spending of all customers
but less than the maximum total spending of all customers.

select c.first_name, c.last_name, sum(o.total_amount) as total_spending from customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having sum(o.total_amount) > (select avg(total_spent) from
(Select customer_id, sum(o1.total_amount) as total_spent from orders o1
Group by customer_id) as total_spending_amount)
And sum(o.total_amount) < (select max(total_spent) from
(Select customer_id, sum(o2.total_amount) as total_spent from orders o2
Group by customer_id) as total_spending_amount);	

#Write a SQL query to show:
	•	category_name
	•	average price

for categories whose average price is greater than the minimum category average
but less than the maximum category average.

Select c.category_name, avg(p.price) as average_price from categories c
Join products p on c.category_id=p.category_id
Group by c.category_id, c.category_name
Having avg(p.price) >(select min(min_average) from
(Select category_id, avg(p1.price) as min_average from products p1 
Group by category_id) as min_category_average)
And avg(p.price)< (select max(max_average) from
(Select category_id, avg(p2.price) as max_average from products p2
Group by category_id) as max_category_average);
order by average_price desc;	

#Write a SQL query to show:
	•	product_name
	•	price

for products whose price is greater than the minimum price in their category
but less than the maximum price in their category.
Select p.product_name, p.price from products p 
Where p.price>(select min(p1.price) from products p1
Where p1.category_id=p.category_id) 
And p.price < (select max(p2.price) from products p2
Where p2.category_id=p.category_id);

#Write a SQL query to show:
	•	first_name
	•	last_name

for customers whose total spending is greater than the minimum customer total
but less than the maximum customer total.

select c.first_name, c.last_name, sum(o.total_amount) as total_spending from customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having sum(o.total_amount) > (select min(total_spent) from
(Select customer_id, sum(o1.total_amount) as total_spent from orders o1
Group by customer_id) as total_spending_amount)
And sum(o.total_amount) < (select max(total_spent) from
(Select customer_id, sum(o2.total_amount) as total_spent from orders o2
Group by customer_id) as total_spending_amount)
order by total_spending desc;

#Write a SQL query to show:
	•	category_name
	•	average price

for categories whose average price is greater than the minimum category average
but less than or equal to the second highest category average.

Select c.category_name, avg(p.price) from categories c 
Join products p on c.category_id =p.category_id
Group by c.category_id, c.category_name
Having avg(p.price) >(select min(min_average) from
(Select category_id, avg(p1.price) as min_average from products p1 
Group by category_id) as min_category_average)
And avg(p.price) <=(select max(max_average) from
(Select category_id, avg(p2.price) as max_average from products p2
Group by category_id) as max_category_average
Where max_average < (select max(second_highest) from 
(Select category_id, avg(p3.price) as second_highest from products p3 
Group by category_id) as second_highest_average));


Write a SQL query to show:
	•	product_name
	•	price

for products whose price is greater than or equal to the second lowest price in their category
but less than the highest price in their category.
Select p.product_name, p.price from products p 
Where p.price >=(select min(p1.price)  from products p1
Where p1.category_id=p.category_id
And (p1.price)>(select min(p2.price) from products p2
Where p2.category_id =p.category_id))
And p.price <(select max(p3.price) from products p3
Where p3.category_id = p.category_id);

#Write a SQL query to show:
	•	first_name
	•	last_name
	•	total spending

for customers whose total spending is:
	•	greater than or equal to the second lowest customer total
	•	but less than the highest customer total

Select c.first_name, c.last_name, sum(o.total_amount) as total_spending from customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having sum(o.total_amount) >= (select min(total_spent) from
(Select customer_id, sum(o1.total_amount) as total_spent from orders o1
Group by customer_id) as second_lowest_spent
Where total_spent > (select min(total_spent) from
(Select customer_id, sum(o2.total_amount) as total_spent from orders o2
Group by customer_id) as lowest_spent))
And sum(o.total_amount) < (select max(total_spent) from
(Select customer_id, sum(o3.total_amount) as total_spent from orders o3
Group by customer_id) as highest_spent)
order by total_spending desc;

#Write a SQL query to show:
	•	category_name
	•	total number of products

for categories whose product count is:
	•	greater than or equal to the second lowest category count
	•	but less than the highest category count

select c.category_name, count(p.product_id) as total_products from categories c
Join products p on c.category_id = p.category_id
Group by c.category_id, c.category_name
Having count(p.product_id) >= (select min(product_count) from
(Select category_id, count(product_id) as product_count from products
Group by category_id) as second_lowest_count
Where product_count > (select min(product_count) from
(Select category_id, count(product_id) as product_count from products
Group by category_id) as lowest_count))
And count(p.product_id) < (select max(product_count) from
(Select category_id, count(product_id) as product_count from products
Group by category_id) as highest_count);

Write a SQL query to show:
	•	product_name
	•	price

for products whose price is:
	•	greater than the second lowest price in their category
	•	but less than or equal to the second highest price in their category

select p.product_name, p.price from products p
Where p.price > (select min(p1.price) from products p1
Where p1.category_id =p.category_id
And p1.price > (select min(p2.price) from products p2
Where p2.category_id =p.category_id))
And p.price <= (select max(p3.price) from products p3
Where p3.category_id =p.category_id
And p3.price < (select max(p4.price) from products p4
Where p4.category_id =p.category_id));

Write a SQL query to show:
	•	first_name
	•	last_name
	•	total spending

for customers whose total spending is:
	•	greater than the second lowest customer total
	•	but less than or equal to the second highest customer total

Select c.first_name, c.last_name, sum(o.total_amount) as total_spending from customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having sum(o.total_amount) > (select min(total_spent) from
(Select customer_id, sum(o1.total_amount) as total_spent from orders o1
Group by customer_id) as second_lowest_spent
Where total_spent > (select min(total_spent) from
(Select customer_id, sum(o2.total_amount) as total_spent from orders o2
Group by customer_id) as lowest_spent))
And sum(o.total_amount) <= (select max(total_spent) from
(Select customer_id, sum(o3.total_amount) as total_spent from orders o3
Group by customer_id) as second_highest_spent
Where total_spent < (select max(total_spent) from
(Select customer_id, sum(o4.total_amount) as total_spent from orders o4
Group by customer_id) as highest_spent));

Write a SQL query to show:
	•	category_name
	•	total value of products

for categories whose total value is:
	•	greater than the second lowest category total
	•	but less than or equal to the second highest category total
Select c.category_name, sum(p.price) as total_value from categories c
Join products p on c.category_id = p.category_id	
Group by c.category_id, c.category_name
Having sum(p.price) > (select min(category_total) from
(Select category_id, sum(p1.price) as category_total from products p1
Group by category_id) as second_lowest_total
Where category_total > (select min(category_total) from
(Select category_id, sum(p2.price) as category_total from products p2
Group by category_id) as lowest_total))	
And sum(p.price) <= (select max(category_total) from
(Select category_id, sum(p3.price) as category_total from products p3
Group by category_id) as second_highest_total
Where category_total < (select max(category_total) from
(Select category_id, sum(p4.price) as category_total from products p4
Group by category_id) as highest_total));

Write a SQL query to show:
	•	product_name
	•	price

for products whose price is:
	•	greater than or equal to the third lowest price in their category
	•	but less than the second highest price in their category

select p.product_name, p.price from products p
Where p.price >=(select min(p1.price) from products p1
Where p1.category_id =p.category_id
And p1.price > (select min(p2.price) from products p2
Where p2.category_id =p.category_id
And  p2.price > (select min(p3.price) from products p3
Where p3.category_id =p.category_id)))
And p.price < (select max(p4.price) from products p4
Where p4.category_id =p.category_id
And p4.price > (select max(p5.price) from products p5
Where p5.category_id =p.category_id));


## Window Functions
// Write a query to show:

* product_name
* category_id
* price
* row number of each product within its category, with the lowest price as 1
Select p.product_name, p.price, category_id,
Row_number() over(
Partition by category_id
Order by p.price ASC) as price_rank
From products p;

select p.product_name, p.price, category_id,
Row_number()over(
order by p.price ASC)as price_rank
From products p;


#Write a SQL query to show:

* product_name
* price
* a row number for all products (no partition)
* lowest price should have row number = 1
SELECT product_name, price, rn
FROM (
    SELECT 
        p.product_name,
        p.price,
        ROW_NUMBER() OVER (
			partition BY category_id
            ORDER BY p.price ASC
        ) AS rn
    FROM products p
) t
WHERE rn = 1;

#ROW_NUMBER — Question 2

Write a query to show:

* product_name
* category_id
* price
* row number within each category, where the lowest price in each category gets row number 1
select p.product_name, p.price, category_id,
Row_number() over(
Partition by category_id
Order by p.price ASC) as price_rank
From products p;

Write a SQL query to show:

* product_name
* category_id
* price

Return only the cheapest product in each category using ROW_NUMBER().
select product_name, price, category_id
From (
Select p.product_name, p.price, category_id,
Row_number() over(
Partition by category_id
Order by p.price ASC) as price_rank
From products p) as ranked_products
Where price_rank = 1;

Select product_name, price, category_id
from
(
Select p.product_name, p.price , p.category_id,
Row_number() over(
Partition by p.category_id
Order by p.price desc) as rn
From products p) as ranked_products
Where rn=1;


Write a SQL query to show:

* product_name
* category_id
* price

Return only the second cheapest product in each category using ROW_NUMBER().

Select product_name, category_id, price, rn  from 
(Select p.product_name, p.price, p.category_id, 
row_number() over(
Partition by p.category_id
Order by p.price asc) as rn
From products p) as second_cheapest_product
Where rn=2;

Write a SQL query to show:

* product_name
* category_id
* price

Return only the second most expensive product in each category using ROW_NUMBER().

Select product_name, category_id, price, rn  from 
(Select p.product_name, p.price, p.category_id, 
row_number() over(
Partition by p.category_id
Order by p.price desc) as rn
From products p) as second_cheapest_product
Where rn=2;

#Write a SQL query to show:

* product_name
* category_id
* price

Return the top 2 most expensive products in each category using ROW_NUMBER().

select product_name, category_id, price, rn  from
(Select p.product_name, p.price, p.category_id,
row_number() over(
Partition by p.category_id
Order by p.price desc) as rn
From products p) as ranked_products
Where rn <= 2

#Write a SQL query to show:

* product_name
* category_id
* price

Return the products ranked between 2 and 4 within each category by price from highest to lowest using ROW_NUMBER().

SELECT product_name, category_id, price, rn
FROM (
    SELECT 
        p.product_name,
        p.category_id,
        p.price,
        ROW_NUMBER() OVER (
            PARTITION BY p.category_id
            ORDER BY p.price desc
        ) AS rn
    FROM products p
) AS ranked_products
WHERE rn BETWEEN 2 AND 4;

#Write a SQL query to show:

* product_name
* category_id
* price

Return only the third most expensive product in each category using ROW_NUMBER().

#Write a SQL query to show:

* product_name
* category_id
* price

Return only the products with row numbers greater than 1 within each category by price from lowest to highest using ROW_NUMBER().

Select product_name, category_id, price, ranked_products from 
(Select p.product_name, p.price, p.category_id, 
row_number() over(
Partition by p.category_id
Order by p.price asc) as ranked_products
From products p)
Where ranked_products >1

#Write a SQL query to show:

* product_name
* category_id
* price

👉 Return all products except the top 2 most expensive products in each category

Select product_name, price, category_id, ranked_product from 
(Select p.product_name, p.price, p.category_id ,
row_number() over(
Partition by p.category_id
Order by p.price desc) as ranked_product
From products p) as expensive_product
Where ranked_product >2;

Write a SQL query to show:

* product_name
* category_id
* price

Return all products except the 2 cheapest products in each category using ROW_NUMBER().
Select product_name, category_id, price from 
(Select p.product_name, p.price, p.category_id,
row_number() over(
Partition by p.category_id
Order by p.price asc) as ranked_products
From products p) as cheapest_product
Where ranked_products >2;



Write a SQL query to show:

* product_name
* category_id
* price

Return only the products ranked between 2 and 4 from the most expensive side within each category using ROW_NUMBER().

Select product_name, category_id, price from 
(Select p.product_name, p.price, p.category_id ,
row_number() over(
Partition by p.category_id
Order by p.price desc) as ranked_product
From products p ) as ranked_products
Where ranked_product between 2 and 4;

Write a SQL query to show:

* product_name
* category_id
* price

Return only the 4 cheapest products in each category using ROW_NUMBER().

select product_name, category_id, price from
(Select p.product_name, p.price, p.category_id,
row_number() over(
Partition by p.category_id
Order by p.price asc) as ranked_product
From products p) as ranked_products
Where ranked_product <=4;

Write a SQL query to show:

* product_name
* category_id
* price

Return only the products with row numbers greater than 2 and less than or equal to 5 within each category from the cheapest side using ROW_NUMBER().

Select product_name, category_id, price from 
(Select p.product_name, p.price, p.category_id ,
row_number() over(
Partition by p.category_id
Order by p.price asc) as ranked_product
From products p ) as ranked_products
Where ranked_product >2 and ranked_product<=5;

Write a SQL query to show:

* product_name
* category_id
* price

Return only the products with row numbers between 2 and 5 within each category from the most expensive side using ROW_NUMBER().
Select product_name, category_id, price from 
(Select p.product_name, p.price, p.category_id ,
row_number() over(
Partition by p.category_id
Order by p.price desc) as ranked_product
From products p ) as ranked_products
Where ranked_product between 2 and 5;
Write a SQL query to show:

* product_name
* category_id
* price

👉 Return products whose price is greater than the average price of their category
select product_name, category_id, price from
(Select p.product_name, p.price, p.category_id,
row_number() over(
Partition by p.category_id
Order by p.price asc) as ranked_product
From products p) as ranked_products
Where price > (select avg(p1.price) from products p1
Where p1.category_id = ranked_products.category_id);

#Write a SQL query to show:

* product_name
* category_id
* price

👉 Return products that are:

* in the top 2 most expensive products in each category
* AND price > average price of that category

select product_name, category_id, price,ranked_product from
(Select p.product_name, p.price, p.category_id,
row_number() over(
Partition by p.category_id
Order by p.price desc) as ranked_product
From products p) as ranked_products
Where ranked_product<=2 and price> (select avg(p1.price) from products p1
Where p1.category_id=ranked_products.category_id);

#Write a SQL query to show:

* product_name
* category_id
* price

Return products that are:

* in the bottom 2 cheapest products in each category
* and price < average price of that category

Select product_name, price, category_id, ranked_product from 
(Select p.product_name, p.price, p.category_id, 
row_number() over(
Partition by p.category_id
Order by p.price asc) as ranked_product
From products p) as ranked_products
Where ranked_product<=2 and price<(select avg(p1.price) from products p1
Where p1.category_id = ranked_products.category_id);

# Write a SQL query to show:

* product_name
* category_id
* price

Return products that are:

* in the top 3 most expensive products in each category
* and price >= average price of that category
select product_name, category_id, price,ranked_product from
(Select p.product_name, p.price, p.category_id,
row_number() over(
Partition by p.category_id
Order by p.price desc) as ranked_product
From products p) as ranked_products
Where ranked_product<=3 and price>= (select avg(p1.price) from products p1
Where p1.category_id=ranked_products.category_id);

Write a SQL query to show:

* product_name
* category_id
* price

Return products that are:

* in the bottom 3 cheapest products in each category
* and price <= average price of that category

Select product_name, price, category_id, ranked_product from 
(Select p.product_name, p.price, p.category_id, 
row_number() over(
Partition by p.category_id
Order by p.price asc) as ranked_product
From products p) as ranked_products
Where ranked_product<=3 and price<=(select avg(p1.price) from products p1
Where p1.category_id = ranked_products.category_id);

#Write a SQL query to show:

* customer_id
* order_id
* total_amount

👉 Return only the latest order for each customer

select customer_id, order_id, total_amount from
(Select customer_id, order_id, total_amount,
row_number() over(
Partition by customer_id
Order by order_date desc) as ranked_orders
From orders) as ranked_customer_orders
Where ranked_orders = 1;


#Write a SQL query to show:

* email
* user_id
* created_at

👉 Table: users

👉 Return only:

* one record per email
* keep the latest record (based on created_at)

select email, user_id, created_at from
(Select email, user_id, created_at,
row_number() over(
Partition by email
Order by created_at desc) as ranked_users
From users) as ranked_user_emails
Where ranked_users = 1;

#Since your schema fits this better, here is your next real-world ROW_NUMBER() question:

Write a query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only the latest 2 orders for each customer using ROW_NUMBER()

Select customer_id, order_id, order_date, total_amount,rn from 
(Select o.customer_id, o.order_id, o.order_date, o.total_amount, row_number()
over( partition by o.customer_id
Order by o.order_date, o.order_id desc) as rn 
From orders o) as ranked_orders
Where rn<=2;

#Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only the oldest order for each customer using ROW_NUMBER().

select customer_id, order_id, order_date, total_amount from
(Select o.customer_id, o.order_id, o.order_date, o.total_amount,
row_number() over(
Partition by o.customer_id
Order by o.order_date asc) as ranked_orders
From orders o) as ranked_customer_orders
Where ranked_orders = 1;

#Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only the second latest order for each customer using ROW_NUMBER().

Select customer_id, order_id, order_date, total_amount, rn from 
(Select o.customer_id, o.order_id, o.order_date, o.total_amount, row_number()
over( partition by o.customer_id
Order by o.order_date desc, o.order_id desc) as rn 
From orders o) as ranked_orders
Where rn=2;


#Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

👉 Return orders ranked between 2 and 3 from the latest side for each customer
Select customer_id, order_id, order_date, total_amount, rn from 
(Select o.customer_id, o.order_id, o.order_date, o.total_amount, row_number()
over( partition by o.customer_id
Order by o.order_date desc, o.order_id desc) as rn 
From orders o) as ranked_orders
Where rn between 2 and 3;

#Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return all orders except the latest order for each customer using ROW_NUMBER().

Select customer_id, order_id, order_date, total_amount, rn from 
(Select o.customer_id, o.order_id, o.order_date, o.total_amount, row_number()
over( partition by o.customer_id
Order by o.order_date desc, o.order_id desc) as rn 
From orders o) as ranked_orders
Where rn>1;

#Next question

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return all orders except the 2 oldest orders for each customer using ROW_NUMBER().

Select customer_id, order_id, order_date, total_amount, rn from 
(Select o.customer_id, o.order_id, o.order_date, o.total_amount, row_number()
over( partition by o.customer_id
Order by o.order_date asc, o.order_id asc) as rn 
From orders o) as ranked_orders
Where rn>2;

#Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only the 3 latest orders for each customer using ROW_NUMBER().

Select customer_id, order_id, order_date, total_amount, rn from 
(Select o.customer_id, o.order_id, o.order_date, o.total_amount, row_number()
over( partition by o.customer_id
Order by o.order_date desc, o.order_id desc) as rn 
From orders o) as ranked_orders
Where rn<=3;

#Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only the orders ranked between 2 and 4 from the oldest side for each customer using ROW_NUMBER()
Select customer_id, order_id, order_date, total_amount, rn from 
(Select o.customer_id, o.order_id, o.order_date, o.total_amount, row_number()
over( partition by o.customer_id
Order by o.order_date asc, o.order_id asc) as rn 
From orders o) as ranked_orders
Where rn between 2 and 4;



Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only the orders with row numbers greater than 1 and less than or equal to 3 from the latest side for each customer using ROW_NUMBER().

Select customer_id, order_id, order_date, total_amount, rn from 
(Select o.customer_id, o.order_id, o.order_date, o.total_amount, row_number()
over( partition by o.customer_id
Order by o.order_date desc, o.order_id desc) as rn 
From orders o) as ranked_orders
Where rn >1 and rn<=3;

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return all orders except the latest 3 orders for each customer using ROW_NUMBER().

Select customer_id, order_id, order_date, total_amount, rn from 
(Select o.customer_id, o.order_id, o.order_date, o.total_amount, row_number()
over( partition by o.customer_id
Order by o.order_date desc, o.order_id desc) as rn 
From orders o) as ranked_orders
Where rn >3;

#Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only the highest total_amount order for each customer.

Select customer_id, order_id, order_date, total_amount from 
( select o.customer_id, o.order_id, o.total_amount, o.order_date, row_number()
over(partition by o.customer_id
Order by o.total_amount desc, o.order_date desc, o.order_id desc) as rn 
From orders o) as ranked_orders
Where rn=1;

#Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only the second highest total_amount order for each customer.

Select customer_id, order_id, order_date, total_amount from 
( select o.customer_id, o.order_id, o.total_amount, o.order_date, row_number()
over(partition by o.customer_id
Order by o.total_amount desc, o.order_date desc, o.order_id desc) as rn 
From orders o) as ranked_orders
Where rn=2;

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return the top 2 highest total_amount orders for each customer.

Select customer_id, order_id, order_date, total_amount from 
( select o.customer_id, o.order_id, o.total_amount, o.order_date, row_number()
over(partition by o.customer_id
Order by o.total_amount desc, o.order_date desc, o.order_id desc) as rn 
From orders o) as ranked_orders
Where rn<=2;

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return all orders except the top 2 highest total_amount orders for each customer.

Select customer_id, order_id, order_date, total_amount from 
( select o.customer_id, o.order_id, o.total_amount, o.order_date, row_number()
over(partition by o.customer_id
Order by o.total_amount desc, o.order_date desc, o.order_id desc) as rn 
From orders o) as ranked_orders
Where rn>2;

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only the orders ranked between 2 and 4 by total_amount from the highest side for each customer.

Select customer_id, order_id, order_date, total_amount from 
( select o.customer_id, o.order_id, o.total_amount, o.order_date, row_number()
over(partition by o.customer_id
Order by o.total_amount desc, o.order_date desc, o.order_id desc) as rn 
From orders o) as ranked_orders
Where rn between 2 and 4;

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only the orders with ranks greater than 1 and less than or equal to 3 by total_amount from the lowest side for each customer.

Select customer_id, order_id, order_date, total_amount from 
( select o.customer_id, o.order_id, o.total_amount, o.order_date, row_number()
over(partition by o.customer_id
Order by o.total_amount asc, o.order_date asc, o.order_id asc) as rn 
From orders o) as ranked_orders
Where rn > 1 and rn<= 3;
Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only one order per customer, where:

* it is the median order by total_amount (middle value)
* if the count is even, pick the lower median

select customer_id, order_id, order_date, total_amount from 
( select o.customer_id, o.order_id, o.total_amount, o.order_date,
row_number() over(partition by o.customer_id
Order by o.total_amount asc, o.order_date asc, o.order_id asc) as rn,
count(*) over(partition by o.customer_id) as total_orders
From orders o) as ranked_orders
Where rn = (total_orders + 1) / 2;

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

👉 Return only one order per customer, where:

* it is the latest order
* BUT only if the customer has more than 2 orders

select customer_id, order_id, order_date, total_amount from 
( select o.customer_id, o.order_id, o.total_amount, o.order_date,
row_number() over(partition by o.customer_id
Order by o.order_date desc, o.order_id desc) as rn,
count(*) over(partition by o.customer_id) as total_orders
From orders o) as ranked_orders
Where rn = 1 and total_orders > 2;

#Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

👉 Return only orders where:

* it is the second latest order
* BUT only for customers whose total_amount sum > 100

Select customer_id, order_id, order_date, total_amount from 
(Select o.customer_id, o.order_id, o.total_amount, o.order_date, row_number()
over(partition by o.customer_id
ORDER BY o.order_date DESC, o.order_id DESC) as rn,
sum(o.total_amount) over(partition by o.customer_id) as total_amount_sum
From orders o ) as ranked_orders
Where rn=2 and total_amount_sum>100;

#Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only orders where:

* it is the latest order
* and the order is also the highest total_amount order for that customer

Select customer_id, order_id, order_date, total_amount from 
(Select o.customer_id, o.order_id, o.total_amount, o.order_date, row_number()
over(partition by o.customer_id
ORDER BY o.order_date DESC, o.order_id DESC) as rn,
max(o.total_amount) over(partition by o.customer_id) as max_total_amount
From orders o ) as ranked_orders
Where rn=1 and total_amount=max_total_amount;

#Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only orders where:

* it is the oldest order
* and it is also the lowest total_amount order for that customer

Select customer_id, order_id, order_date, total_amount from 
(Select o.customer_id, o.order_id, o.total_amount, o.order_date, row_number()
over(partition by o.customer_id
ORDER BY o.order_date asc, o.order_id asc) as rn,
min(o.total_amount) over(partition by o.customer_id) as max_total_amount
From orders o ) as ranked_orders
Where rn=1 and total_amount=max_total_amount;


#Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

👉 Return customers whose latest order amount is greater than their average order amount

select customer_id, order_id, order_date, total_amount from
(Select o.customer_id, o.order_id, o.order_date, o.total_amount,
row_number() over(partition by o.customer_id
Order by o.order_date desc, o.order_id desc) as rn,
avg(o.total_amount) over(partition by o.customer_id) as avg_total_amount
From orders o) as ranked_orders
Where rn=1 and total_amount > avg_total_amount;

#Write a SQL query to show:

* product_name
* category_id
* price
* rank of each product within its category from highest price to lowest price

select product_name, category_id, price, rank() over(
Partition by category_id
Order by price desc) as price_rank
From products;	

Write a SQL query to show:

* product_name
* category_id
* price

Return only the products with rank = 1 within each category from the highest price side using RANK().\

Select product_name, category_id, price from
(Select  p.product_name, p.category_id, p.price, rank()
over(partition by p.category_id
Order by p.price desc) as price_rank
From products p) as ranked_products
Where price_rank=1;

#Write a SQL query to show:

* product_name
* category_id
* price

Return products with rank ≤ 2 from the highest price side within each category using RANK().

Select product_name, category_id, price, price_rank from
(Select  p.product_name, p.category_id, p.price, rank()
over(partition by p.category_id
Order by p.price desc) as price_rank
From products p) as ranked_products
Where price_rank<=2;

#Write a SQL query to show:

* product_name
* category_id
* price

Return only the products with rank = 2 from the highest price side within each category using RANK().
Select product_name, category_id, price, price_rank from
(Select  p.product_name, p.category_id, p.price, rank()
over(partition by p.category_id
Order by p.price desc) as price_rank
From products p) as ranked_products
Where price_rank=2;

#Write a SQL query to show:

* product_name
* category_id
* price

Return products with rank between 2 and 3 from the highest price side within each category using RANK().

Select product_name, category_id, price, price_rank from
(Select  p.product_name, p.category_id, p.price, rank()
over(partition by p.category_id
Order by p.price desc) as price_rank
From products p) as ranked_products
Where price_rank between 2 and 3;

#Write a SQL query to show:

* product_name
* category_id
* price

Return products with rank greater than 1 from the highest price side within each category using RANK().

Select product_name, category_id, price, price_rank from
(Select  p.product_name, p.category_id, p.price, rank()
over(partition by p.category_id
Order by p.price desc) as price_rank
From products p) as ranked_products
Where price_rank >1;

#Write a SQL query to show:

* product_name
* category_id
* price

Return only the products that are in the top 2 ranks within each category from the highest price side, but only if their price is greater than the average price of that category.

Select product_name, category_id, price, price_rank from
(Select  p.product_name, p.category_id, p.price, rank()
over(partition by p.category_id
Order by p.price desc) as price_rank,
avg(p.price) over(partition by p.category_id) as average_price
From products p) as ranked_products
Where price_rank <=2 and price >average_price;


Write a SQL query to show:

* product_name
* category_id
* price

Return only the products that are in the second rank within each category from the highest price side, but only for categories that have at least 3 products.

select product_name, category_id, price, price_rank from	
(Select  p.product_name, p.category_id, p.price, rank()
over(partition by p.category_id
Order by p.price desc) as price_rank,
count(*) over(partition by p.category_id) as category_product_count
From products p) as ranked_products
Where price_rank =2 and category_product_count >=3;

Write a SQL query to show:

* product_name
* category_id
* price

Return products that are in the top 3 ranks from the highest-price side within each category, but exclude categories where all products have the same price.

SELECT product_name, category_id, price, price_rank
FROM (
    SELECT 
        p.product_name,
        p.category_id,
        p.price,
        RANK() OVER (
            PARTITION BY p.category_id
            ORDER BY p.price DESC
        ) AS price_rank,
        MIN(p.price) OVER (
            PARTITION BY p.category_id
        ) AS min_price,
        MAX(p.price) OVER (
            PARTITION BY p.category_id
        ) AS max_price
    FROM products p
) AS ranked_products
WHERE price_rank <= 3
  AND min_price < max_price;

Write a SQL query to show:

* product_name
* category_id
* price

Return products that are in the top 2 ranks within each category from the highest-price side, but only for categories whose average price is greater than 40.

Select product_name, category_id, price, price_rank from
(Select  p.product_name, p.category_id, p.price, rank()
over(partition by p.category_id
Order by p.price desc) as price_rank,
avg(p.price) over (partition by p.category_id) as avg_price
From products p) as ranked_products
Where price_rank <=2 and  avg_price>40;

Write a SQL query to show:

* product_name
* category_id
* price

Return only the products whose rank is 1 within each category from the highest-price side, but only for categories that have at least 3 distinct prices
Select product_name, category_id, price, price_rank from
(Select  p.product_name, p.category_id, p.price, rank()
over(partition by p.category_id
Order by p.price desc) as price_rank
From products p) as ranked_products
Where price_rank =1 and (select count(distinct p1.price) from products p1 
Where p1.category_id = ranked_products.category_id)>=3;

Write a SQL query to show:

* category_id
* number of distinct prices in that category

👉 Return only categories where:

* number of distinct prices >= 3

Select p.category_id, count(distinct p.price) from products p 
Group by p.category_id
Having count(distinct p.price)>=3;

Write a SQL query to show:

* product_name
* category_id
* price

Return products where:

* the product is in the top 2 ranks within its category from the highest price side
* and the product’s price is greater than the average price of its category

Select product_name, category_id, price, price_rank from
(Select  p.product_name, p.category_id, p.price, rank()
over(partition by p.category_id
Order by p.price desc) as price_rank,
avg(p.price) over(partition by category_id) as avg_price
From products p) as ranked_products
Where price_rank <=2 and price> avg_price;

Select product_name, category_id, price, price_rank from
(Select  p.product_name, p.category_id, p.price, rank()
over(partition by p.category_id
Order by p.price desc) as price_rank
From products p) as ranked_products
Where price_rank <=2 and price> (select avg( p1.price) from products p1 
Where p1.category_id = ranked_products.category_id);

#Write a SQL query to show:

* product_name
* category_id
* price

Return products where:

* the product is in the second rank within its category from the highest price side
* and the category has at least 3 distinct prices

Select product_name, category_id, price, price_rank from
(Select  p.product_name, p.category_id, p.price, rank()
over(partition by p.category_id
Order by p.price desc) as price_rank
From products p) as ranked_products
Where price_rank =2 and (select count(distinct p1.price) from products p1 
Where p1.category_id = ranked_products.category_id)>=3;

#Write a SQL query to show:

* product_name
* category_id
* price

Return products where:

* the product is in the top 3 ranks within its category from the highest price side
* and the category’s maximum price is at least 50 greater than its minimum price

Select product_name, category_id, price, price_rank from
(Select  p.product_name, p.category_id, p.price, rank()
over(partition by p.category_id
Order by p.price desc) as price_rank,
min(price) over(partition by category_id) as min_price,
max(price)over(partition by category_id) as max_price
From products p) as ranked_products
Where price_rank <=3 and (max_price - min_price)>=50;

Write a SQL query to show:

* product_name
* category_id
* price

Return products where:

* the product is in the top 2 ranks within its category from the highest price side
* and the category has at least 4 products
* and the product’s price is below the category maximum price

select product_name, category_id, price, price_rank from
(Select  p.product_name, p.category_id, p.price, rank()
over(partition by p.category_id
Order by p.price desc) as price_rank,
count(*) over(partition by p.category_id) as category_product_count,
max(p.price) over(partition by p.category_id) as max_price
From products p) as ranked_products
Where price_rank <=2 and category_product_count >=4 and price < max_price;

Write a SQL query to show:

* product_name
* category_id
* price

Return products where:

* the product is in the top 2 ranks within each category from the highest price side
* BUT exclude products that share the same rank (ties)

select product_name, category_id, price, price_rank from
(Select  p.product_name, p.category_id, p.price, rank()
over(partition by p.category_id
Order by p.price desc) as price_rank
From products p) as ranked_products
Where price_rank <=2 and (select count(*) from products p1
Where p1.category_id = ranked_products.category_id
And p1.price = ranked_products.price) =1;

#Write a SQL query to show:

* product_name
* category_id
* price
* dense rank of each product within its category from the highest price side

Use DENSE_RANK().

select product_name, category_id, price, dense_rank() over(
Partition by category_id
Order by price desc) as price_rank
From products;

Write a SQL query to show:

* product_name
* category_id
* price

Return products where:

* the product is in the top 2 dense ranks within its category from the highest price side

select product_name, category_id, price, price_rank from 
(Select p.product_name, p.price, p.category_id, dense_rank() over(
Partition by category_id
Order by price desc) as price_rank
From products p) as price_ranked
Where price_rank<=2;

Write a SQL query to show:

* product_name
* category_id
* price

Return products where:

* the product is in the second dense rank within its category from the highest price side
* and the category has at least 3 distinct prices

select product_name, category_id, price, price_rank from
(Select p.product_name, p.price, p.category_id, dense_rank() over(
Partition by category_id
Order by price desc) as price_rank
From products p) as price_ranked
Where price_rank=2 and (select count(distinct p1.price) from products p1
Where p1.category_id = price_ranked.category_id)>=3;


Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount
* difference between current order and previous order for the same customer

Select customer_id, order_id, order_date, total_amount,
total_amount -lag(total_amount) over(partition by customer_id
order by order_date asc, order_id asc) as amount_difference_from_previous_order
From orders;

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

👉 Return only the rows where:
current total_amount > previous total_amount
👉 For the same customer
👉 Use LAG()
👉 Use correct ordering (important)

SELECT customer_id, order_id, order_date, total_amount
FROM (
    SELECT 
        customer_id,
        order_id,
        order_date,
        total_amount,
        LAG(total_amount) OVER (
            PARTITION BY customer_id
            ORDER BY order_date ASC, order_id ASC
        ) AS previous_total_amount
    FROM orders
) AS ordered_amounts
WHERE total_amount > previous_total_amount;

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only the rows where the current total_amount is less than the previous total_amount for the same customer.

SELECT customer_id, order_id, order_date, total_amount
FROM (
	SELECT 
		customer_id,
		order_id,
		order_date,
		total_amount,
		LAG(total_amount) OVER (
			PARTITION BY customer_id
			ORDER BY order_date ASC, order_id ASC
		) AS previous_total_amount
	FROM orders
) AS ordered_amounts
WHERE total_amount < previous_total_amount;

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount
👉 Add a column: trend

Where:
* 'Increase' → current > previous
* 'Decrease' → current < previous
* 'No Change' → current = previous

SELECT customer_id, order_id, order_date, total_amount,
CASE
    WHEN total_amount > previous_amount THEN 'Increase'
    WHEN total_amount < previous_amount THEN 'Decrease'
    ELSE 'No Change'
END AS trend
FROM (
    SELECT o.customer_id, o.order_id, o.order_date, o.total_amount,
           LAG(total_amount) OVER (
               PARTITION BY o.customer_id
               ORDER BY order_date ASC, order_id ASC
           ) AS previous_amount
    FROM orders o
) AS ordered_amounts;

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Add a column:

* amount_difference

where amount_difference = current total_amount - previous total_amount
select customer_id, order_id, order_date, total_amount,
total_amount - LAG(total_amount) OVER (
PARTITION BY customer_id
ORDER BY order_date ASC, order_id ASC) AS amount_difference
From orders;

#Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Add a column:

* previous_order_date

where previous_order_date is the previous order’s date for the same customer.

SELECT customer_id, order_id, order_date, total_amount, previous_order_date
from(
Select o.customer_id, o.order_id, o.order_date, o.total_amount,
LAG(order_date) OVER (partition by o.customer_id
               ORDER BY order_date ASC, order_id ASC
           ) AS previous_order_date
    FROM orders o
) AS ordered_amounts;

Next LAG() interview-style question

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Add a column:

* days_since_previous_order
where days_since_previous_order = current order_date - previous order_date

SELECT customer_id, order_id, order_date, total_amount, days_since_previous_order
from(
Select o.customer_id, o.order_id, o.order_date, o.total_amount,
order_date-LAG(order_date) OVER (partition by o.customer_id
               ORDER BY order_date ASC, order_id ASC
           ) AS days_since_previous_order
    FROM orders o
) AS ordered_amounts;

Next LAG() interview-style question

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only the rows where the gap from the previous order is 
more than 30 days for the same customer.
SELECT customer_id, order_id, order_date, total_amount, days_since_previous_order
from(
Select o.customer_id, o.order_id, o.order_date, o.total_amount,
order_date-LAG(order_date) OVER (partition by o.customer_id
               ORDER BY order_date ASC, order_id ASC
           ) AS days_since_previous_order
    FROM orders o
) AS ordered_amounts
Where days_since_previous_order> interval '30 days';

Next LAG() interview-style question

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Add a column:

* order_trend

where:

* 'Higher than previous' if current total_amount > previous total_amount
* 'Lower than previous' if current total_amount < previous total_amount
* 'Same as previous' if current total_amount = previous total_amount
* 'First order' if there is no previous order

SELECT customer_id, order_id, order_date, total_amount,
CASE
    WHEN total_amount > previous_amount THEN 'Higher than previous'
    WHEN total_amount < previous_amount THEN 'Lower than previous'
    WHEN total_amount = previous_amount THEN 'Same as previous'
    ELSE 'First order'
END AS order_trend
FROM (
    SELECT o.customer_id, o.order_id, o.order_date, o.total_amount,
           LAG(total_amount) OVER (partition by o.customer_id
               ORDER BY order_date ASC, order_id ASC
           ) AS previous_amount
    FROM orders o
) AS ordered_amounts;

#Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only the rows where the current order date is 
the first order after a gap of more than 30 days for the same customer.

select customer_id, order_id, order_date, total_amount, days_since_previous_order
from(
Select o.customer_id, o.order_id, o.order_date, o.total_amount,
order_date-LAG(order_date) OVER (partition by o.customer_id
			   ORDER BY order_date ASC, order_id ASC	
) AS days_since_previous_order
From orders o) AS ordered_amounts
Where days_since_previous_order> interval '30 days';

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Add a column:next_order_date
which shows the next order date for the same customer

Select customer_id, order_id, order_date, total_amount ,
lead(order_date) over(partition by customer_id
Order by order_date asc, order_id asc) as next_order_date
From orders ;

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Add a column:

* next_amount

where next_amount is the next order’s total_amount for the same customer.

Select customer_id, order_id, order_date, total_amount ,
lead(total_amount) over(partition by customer_id
Order by order_date asc, order_id asc) as next_amount
From orders ;

Next LEAD() question

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only the rows where the next order amount 
is greater than the current order amount for the same customer.

Use LEAD().

Select customer_id, order_id, order_date, total_amount
From 
(Select o.customer_id, o.order_id, o.order_date, o.total_amount, 
lead(o.total_amount) over(partition by o.customer_id
Order by o.order_date asc, order_id asc) as next_order_amount
From orders o) as ordered_amounts
Where next_order_amount > total_amount;

#Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only the rows where the next order amount is less than the current order amount for the same customer.

Use LEAD().
Select customer_id, order_id, order_date, total_amount
From 
(Select o.customer_id, o.order_id, o.order_date, o.total_amount, 
lead(o.total_amount) over(partition by o.customer_id
Order by o.order_date asc, order_id asc) as next_order_amount
From orders o) as ordered_amounts
Where next_order_amount < total_amount;

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Add a column:

* next_order_date

and another column:

* days_until_next_order

where:days_until_next_order = next_order_date - current order_date

Select customer_id, order_id, order_date, total_amount, next_order_date, next_order_date - order_date as day_untill_next_order
From 
(Select o.customer_id, o.order_id, o.order_date, o.total_amount, 
lead(o.order_date) over(partition by o.customer_id
Order by o.order_date asc, order_id asc) as next_order_date
From orders o) as ordered_amounts;

Write a SQL query to show:

* customer_id
* order_id
* order_date
* total_amount

Return only the rows where: gap between current order and next order > 30 days

Select customer_id, order_id, order_date, total_amount, gap_until_next_order
From 
(Select o.customer_id, o.order_id, o.order_date, o.total_amount, 
lead(o.order_date) over(partition by o.customer_id
Order by o.order_date asc, order_id asc) - o.order_date as gap_until_next_order
From orders o) as ordered_amounts
Where gap_until_next_order > Interval '30 days';
Return:

* customer_id
* order_id
* order_date
* total_amount

👉 Only rows where:
next order amount > current order amount by more than 50
select customer_id, order_id, order_date, total_amount, next_order_amount, next_order_amount - total_amount as amount_difference
From 
(Select o.customer_id, o.order_id, o.order_date, o.total_amount, 
lead(o.total_amount) over(partition by o.customer_id
Order by o.order_date asc, order_id asc) as next_order_amount
From orders o) as ordered_amounts
Where next_order_amount - total_amount > 50;


Return rows where the next order amount is lower by more than 50 compared to the current order amount.

SELECT customer_id, order_id, order_date, total_amount, next_order_amount
FROM (
    SELECT 
        o.customer_id,
        o.order_id,
        o.order_date,
        o.total_amount, 
        LEAD(o.total_amount) OVER (
            PARTITION BY o.customer_id
            ORDER BY o.order_date ASC, o.order_id ASC
        ) AS next_order_amount
    FROM orders o
) AS ordered_amounts
WHERE next_order_amount IS NOT NULL
  AND total_amount = next_order_amount;

Write a SQL query to show:

* customer_id
* first_name
* order_id
* order_date
* total_amount

👉 Join:

* customers (customer_id, first_name)
* orders (customer_id, order_id, order_date, total_amount)

Select c.customer_id, c.first_name, o.order_id, o.order_date, o.total_amount from customers c
Inner join orders o on c.customer_id = o.customer_id
order by c.customer_id, o.order_date, o.order_id;
#Write a SQL query to show:

* customer_id
* first_name
* order_id
* order_date
* total_amount

Return all customers, even if they have no orders.

Select c.customer_id, c.first_name, o.order_id, o.order_date, o.total_amount from customers c
Left join orders o on c.customer_id = o.customer_id
Order by  c.customer_id, o.order_date, o.order_id;

Write a SQL query to show:

* customer_id
* first_name
* number of orders (total_orders)

👉 Include all customers, even those with zero orders
👉 Use LEFT JOIN
👉 Use aggregation

select c.customer_id, c.first_name, count(o.order_id) as total_orders from customers c
Left join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name
Order by c.customer_id;

Next question

Show:

* customer_id
* first_name
* total spending as total_spending

Include all customers, even customers with no orders.

Select c.customer_id, c.first_name, coalesce(sum(o.total_amount),0) as total_spending from customers c
Left join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name
Order by total_spending desc;

Show:

* category_name
* product_name
* price

Return all categories, even categories with no products.

Use LEFT JOIN.

select c.category_name, p.product_name, p.price from categories c
Left join products p on c.category_id = p.category_id
Order by c.category_name, p.product_name;

Next question

Show:

* category_name
* total number of products as total_products

Include all categories, even categories with zero products.

Select c.category_name, count(p.product_id) as total_products from categories c
Left join products p on c.category_id = p.category_id
Group by c.category_id
Order by total_products desc;

Next question

Show:

* customer_id
* first_name
* order_id

Select c.customer_id, c.first_name, o.order_id from customers c
Left  join orders o on c.customer_id = o.customer_id
Where o.order_id is null;

#Show:

* customer_id
* first_name
* total number of orders (total_orders)

👉 Return only customers who have more than 2 orders

Select c.customer_id, c.first_name, count(o.order_id) as total_orders from customers c
inner join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name
Having count(o.order_id)>2;

Next JOIN question

Show:

* product_name
* total quantity sold as total_quantity_sold

Return only products that have been sold at least once.

Use products + order_items.
Select p.product_name, sum(o.quantity) as total_quantity_sold from products p
Join order_items o on p.product_id = o.product_id
Group by p.product_id, p.product_name;

Write a SQL query to show:

* customer_id
* first_name
* total_spending

👉 Join:

* customers
* orders
* order_items
👉 Calculate: total_spending = SUM(quantity * unit_price)

🎯 Requirements

* Include only customers who have placed orders
* Group correctly
* Use proper joins between all three table

Select c.customer_id, c.first_name, coalesce(sum(oi.quantity * oi.unit_price),0) as total_spending from customers c
Join orders o on c.customer_id = o.customer_id
Join order_items oi on o.order_id =oi.order_id 
Group by c.customer_id, c.first_name
Order by total_spending desc; 

Show:

* category_name
* total_revenue
Calculate:
SUM(oi.quantity * oi.unit_price)
Join:

* categories
* products
* order_items

Return only categories that have sales.

Select c.category_name, sum(oi.quantity * oi.unit_price) as total_revenue from categories c
Join products p on c.category_id = p.category_id
Join order_items oi on p.product_id = oi.product_id
Group by c.category_id, c.category_name
Order by total_revenue desc;

Next JOIN question (slightly advanced)

Show:

* category_name
* product_name
* total_revenue

👉 Calculate revenue per product:
SUM(oi.quantity * oi.unit_price)

👉 Return only products whose revenue is greater than the average revenue of their category

Select c.category_name, p.product_name, sum(oi.quantity * oi.unit_price) as total_revenue from categories c
Join products p on c.category_id = p.category_id
Join order_items oi on p.product_id = oi.product_id
Group by c.category_id, c.category_name, p.product_id, p.product_name
Having sum(oi.quantity * oi.unit_price) > (select avg(sum(oi2.quantity	* oi2.unit_price)) from order_items oi2
Join products p2 on oi2.product_id = p2.product_id
Where p2.category_id = c.category_id
Group by p2.product_id);

#🚀 Question

Show:

* customer_id
* first_name
* total_spending

👉 Return only customers whose total spending is greater than the average spending of all customers

⸻

👉 Use:

* customers
* orders
* order_items
* subquery
select c.customer_id, c.first_name, coalesce(sum(oi.quantity * oi.unit_price),0) as total_spending from customers c
Join orders o on c.customer_id = o.customer_id
Join order_items oi on o.order_id =oi.order_id
Group by c.customer_id, c.first_name
Having sum(oi.quantity * oi.unit_price) > (select avg(total_spending) from
(Select c2.customer_id, coalesce(sum(oi2.quantity * oi2.unit_price ),0) as total_spending from customers c2
Left join orders o2 on c2.customer_id = o2.customer_id
Left join order_items oi2 on o2.order_id =oi2.order_id
Group by c2.customer_id) as customer_spending);

#Show:

* product_name
* total_revenue

👉 Return only products whose total revenue is greater than the average revenue of all products

⸻

👉 Use:

* products
* order_items
* subquery

select p.product_name, coalesce(sum(oi.quantity * oi.unit_price),0) as total_revenue from products p
Join order_items oi on p.product_id = oi.product_id
Group by p.product_id, p.product_name
Having sum(oi.quantity * oi.unit_price) > (select avg(total_revenue) from
(Select p2.product_id, coalesce(sum(oi2.quantity * oi2.unit_price),0) as total_revenue from products p2
Left join order_items oi2 on p2.product_id = oi2.product_id
Group by p2.product_id) as product_revenue);

#Next question

Show:

* category_name
* total_revenue

Return only categories whose total revenue is greater than the average category revenue.

Select c.category_name, sum(oi.quantity * oi.unit_price) as total_revenue from categories c
Join products p on c.category_id = p.category_id
Join order_items oi on p.product_id = oi.product_id 
Group by c.category_id, c.category_name
Having sum(oi.quantity * oi.unit_price) > (select avg(average_category_revenue)  from 
(Select c1.category_id, sum(oi2.quantity * oi2.unit_price) as average_category_revenue from categories c1
Join products p1 on c1.category_id = p1.category_id
Join order_items oi2 on p1.product_id = oi2.product_id
Group by c1.category_id) as total_average_category_ave);

Show:

* customer_id
* first_name
* total_orders

Return customers whose number of orders is greater than the average number of orders per customer.
Select c.customer_id, c.first_name, c.last_name, count(o.order_id) from customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name, c.last_name
Having count(o.order_id) > (select avg(average_orders) from 
(Select c1.customer_id, count(o1.order_id) as average_orders from customers c1
Join orders o1 on c1.customer_id = o1.customer_id
Group by c1.customer_id) as total_orders);

Next question (as before):

Show:

* product_name
* total_quantity_sold

👉 Return products whose total quantity sold is less than the average quantity sold per product

Select p.product_name, sum(oi.quantity) as total_quantity_sold from products p
Join order_items oi on p.product_id = oi.product_id
Group by p.product_id, p.product_name
Having sum(oi.quantity) < (select round(avg(average_quantity),2) from
(Select p1.product_id, sum(oi2.quantity) as average_quantity from products p1
Join order_items oi2 on p1.product_id = oi2.product_id
Group by p1.product_id) as total_quantity);

# Next question (short as you like):

Show:

* category_name
* total_quantity_sold

👉 Return categories whose total quantity sold is greater than the average quantity sold per category

Select c.category_name, sum(oi.quantity) from categories c
Join products p on c.category_id = p.category_id
Join order_items oi on p.product_id = oi.product_id
Group by c.category_id, c.category_name
Having sum(oi.quantity) > (select avg(average_quantity) from 
(Select c1.category_id, sum(oi2.quantity) as average_quantity from categories c1 
Join products p1 on c1.category_id = p1.category_id
Join order_items oi2 on p1.product_id = oi2.product_id
Group by c1.category_id) as total_quantity);

Next question

Show:

* customer_id
* first_name
* total_quantity_purchased

Return customers whose total quantity purchased is greater than the average quantity purchased per customer.

Select c.customer_id, c.first_name, sum(oi.quantity) as total_quantity_purchased from customers c
Join orders o on c.customer_id = o.customer_id 
Join order_items oi on o.order_id = oi.order_id
Group by c.customer_id, c.first_name
Having sum(oi.quantity) > (select avg(average_quantity) from 
(Select c1.customer_id, sum(oi2.quantity) as average_quantity from customers c1
Join orders o1 on c1.customer_id = o1.customer_id 
Join order_items oi2 on o1.order_id = oi2.order_id
Group by c1.customer_id) as total_quantity);

Next question

Show:

* product_name
* total_revenue

Return products whose total revenue is less than the average product revenue in their own category.
Select p.product_name, sum(oi.quantity * oi.unit_price) as total_revenue from products p 
Join order_items oi on p.product_id = oi.product_id
Group by p.product_id, p.product_name
Having sum(oi.quantity * oi.unit_price) < (select avg( customer_product_revenue) from 
(Select p1.product_id, sum(oi2.quantity * oi2.unit_price) as customer_product_revenue from products p1
Join order_items oi2 on p1.product_id = oi2.product_id
WHERE p1.category_id = p.category_id
Group by p1.product_id) as total_products);
Next question

Show:

* category_name
* product_name
* total_quantity_sold

Return products whose total quantity sold is greater than the average quantity sold of products in the same category.


select c.category_name, p.product_name, sum(oi.quantity) as total_quantity_sold from categories c
Join products p on c.category_id = p.category_id
Join order_items oi on p.product_id = oi.product_id
Group by c.category_id, c.category_name, p.product_id, p.product_name
Having sum(oi.quantity) > (select avg(average_quantity) from
(Select p1.product_id, sum(oi2.quantity) as average_quantity from products p1
Join order_items oi2 on p1.product_id = oi2.product_id
Where p1.category_id = c.category_id
Group by p1.product_id) as total_quantity);

Next question

Show:

* customer_id
* first_name
* order_id
* order_total

Return orders whose order_total is greater than the average order total of the same customer.

select c.customer_id, c.first_name, o.order_id, sum(oi.quantity * oi.unit_price) as order_total from customers c
Join orders o on c.customer_id = o.customer_id
Join order_items oi on o.order_id = oi.order_id
Group by c.customer_id, c.first_name, o.order_id
Having sum(oi.quantity * oi.unit_price) > (select avg(average_order_total) from
(Select o1.order_id, sum(oi2.quantity * oi2.unit_price) as average_order_total from orders o1
Join order_items oi2 on o1.order_id = oi2.order_id
Where o1.customer_id = c.customer_id
Group by o1.order_id) as total_order);


#Next question

Show:

* customer_id
* first_name
* product_name
* total_quantity_purchased

Return products where the customer bought more than their own average quantity per product.

SELECT 
    c.customer_id,
    c.first_name,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_purchased
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.first_name, p.product_id, p.product_name
HAVING SUM(oi.quantity) > (
    SELECT AVG(product_quantity)
    FROM (
        SELECT 
            oi2.product_id,
            SUM(oi2.quantity) AS product_quantity
        FROM orders o1
        JOIN order_items oi2 ON o1.order_id = oi2.order_id
        WHERE o1.customer_id = c.customer_id
        GROUP BY oi2.product_id
    ) AS total_quantity
);

Show:

* customer_id
* first_name
* category_name
* total_spending_in_category

👉 Return rows where:
the customer’s total spending in a category is greater than their average spending across all categories.
select c.customer_id, c.first_name, cat.category_name, sum(oi.quantity * oi.unit_price) as total_spending_in_category from customers c
Join orders o on c.customer_id = o.customer_id
Join order_items oi on o.order_id = oi.order_id
Join products p on oi.product_id = p.product_id
Join categories cat on p.category_id = cat.category_id	
Group by c.customer_id, c.first_name, cat.category_id, cat.category_name
Having sum(oi.quantity * oi.unit_price) > (select avg(average_spending) from 
(Select cat2.category_id, sum(oi2.quantity * oi2.unit_price) as average_spending from customers c2
Join orders o2 on c2.customer_id = o2.customer_id
Join order_items oi2 on o2.order_id = oi2.order_id
Join products p2 on oi2.product_id = p2.product_id
Join categories cat2 on p2.category_id = cat2.category_id
Where c2.customer_id = c.customer_id
Group by cat2.category_id) as total_spending);

Next advanced question

Show:

* category_name
* customer_id
* first_name
* total_spending

Return customers whose spending in a category is greater than the average customer spending in that same category.
SELECT 
    c.category_name,
    cu.customer_id,
    cu.first_name,
    SUM(oi.quantity * oi.unit_price) AS total_spending
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
JOIN customers cu ON o.customer_id = cu.customer_id
GROUP BY c.category_id, c.category_name, cu.customer_id, cu.first_name
HAVING SUM(oi.quantity * oi.unit_price) > (
    SELECT AVG(customer_spending)
    FROM (
        SELECT 
            o2.customer_id,
            SUM(oi2.quantity * oi2.unit_price) AS customer_spending
        FROM products p2
        JOIN order_items oi2 ON p2.product_id = oi2.product_id
        JOIN orders o2 ON oi2.order_id = o2.order_id
        WHERE p2.category_id = c.category_id
        GROUP BY o2.customer_id
    ) AS category_customer_spending
);

Show:

* customer_id
* first_name
* product_name
* total_spending

👉 Return products where:
customer spending on that product > average spending of all customers on that product

🎯 What to think

* Outer query → customer + product spending
* Subquery → average spending per product (across all customers)

Select c.customer_id, c.first_name, p.product_name, sum(oi.quantity * oi.unit_price) as total_spending from customers c
Join orders o on c.customer_id = o.customer_id
Join order_items oi on o.order_id = oi.order_id
Join products p on oi.product_id = p.product_id
Group by c.customer_id, c.first_name, c.last_name, p.product_id, p.product_name
Having sum(oi.quantity*oi.unit_price) > (select avg(customer_average) as average_spending from 
(Select c1.customer_id, sum(oi2.quantity * oi2.unit_price) as customer_average from customers c1
Join orders o1 on c1.customer_id = o1.customer_id
Join order_items oi2 on o1.order_id = oi2.order_id
Join products p1 on oi2.product_id = p1.product_id
Where p1.product_id =p.product_id
Group by c1.customer_id) as total_spendings);

Show:

* customer_id
* first_name
* category_name
* product_name
* total_spending

👉 Return rows where:
customer spending on that product 
> average spending of that same customer in that category

SELECT 
    c.customer_id,
    c.first_name,
    cat.category_name,
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS total_spending
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id
GROUP BY c.customer_id, c.first_name, cat.category_id, cat.category_name, p.product_id, p.product_name
HAVING SUM(oi.quantity * oi.unit_price) > (
    SELECT AVG(product_spending)
    FROM (
        SELECT 
            oi2.product_id,
            SUM(oi2.quantity * oi2.unit_price) AS product_spending
        FROM orders o2
        JOIN order_items oi2 ON o2.order_id = oi2.order_id
        JOIN products p2 ON oi2.product_id = p2.product_id
        WHERE o2.customer_id = c.customer_id
          AND p2.category_id = cat.category_id
        GROUP BY oi2.product_id
    ) AS customer_category_product_spending
);

Question 1 (easy)

Show:

* customer_id
* total_spending

👉 Step 1: Create a CTE for customer spending
👉 Step 2: Select from it

With customer_totals as ( 
Select c.customer_id, sum(oi.quantity * oi.unit_price) as total_spending
From customers c
Join orders o on c.customer_id = o.customer_id
Join order_items oi on o.order_id = oi.order_id 
Group by c.customer_id)

Select * from customer_totals;

Next CTE question

Using a CTE, show:

* customer_id
* total_spending

Return customers whose total_spending is greater than the average total_spending of all customers.

With customer_totals as ( 
Select o.customer_id, sum(oi.quantity * oi.unit_price) as total_spending from orders o
Join order_items oi on o.order_id =oi.order_id
Group by o.customer_id
)

Select * from customer_totals
Where total_spending > ( select avg(total_spending) from customer_totals);


Using a CTE, show:

* customer_id
* first_name
* total_spending

👉 Return only customers whose total_spending is in the top 3 highest spending customers
With customer_totals as ( 
Select o.customer_id, sum(oi.quantity * oi.unit_price) as total_spending from orders o
Join order_items oi on o.order_id =oi.order_id
Group by o.customer_id
)

Select * from customer_totals
Order by total_spending desc
Limit 3;
WITH customer_totals AS ( 
    SELECT 
        o.customer_id,
        SUM(oi.quantity * oi.unit_price) AS total_spending
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.customer_id
),
ranked_customers AS (
    SELECT 
        customer_id,
        total_spending,
        ROW_NUMBER() OVER (
            ORDER BY total_spending DESC
        ) AS rn
    FROM customer_totals
)
SELECT customer_id, total_spending
FROM ranked_customers
WHERE rn <= 3;

Using a CTE, show product_name and total_quantity_sold, then return the top 3 products by quantity sold.
With customer_totals as ( 
Select p.product_name, sum(oi.quantity * oi.unit_price) as total_spending from order_items oi
Join products p on oi.product_id = p.product_id
Group by p.product_id, p.product_name
)
,
ranked_products as (
Select product_name, total_spending, row_number() over( order by total_spending desc) as rn 
From customer_totals)

Select * from ranked_products
Where rn<=3;


With customer_totals as ( 
Select p.product_name, sum(oi.quantity * oi.unit_price) as total_spending from order_items oi
Join products p on oi.product_id = p.product_id
Group by p.product_id, p.product_name
)
Select * from customer_totals 
Order by total_spending desc
Limit 3;

🚀 Next question (CTE + Join + Aggregation)

Using a CTE, show:

* category_name
* total_revenue

👉 Then return top 2 categories by revenue

With category_revenue as ( 
Select c.category_name, sum(oi.quantity * oi.unit_price) as total_revenue from categories c 
Join products p   on c.category_id = p.category_id
Join order_items oi on p.product_id = oi.product_id
Group by c.category_id, c.category_name
),

ranked_revenue as (select category_name, total_revenue, row_number() 
over(order by total_revenue desc) as rn
From category_revenue)

 Select * from ranked_revenue
Where rn<=2;


With category_revenue as ( 
Select c.category_name, sum(oi.quantity * oi.unit_price) as total_revenue from categories c 
Join products p   on c.category_id = p.category_id
Join order_items oi on p.product_id = oi.product_id
Group by c.category_id, c.category_name
)

Select * from category_revenue
Order by total_revenue desc
Limit 2;

Using a CTE, show:

* customer_id
* first_name
* total_orders

Return the top 3 customers by number of orders.
With customer_orders as ( 
Select c.customer_id, c.first_name, count(o.order_id) as total_orders from customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name)

Select * from customer_orders
Order by total_orders desc
Limit 3;


With customer_orders as ( 
Select c.customer_id, c.first_name, count(o.order_id) as total_orders from customers c
Join orders o on c.customer_id = o.customer_id
Group by c.customer_id, c.first_name),

order_count as ( select customer_id, first_name, total_orders, row_number() 
over( order by total_orders desc) as rn
 from customer_orders)


Select * from order_count 
Where rn<=3;

Next question

Using a CTE, show:

* product_name
* total_revenue

Return products whose total_revenue is greater than the average product revenue.

With product_revenue as (
Select p.product_name, sum(oi.quantity * oi.unit_price) as total_revenue from products p
Join order_items oi on p.product_id = oi.product_id
Group by p.product_id, p.product_name
)
Select * from product_revenue
Where total_revenue > (select avg(total_revenue) from product_revenue);


Using a CTE, show:

* category_name
* product_name
* total_revenue

👉 Return products whose total_revenue is greater than the average revenue of their category

⸻

🎯 Requirements

* Use a CTE to calculate product revenue
* Compare each product with average of its category
* Use correlated subquery with the CTE


With product_revenue as ( 
Select c.category_id, c.category_name, p.product_name, sum(oi.quantity * oi.unit_price) as total_revenue from categories c
Join products p on c.category_id =p.category_id
Join order_items oi on p.product_id = oi.product_id
Group by c.category_id, c.category_name, p.product_Id, p.product_name)

select category_name, product_name, total_revenue from product_revenue pr 
Where total_revenue> (select avg(pr2.total_revenue) from product_revenue pr2
Where pr2.category_id = pr.category_id);


Next question

Using a CTE, show:

* customer_id
* first_name
* total_spending

Return customers whose total_spending is less than the average customer spending.

With customer_totals as ( 
Select c.customer_id, c.first_name, sum(oi.quantity * oi.unit_price) as total_spending from customers c
Join orders o on c.customer_id =o.customer_id
Join order_items oi on o.order_id = oi.order_id
Group by c.customer_id, c.first_name)

Select * from customer_totals c1
Where total_spending<( select avg(c2.total_spending) from customer_totals c2)
Order by total_spending desc;

🚀 Next CTE Question (Advanced + Real-world)

Using a CTE, show:

* customer_id
* first_name
* total_spending
* rank

👉 Return top 3 customers by total_spending, but:
Handle ties properly

With customer_totals as ( 
Select c.customer_id, c.first_name, sum(oi.quantity * oi.unit_price) as total_spending from customers c
Join orders o on c.customer_id = o.customer_id
Join order_items oi on o.order_id = oi.order_id 
Group by c.customer_id, c.first_name
),

ranked_totals as ( 
Select customer_id, first_name, total_spending, rank() 
over(order by total_spending desc) as rn
From customer_totals)

Select * from ranked_totals
Where rn <=3;

🚀 Next question (Advanced + CASE + CTE)

Using a CTE, show:

* customer_id
* first_name
* total_spending
* spending_category

👉 Classify customers using CASE:
total_spending > 1000 → 'High'
total_spending between 500 and 1000 → 'Medium'
else → 'Low'

With customer_totals as ( 
Select c.customer_id, c.first_name, sum(oi.quantity * oi.unit_price) as total_spending from customers c
Join orders o on c.customer_id = o.customer_id
Join order_items oi on o.order_id = oi.order_id 
Group by c.customer_id, c.first_name
)

Select customer_id, first_name, total_spending,
Case
When total_spending > 1000 then 'High'
When total_spending between 500 and 1000 then 'Medium'
Else 'Low'
End as spending_category
from customer_totals ;

#Next question

Using a CTE, show:

* product_name
* total_revenue
* revenue_category

Classify:

* total_revenue > 1000 → 'High Revenue'
* total_revenue BETWEEN 500 AND 1000 → 'Medium Revenue'
* else → 'Low Revenue'

With product_revenue as (
Select p.product_name, sum(oi.quantity * oi.unit_price) as total_revenue from products p 
Join order_items oi on p.product_id = oi.product_id
Group by p.product_id, p.product_name) 

select product_name, total_revenue,
Case
When total_revenue > 1000 then 'High Revenue'
When total_revenue between 500 and 1000 then 'Medium Revenue'
Else 'Low Revenue'
End as revenue_category
From product_revenue;
Next question

Using a CTE, show:

* category_name
* total_revenue
* revenue_category

Classify:

* total_revenue > 2000 → 'Top Category'
* total_revenue BETWEEN 1000 AND 2000 → 'Medium Category'
* else → 'Low Category'

With category_totals as (
Select c.category_name, sum(oi.quantity * oi.unit_price) as total_revenue from categories c
Join products p on c.category_id = p.category_id
Join order_items oi on p.product_id = oi.product_id
Group by c.category_id, c.category_name
)

Select category_name, total_revenue,
Case
When total_revenue>300 then 'Top Category'
When total_revenue between 100 and 300 then 'Medium Category'
Else 'Low Category'
End as revenue_category
From category_totals;

🚀 Next question (final level for today 🔥)

Using a CTE, show:

* customer_id
* first_name
* category_name
* total_spending

👉 Return rows where:customer spending in that category > average spending of that same customer

With customer_totals as (
Select c.customer_id, c.first_name, cat.category_name, sum(oi.quantity * oi.unit_price) as total_spending from customers c
Join orders o on c.customer_id =o.customer_id
Join order_items oi on o.order_id = oi.order_id
Join products p on oi.product_id = p.product_id
Join categories cat on p.category_id = cat.category_id
Group by c.customer_id, c.first_name, cat.category_id, cat.category_name)

Select * from customer_totals c1
Where total_spending > (select  avg(cr.total_spending) from customer_totals cr
Where cr.customer_id = c1.customer_id);

Using a CTE, show:

* product_name
* total_quantity_sold
* quantity_category

Classify:

* total_quantity_sold > 50 → 'Fast Moving'
* total_quantity_sold BETWEEN 20 AND 50 → 'Medium Moving'
* else → 'Slow Moving'

With products_sold as (
Select p.product_name, sum(oi.quantity) as total_quantity_sold from products p
Join order_items oi on p.product_id = oi.product_id
Group by p.product_id, p.product_name
)

Select product_name, total_quantity_sold ,
Case
When total_quantity_sold>=3 then 'Fast Moving'
When total_quantity_sold between 1 and 2 then 'Medium Moving'
Else 'Slow Moving'
End as quantity_category
From products_sold;

Using a CTE, show:

* customer_id
* first_name
* total_orders
* customer_type

Classify:

* total_orders >= 5 → 'Loyal Customer'
* total_orders BETWEEN 2 AND 4 → 'Regular Customer'
* else → 'New Customer'

With customer_total_orders as 
(Select c.customer_id, c.first_name, count(o.order_id) as total_orders from customers c
Join orders o on c.customer_id = o.customer_id 
Group by c.customer_id, c.first_name)

Select customer_id, first_name, total_orders,
Case
When total_orders >=5 then 'Loyal Customer'
When total_orders between 2 and 4 then 'Regular customer'
Else 'New customer'
End as customer_type
From customer_total_orders;

🚀 Final challenge (interview-level)

Using a CTE, show:

* category_name
* product_name
* total_revenue
* rank_in_category

👉 Return top 2 products within each category based on revenue.


With category_revenue as (
Select c.category_name, p.product_name, sum(oi.quantity * oi.unit_price) as total_revenue from categories c
Join products p on c.category_id = p.category_id
Join order_items oi on p.product_id = oi.product_Id
Group by c.category_id, c.category_name, p.product_id, p.product_name
),

ranked_category as (
Select category_name, product_name, total_revenue, rank() 
over(partition by category_name
order by total_revenue desc) as rn 
From category_revenue
)

Select category_name, product_name, total_revenue
From ranked_category
Where rn <=2;

Using a CTE, show:

* customer_id
* first_name
* category_name
* total_spending
* rank_in_category

👉 Return top 2 customers within each category based on spending


With customer_totals as (
Select c.customer_id, c.first_name, cat.category_name, sum(oi.quantity * oi.unit_price) as total_spending from customers c
Join orders o on c.customer_id = o.customer_id
Join order_items oi on o.order_id = oi.order_id
Join products p on oi.product_id = p.product_id
join categories cat on p.category_id = cat.category_id
Group by c.customer_id, c.first_name, cat.category_id, cat.category_name),

customer_ranking as (
Select customer_id, first_name, category_name, total_spending, rank()
over( partition by category_name
Order by total_spending desc) as rank_in_category 
From customer_totals)

Select * from customer_ranking
Where rank_in_category<=2;


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


🚀 Question 1 (revision)

Show:

* product_name
* total_revenue
* row_num

👉 Rank products by total_revenue using ROW_NUMBER().

Use:

* products
* order_items
* aggregation
* CTE + window function
With total_revenue as (
Select p.product_name, sum(oi.quantity * oi.unit_price) as total_revenue from products p
Join order_items oi on p.product_id = oi.product_id 
Group by p.product_id, p.product_name
),

ranked_products as ( 
Select product_name, total_revenue, row_number()
over(order by total_revenue desc) as row_num
From total_revenue)

Select * from ranked_products;

Next question

Show:

* product_name
* total_revenue
* product_rank

Rank products by total_revenue using RANK() instead of ROW_NUMBER().

With total_revenue as (
Select p.product_name, sum(oi.quantity * oi.unit_price) as total_revenue from products p
Join order_items oi on p.product_id = oi.product_id 
Group by p.product_id, p.product_name
),

ranked_products as ( 
Select product_name, total_revenue, rank()
over(order by total_revenue desc) as product_rank
From total_revenue)

Select * from ranked_products;

Show:

* product_name
* total_revenue
* dense_product_rank

Use:DENSE_RANK()

With total_revenue as (
Select p.product_name, sum(oi.quantity * oi.unit_price) as total_revenue from products p
Join order_items oi on p.product_id = oi.product_id 
Group by p.product_id, p.product_name
),

ranked_products as ( 
Select product_name, total_revenue, dense_rank()
over(order by total_revenue desc) as dense_product_rank
From total_revenue)

Select * from ranked_products;

Next question

Show:

* category_name
* product_name
* total_revenue
* rank_in_category

Return the top 2 products in each category based on revenue.

Use RANK() with PARTITION BY.

With category_based_revenue as (
Select c.category_name, p.product_name, sum(oi.quantity * oi.unit_price) as total_revenue from categories c
Join products p on c.category_id = p.category_id
Join order_items oi on p.product_id = oi.product_id
Group by c.category_id, c.category_name, p.product_id, p.product_name
),

ranked_products as (
Select category_name, product_name, total_revenue,
rank() over(partition by category_name
order by total_revenue desc) as rank_in_category
from category_based_revenue)

Select * from ranked_products
Where rank_in_category <=2;


🎯 First LAG() Question

Show:

* order_id
* customer_id
* order_date
* total_amount
* previous_order_amount

Requirements:

* use LAG()
* compare previous order of the SAME customer
* order by order_date

With compare_with_same_customer as (
Select o.order_id, o.customer_id, o.order_date, o.total_amount, lag(o.total_amount)
over( partition  by o.customer_id
order by  o.order_date, o.order_id ) as previous_order_amount
from orders o 
)

Select * from compare_with_same_customer;



Next question

Show:

* order_id
* customer_id
* order_date
* total_amount
* previous_order_amount
* amount_difference

Where:amount_difference = total_amount - previous_order_amount

with compare_with_same_customer as (
Select o.order_id, o.customer_id, o.order_date, o.total_amount, lag(o.total_amount)
over( partition  by o.customer_id
order by  o.order_date, o.order_id ) as previous_order_amount
from orders o 
)	
Select order_id, customer_id, order_date, total_amount, previous_order_amount,
total_amount - previous_order_amount as amount_difference
from compare_with_same_customer;


Return only orders where:

current total_amount > previous_order_amount

With compare_with_same_customer as (
Select o.order_id, o.customer_id, o.order_date, o.total_amount, lag(o.total_amount)
over( partition  by o.customer_id
order by  o.order_date, o.order_id) as previous_order_amount
from orders o 
)

Select * from compare_with_same_customer
Where total_amount > previous_order_amount;

Next question

Return only orders where:current total_amount < previous_order_amount
With compare_with_same_customer as (
Select o.order_id, o.customer_id, o.order_date, o.total_amount, lag(o.total_amount)
over( partition  by o.customer_id
order by  o.order_date, o.order_id) as previous_order_amount
from orders o 
)

Select * from compare_with_same_customer
Where total_amount < previous_order_amount;

Next question:

Return orders where the amount increased by more than 100 compared to the previous order.

With compare_with_same_customer as (
Select o.order_id, o.customer_id, o.order_date, o.total_amount, lag(o.total_amount)
over( partition  by o.customer_id
order by  o.order_date, o.order_id) as previous_order_amount
from orders o 
)

Select * from compare_with_same_customer
Where total_amount - previous_order_amount <100;


Next question:

Return orders where the amount decreased by more than 100 compared to the previous order.

With compare_with_same_customer as (
Select o.order_id, o.customer_id, o.order_date, o.total_amount, lag(o.total_amount)
over( partition  by o.customer_id
order by  o.order_date, o.order_id) as previous_order_amount
from orders o 
)
Select * from compare_with_same_customer
Where previous_order_amount - total_amount <100;

🎯 New level question (business analytics)

Scenario

Management wants to identify customers whose latest order amount is higher than their previous order amount.

Return:

* customer_id
* order_id
* order_date
* total_amount
* previous_order_amount

Only include orders where:
current order > previous order
and

the order is the latest order for that customer.

With compare_with_same_customer as (
Select o.order_id, o.customer_id, o.order_date, o.total_amount, lag(o.total_amount)
over( partition  by o.customer_id
order by  o.order_date, o.order_id) as previous_order_amount,
row_number() over(partition by o.customer_id	
order by o.order_date desc, o.order_id desc) as rn
from orders o
)
Select customer_id, order_id, order_date, total_amount, previous_order_amount
from compare_with_same_customer
Where total_amount < previous_order_amount
and rn=1;








