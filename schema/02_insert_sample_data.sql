-- SQL E-Commerce Sample Data
-- Insert sample data for testing and development

-- Insert Categories
INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Electronic devices and gadgets'),
('Clothing', 'Apparel and accessories'),
('Home & Garden', 'Home appliances and garden tools'),
('Books', 'Physical and digital books'),
('Sports', 'Sports equipment and gear');

-- Insert Customers
INSERT INTO customers (first_name, last_name, email, phone, country, city) VALUES
('John', 'Doe', 'john.doe@email.com', '555-0101', 'United States', 'New York'),
('Jane', 'Smith', 'jane.smith@email.com', '555-0102', 'United States', 'Los Angeles'),
('Michael', 'Johnson', 'michael.j@email.com', '555-0103', 'Canada', 'Toronto'),
('Emily', 'Williams', 'emily.w@email.com', '555-0104', 'United States', 'Chicago'),
('David', 'Brown', 'david.brown@email.com', '555-0105', 'United Kingdom', 'London');

-- Insert Products
INSERT INTO products (product_name, category_id, price, stock_quantity, description) VALUES
('Wireless Headphones', 1, 79.99, 50, 'High-quality Bluetooth headphones with noise cancellation'),
('USB-C Cable', 1, 12.99, 200, 'Durable 6ft USB-C charging and data transfer cable'),
('T-Shirt', 2, 19.99, 100, 'Comfortable cotton T-shirt available in multiple colors'),
('Jeans', 2, 49.99, 80, 'Classic blue denim jeans with perfect fit'),
('Coffee Maker', 3, 89.99, 30, 'Programmable coffee maker with 12-cup capacity'),
('Garden Shovel', 3, 24.99, 45, 'Sturdy steel shovel for gardening and landscaping'),
('The Great Gatsby', 4, 12.99, 60, 'Classic novel by F. Scott Fitzgerald'),
('Running Shoes', 5, 129.99, 35, 'Professional running shoes with cushioned soles'),
('Yoga Mat', 5, 29.99, 75, 'Non-slip yoga mat 6mm thick with carrying strap'),
('Laptop Stand', 1, 39.99, 40, 'Adjustable aluminum laptop stand for better ergonomics');

-- Insert Orders
INSERT INTO orders (customer_id, order_date, total_amount, order_status) VALUES
(1, '2024-01-15 10:30:00', 179.97, 'delivered'),
(2, '2024-01-20 14:45:00', 99.98, 'delivered'),
(3, '2024-02-05 09:15:00', 349.96, 'delivered'),
(1, '2024-02-14 16:20:00', 129.99, 'shipped'),
(4, '2024-02-20 11:00:00', 79.99, 'pending'),
(5, '2024-03-01 13:30:00', 249.97, 'delivered'),
(2, '2024-03-05 10:45:00', 44.98, 'pending');

-- Insert Order Items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 2, 1, 12.99),
(1, 1, 2, 79.99),
(2, 4, 2, 49.99),
(3, 5, 1, 89.99),
(3, 6, 2, 24.99),
(3, 8, 1, 129.99),
(4, 8, 1, 129.99),
(5, 1, 1, 79.99),
(6, 3, 2, 19.99),
(6, 4, 1, 49.99),
(6, 9, 2, 29.99),
(7, 7, 1, 12.99),
(7, 10, 2, 39.99);

-- Insert Payments
INSERT INTO payments (order_id, payment_method, payment_amount, payment_date, payment_status) VALUES
(1, 'Credit Card', 179.97, '2024-01-15 10:35:00', 'completed'),
(2, 'Debit Card', 99.98, '2024-01-20 14:50:00', 'completed'),
(3, 'PayPal', 349.96, '2024-02-05 09:20:00', 'completed'),
(4, 'Credit Card', 129.99, '2024-02-14 16:25:00', 'completed'),
(5, 'Credit Card', 79.99, '2024-02-20 11:05:00', 'pending'),
(6, 'Debit Card', 249.97, '2024-03-01 13:35:00', 'completed'),
(7, 'PayPal', 44.98, '2024-03-05 10:50:00', 'pending');
