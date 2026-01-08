-- Query 1: Customer Purchase History
Business Question: "Generate a detailed report showing each customer's name, email, total number of orders placed, and total amount spent. Include only customers who have placed at least 2 orders and spent more than ₹5,000. Order by total amount spent in descending order."
SELECT 
    CONCAT(a.first_name,' ', a.last_name) as customer_name,
    a.email,
    COUNT(b.order_id) as total_order,
    sum(b.total_amount) as total_spent
FROM customers a INNER JOIN orders b on a.customer_id=b.customer_id
GROUP BY 1,2
HAVING sum(b.total_amount) >5000 and COUNT(b.order_id) > 2
ORDER BY total_spent DESC


-- Query 2: Product Sales Analysis
Business Question: "For each product category, show the category name, number of different products sold, total quantity sold, and total revenue generated. Only include categories that have generated more than ₹10,000 in revenue. Order by total revenue descending."
SELECT 
    a.category,
    COUNT(DISTINCT a.product_id) as num_product,
    SUM(b.quantity) as total_quantity_sold,
    SUM(c.total_amount) as total_revenue
FROM products a 
    INNER JOIN order_items b ON a.product_id=b.product_id
    INNER JOIN orders c ON b.order_id=c.order_id
GROUP BY 1
WHERE SUM(c.total_amount) > 10000
ORDER BY total_revenue DESC

-- Query 3: Monthly Sales Trend
Business Question: "Show monthly sales trends for the year 2024. For each month, display the month name, total number of orders, total revenue, and the running total of revenue (cumulative revenue from January to that month)."
SELECT
    month_name,
    total_order,
    monthly_revenue,
    SUM(monthly_revenue) OVER (ORDER BY order_date) as cumulative_revenue
FROM
    (SELECT
        MONTH(a.order_date) as order_date,
        MONTHNAME(a.order_date) as month_name,
        SUM(b.quantity) as total_order,
        SUM(a.total_amount) as monthly_revenue
    FROM orders a
        INNER JOIN order_items b
    GROUP BY 1,2
) t
WHERE YEAR(order_date) = 2024
GROUP BY 1
ORDER BY MONTH(order_date);
