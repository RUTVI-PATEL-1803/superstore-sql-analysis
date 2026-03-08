-- analysis_queries.sql

-- Total sales
SELECT SUM(sales) total_sales
FROM order_items;

-- Total profit
SELECT SUM(profit) total_profit
FROM order_items;

-- Sales by category
SELECT p.category, SUM(oi.sales) total_sales
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

-- Top 10 customers by sales
SELECT o.customer_name, SUM(oi.sales) total_sales
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.customer_name
ORDER BY total_sales DESC
FETCH FIRST 10 ROWS ONLY;

-- Profit by region
SELECT c.region, SUM(oi.profit) total_profit
FROM customers c
JOIN orders o
ON c.customer_name = o.customer_name
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.region
ORDER BY total_profit DESC;

-- Monthly sales trend
SELECT EXTRACT(MONTH FROM o.order_date) month,
       SUM(oi.sales) total_sales
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY EXTRACT(MONTH FROM o.order_date)
ORDER BY month;

-- Rank customers by sales (window function)
SELECT o.customer_name,
       SUM(oi.sales) total_sales,
       RANK() OVER (ORDER BY SUM(oi.sales) DESC) sales_rank
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.customer_name;

-- Most profitable products
SELECT p.product_name, SUM(oi.profit) total_profit
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_profit DESC
FETCH FIRST 5 ROWS ONLY;

-- Orders with highest shipping cost
SELECT order_id, SUM(shipping_cost) total_shipping
FROM order_items
GROUP BY order_id
ORDER BY total_shipping DESC
FETCH FIRST 10 ROWS ONLY;

-- Products never sold
SELECT product_name
FROM products
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM order_items);