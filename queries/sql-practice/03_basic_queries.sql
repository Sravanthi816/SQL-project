-- SQL E-Commerce Basic Queries
-- Common business queries and analytics

-- ============================================
-- CUSTOMER QUERIES
-- ============================================

-- 1. All customers with their total order count
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.city,
    c.country,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email, c.city, c.country
ORDER BY total_orders DESC;

-- 2. Find customers who have spent the most
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS order_count,
    SUM(o.total_amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 10;

-- ============================================
-- PRODUCT QUERIES
-- ============================================

-- 3. All products with category names and stock levels
SELECT 
    p.product_id,
    p.product_name,
    c.category_name,
    p.price,
    p.stock_quantity,
    CASE 
        WHEN p.stock_quantity = 0 THEN 'Out of Stock'
        WHEN p.stock_quantity < 20 THEN 'Low Stock'
        ELSE 'In Stock'
    END AS stock_status
FROM products p
JOIN categories c ON p.category_id = c.category_id
ORDER BY c.category_name, p.product_name;

-- 4. Products by category with average price
SELECT 
    c.category_name,
    COUNT(p.product_id) AS product_count,
    AVG(p.price) AS avg_price,
    MIN(p.price) AS min_price,
    MAX(p.price) AS max_price,
    SUM(p.stock_quantity) AS total_stock
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name
ORDER BY product_count DESC;

-- 5. Top 5 best-selling products
SELECT 
    p.product_id,
    p.product_name,
    c.category_name,
    p.price,
    SUM(oi.quantity) AS total_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
JOIN categories c ON p.category_id = c.category_id
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, c.category_name, p.price
ORDER BY total_sold DESC
LIMIT 5;

-- ============================================
-- ORDER QUERIES
-- ============================================

-- 6. All orders with customer and order details
SELECT 
    o.order_id,
    c.first_name,
    c.last_name,
    c.email,
    o.order_date,
    o.total_amount,
    o.order_status,
    COUNT(oi.order_item_id) AS item_count
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, c.first_name, c.last_name, c.email, o.order_date, o.total_amount, o.order_status
ORDER BY o.order_date DESC;

-- 7. Orders by status
SELECT 
    order_status,
    COUNT(order_id) AS order_count,
    AVG(total_amount) AS avg_order_value,
    SUM(total_amount) AS total_revenue
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;

-- 8. Orders with items breakdown
SELECT 
    o.order_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    o.order_date,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS item_total
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
ORDER BY o.order_date DESC, o.order_id;

-- ============================================
-- PAYMENT QUERIES
-- ============================================

-- 9. Payment summary by method
SELECT 
    payment_method,
    COUNT(payment_id) AS transaction_count,
    SUM(payment_amount) AS total_amount,
    AVG(payment_amount) AS avg_amount,
    payment_status
FROM payments
GROUP BY payment_method, payment_status
ORDER BY total_amount DESC;

-- 10. Pending payments
SELECT 
    p.payment_id,
    o.order_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    o.order_date,
    p.payment_amount,
    p.payment_method,
    p.payment_date
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE p.payment_status = 'pending'
ORDER BY p.payment_date;

-- ============================================
-- ANALYTICS QUERIES
-- ============================================

-- 11. Daily sales summary
SELECT 
    DATE(o.order_date) AS sale_date,
    COUNT(DISTINCT o.order_id) AS orders,
    COUNT(oi.order_item_id) AS items_sold,
    SUM(o.total_amount) AS daily_revenue,
    AVG(o.total_amount) AS avg_order_value
FROM orders o
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY DATE(o.order_date)
ORDER BY sale_date DESC;

-- 12. Revenue by category
SELECT 
    c.category_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity) AS total_items_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    AVG(oi.unit_price) AS avg_item_price
FROM categories c
JOIN products p ON c.category_id = p.category_id
LEFT JOIN order_items oi ON p.product_id = oi.product_id
LEFT JOIN orders o ON oi.order_id = o.order_id
GROUP BY c.category_id, c.category_name
ORDER BY total_revenue DESC;
