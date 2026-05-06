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


  



