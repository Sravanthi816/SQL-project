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
