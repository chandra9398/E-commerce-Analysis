set sql_safe_updates=0;
use aj;


# 1.Find the top 5 customers by total spending .
SELECT c.Customer_Name,
SUM(o.quantity * o.price) AS Total_Spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY Total_Spent DESC
LIMIT 5;

# 2. Calculate  total revenue per product category.
Select p.category,
sum(p.price * o.quantity) 
AS Total_revenue_per_Product 
from products p 
join orders o on p.product_id = o.product_id
group by p.category; 
 
 # 3.Identify the region with the highest average order value.
  
  select c.region as REGION,
  Avg(o.total_value) as HIHEST_ORDER_VALUE
  from customers c
  join orders o on  c.customer_id = o.customer_id
  group by REGION
  limit 1;
  
# 4.Get monthly sales trends for the last 12 months.
  
SELECT 
DATE_FORMAT(o.order_date, '%Y-%m') AS Month,
SUM(o.total_value) AS Total_sales
FROM orders o
GROUP BY month
ORDER BY month DESC
LIMIT 12;

# 5.List products that were never purchased
  
SELECT p.product_id, p.product_name
FROM products p
WHERE p.product_id NOT IN (
SELECT DISTINCT p.product_id
FROM orders o);





  
  
  







