CREATE DATABASE restaurant_orders;

USE restaurant_orders;

CREATE TABLE orders (
    Order_ID INT,
    Customer_Name VARCHAR(100),
    Food_Item VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    Payment_Method VARCHAR(50),
    Order_Time DATETIME
);

SELECT * FROM restaurant LIMIT 10;

SELECT COUNT(DISTINCT Order_ID) AS total_orders
FROM restaurant;                   # Total orders

SELECT COUNT(DISTINCT Customer_Name) AS total_customers
FROM restaurant;                       # Total customers

# Sales Analysis

SELECT SUM(Quantity * Price) AS total_revenue
FROM restaurant;      # Total revenue

SELECT AVG(Quantity * Price) AS avg_order_value
FROM restaurant;      # Average order value

# Category-wise Analysis

SELECT Category,
       SUM(Quantity * Price) AS category_revenue
FROM restaurant
GROUP BY Category
ORDER BY category_revenue DESC;    # Revenue by category


SELECT Category,
       SUM(Quantity) AS total_quantity
FROM restaurant
GROUP BY Category
ORDER BY total_quantity DESC;     # Most sold category

# Food Item Analysis


SELECT Food_Item,
       SUM(Quantity) AS total_sold
FROM restaurant
GROUP BY Food_Item
ORDER BY total_sold DESC
LIMIT 5;        # Top 5 best-selling food items


SELECT Food_Item,
       SUM(Quantity) AS total_sold
FROM restaurant
GROUP BY Food_Item
ORDER BY total_sold ASC
LIMIT 1;             #Least sold item

# Payment Method Analysis

SELECT Payment_Method,
       COUNT(*) AS total_transactions
FROM restaurant
GROUP BY Payment_Method;   

# Date & Time Analysis

SELECT DATE(Order_Time) AS order_date,
       COUNT(Order_Id) AS orders_count
FROM restaurant
GROUP BY DATE(Order_Time);      # Orders per day

# Highest sales day

SELECT DATE(Order_Time) AS order_date,
       SUM(Quantity * Price) AS daily_sales
FROM restaurant
GROUP BY DATE(Order_Time)
ORDER BY daily_sales DESC
LIMIT 1;

