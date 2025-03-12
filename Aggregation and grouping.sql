

/*Write a query to get monthwise sales, Profit Percentage
*/

select Year,Month,round(ssales,2) AS Total_Sales,round(((sprofit/ssales)*100),1) AS profit_Percentage
FROM
(SELECT year(`Order_Date`) AS Year,Month(Order_date) as Month, sum(`Sales`) AS ssales, sum(`Profit`) AS sprofit, count(`Sales`) AS csales
FROM orders o
GROUP BY YEAR(`Order_Date`),Month(Order_date)
order by year(Order_date), month(Order_date)
) a 
;



/*

Calculate month wise sales, for 2014 and 2015. The year should be in columns. Calculate the YoY 

*/

-- Using case when
select *,round(((2015_sales-2014_sales)/2014_sales)*100,1) as YOY_percentage
from(
select month(order_date) as month
, round(sum(case when year(order_date)=2014 then sales end),2) as 2014_sales
, round(sum(case when year(order_date)=2015 then sales end),2) as 2015_sales
from orders
group by month(order_date)
) a
order by month asc;


/*

What is the distribution of days to ship?

*/

SELECT ship_days, count(DISTINCT(order_id)) as orders1
FROM(

SELECT order_ID,(ship_date-Order_date) AS ship_days
FROM Orders
) a 
GROUP BY ship_days
ORDER BY ship_days;



