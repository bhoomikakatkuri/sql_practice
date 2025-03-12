

/*Write a query to get monthwise sales, Profit Percentage,Returns Percentage
*/

select Year,Month,round(ssales,2) AS Total_Sales,round(((sprofit/ssales)*100),1) AS profit_Percentage, round(((creturns/csales)*100),1) AS returns_Percentage
FROM
(SELECT year(`Order_Date`) AS Year,Month(Order_date) as Month, sum(`Sales`) AS ssales, sum(`Profit`) AS sprofit, count(`Sales`) AS csales, count(`Returned`) AS creturns
FROM orders o
left JOIN returns r 
on o.`Order_ID`=r.`Order_ID`
GROUP BY YEAR(`Order_Date`),Month(Order_date)
order by year(Order_date), month(Order_date)
) a 
;

/* Calculate the total number of orders, without any returns */


SELECT year(`Order_Date`) AS Year,Month(Order_date) as Month, count(distinct o.`Order_ID`) as orders_without_returns
FROM orders o
left JOIN returns r 
on o.`Order_ID`=r.`Order_ID`
where r.`Order_ID` is NULL
GROUP BY YEAR(`Order_Date`),Month(Order_date)
order by year(Order_date), month(Order_date);


/*
Calculate monthwise sales, the corresponding MoM from previous month
*/

-- Using Self join

SELECT year, Month,present_month_sales,round(((present_month_sales-Previous_month_sales)/present_month_sales),1) AS MOM_sales_persentage
FROM
(
SELECT p_s.Year ,p_s.Month ,round(p_s.Sales_sum,2) AS present_month_sales,round(l_s.Sales_sum,2) AS Previous_month_sales
FROM
(
SELECT year(Order_date) AS Year, Month(Order_date) AS Month, sum(sales) AS Sales_sum
FROM Orders
GROUP BY year(Order_date), Month(Order_date)
order by year(Order_date), month(Order_date)
) AS p_s
LEFT JOIN
(
SELECT year(Order_date) AS Year, Month(Order_date) AS Month, sum(sales) AS Sales_sum
FROM Orders
GROUP BY year(Order_date), Month(Order_date)
order by year(Order_date), month(Order_date)
) AS l_s
ON (l_s.Month= p_s.Month-1
AND p_s.Year=l_s.Year)
OR(p_s.Month=1 
AND l_s.Year=p_s.Year-1
AND l_s.Month=12)
) a



/*

Calculate month wise sales, for 2014 and 2015. The year should be in columns. Calculate the YoY 

*/

-- Using Self join 
SELECT Month1, sales_14, sales_15, round(((sales_15-sales_14)/sales_14)*100,1) as YOY_percentage
FROM
(
SELECT s1.Month as Month1, round(2014_sales,2) as sales_14, round(2015_sales,2) as sales_15
FROM
(
SELECT month(order_date) as Month, sum(sales) as 2014_sales
FROM orders
WHERE year(order_date) =2014
GROUP BY month(order_date)
) as s1
 JOIN
(
SELECT month(order_date) as Month, sum(sales) as 2015_sales
FROM orders
WHERE year(order_date) =2015
GROUP BY month(order_date)
) as s2
ON s1.month=s2.month
) a
ORDER BY Month1;
