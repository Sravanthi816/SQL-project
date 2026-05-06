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

