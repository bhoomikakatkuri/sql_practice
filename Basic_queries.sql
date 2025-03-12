
/*Show me records where city is 'Seattle' */

select * from orders o 
where city = 'Seattle'

/*
Show the order_id,Product name,sale of Top 10 records with highest sales
*/
select order_id,product_name,sales
FROM orders o
order by sales DESC
limit 10;
/*
