/*

Calculate monthwise sales, the corresponding MoM from previous month
*/

-- Using Lag function
SELECT Year as year1,Month as month1,round((((sales_sum-Previous_month)/sales_sum)),1) as MOM_growth_percentage
FROM
(
SELECT Year,Month,sales_sum,
LAG(sales_sum) OVER(ORDER BY year,Month) as Previous_month
FROM
(
SELECT year(Order_date) AS Year, Month(Order_date) AS Month, sum(sales) AS Sales_sum
FROM Orders 
GROUP BY year(Order_date), Month(Order_date)
order by year(Order_date), month(Order_date)
) q
)a 


/*

Calculate monthwise sales, the corresponding YTD Sales
*/

SELECT Year,Month,sales_sum,
sum(sales_sum) OVER(PARTITION BY Year ORDER BY Month) as YTD
FROM
(
SELECT year(Order_date) AS Year, Month(Order_date) AS Month, round(sum(sales),2) AS Sales_sum
FROM Orders 
GROUP BY year(Order_date), Month(Order_date)
order by year(Order_date), month(Order_date)
) q



