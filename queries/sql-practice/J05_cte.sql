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
