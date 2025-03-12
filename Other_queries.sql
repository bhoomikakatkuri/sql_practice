/*
What are the top 10 products with highest YoY % jump between 2014 and 2015
*/

-- Using Self join
SELECT Product, round(((sales_15-sales_14)/sales_14)*100,1) as YOY_percentage
FROM
(
SELECT s1.product_name as Product, round(2014_sales,2) as sales_14, round(2015_sales,2) as sales_15
FROM

(
SELECT product_name, sum(sales) as 2014_sales
FROM orders
WHERE year(order_date) =2014
GROUP BY product_name
) as s1
 JOIN
(
SELECT product_name, sum(sales) as 2015_sales
FROM orders
WHERE year(order_date) =2015
GROUP BY product_name
) as s2
ON s1.product_name=s2.product_name
) a 
ORDER by YOY_percentage DESC
LIMIT 10;


-- Using case when
select *,round(((2015_sales-2014_sales)/2014_sales)*100,1) as YOY_percentage
from(
select product_name
, round(sum(case when year(order_date)=2014 then sales end),2) as 2014_sales
, round(sum(case when year(order_date)=2015 then sales end),2) as 2015_sales
from orders
group by product_name
) a
order by YOY_percentage DESC
limit 10;




/* For each customer, calculate thenumber of orders, first order date, avg time taken between 2 consecutive orders */

SELECT customer_name, count(distinct order_ID) as No_of_orders, min(order_date) as First_order_date, round((datediff(max(order_date),min(order_date))/(count(DISTINCT order_id)-1)),1) as avd_ordertime
FROM orders
GROUP BY customer_name;







