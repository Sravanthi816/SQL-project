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