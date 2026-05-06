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
