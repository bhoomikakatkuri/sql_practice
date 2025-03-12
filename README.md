# SQL Practice Queries

## Overview
This repository contains SQL practice queries based on a relational schema with three tables: `orders`, `people`, and `returns`. The queries cover various SQL concepts, including filtering, aggregation, joins, subqueries, and window functions.

## Schema Details

### orders
This table stores order details, including customer information, product details, and sales data.

| Column         | Type          | Description |
|---------------|--------------|-------------|
| Row_ID        | varchar(100)  | Unique identifier for each row |
| Order_ID      | varchar(100)  | Unique identifier for each order |
| Order_Date    | date          | Date when the order was placed |
| Ship_Date     | date          | Date when the order was shipped |
| Ship_Mode     | varchar(100)  | Shipping mode of the order |
| Customer_ID   | varchar(100)  | Unique identifier for the customer |
| Customer_Name | varchar(100)  | Name of the customer |
| Segment       | varchar(100)  | Market segment of the customer |
| Country       | varchar(100)  | Country where the order was placed |
| City          | varchar(100)  | City where the order was placed |
| State         | varchar(100)  | State where the order was placed |
| Postal_Code   | varchar(100)  | Postal code of the order location |
| Region        | varchar(100)  | Region where the order was placed |
| Product_ID    | varchar(100)  | Unique identifier for the product |
| Category      | varchar(100)  | Product category |
| Sub_Category  | varchar(100)  | Product sub-category |
| Product_Name  | varchar(1000) | Name of the product |
| Sales         | float         | Sale amount of the order |
| Quantity      | int           | Quantity of the product ordered |
| Discount      | float         | Discount applied on the order |
| Profit        | float         | Profit earned from the order |

### people
This table contains information about personnel and their associated region.

| Column | Type         | Description |
|--------|------------|-------------|
| person | varchar(100) | Name of the person |
| region | varchar(100) | Region associated with the person |

### returns
This table records order returns.

| Column    | Type         | Description |
|-----------|-------------|-------------|
| Returned  | varchar(100) | Indicates whether an order was returned (Yes/No) |
| Order_ID  | varchar(100) | Order ID associated with the return |

## Queries
The SQL queries in this repository cover a variety of topics, including but not limited to:

1. **Basic Queries**
   - Selecting specific columns
   - Filtering data using `WHERE`
   - Sorting data with `ORDER BY`
   
2. **Aggregation & Grouping**
   - Using `SUM()`, `AVG()`, `COUNT()`, `MIN()`, `MAX()`
   - Grouping data with `GROUP BY`
   - Filtering aggregated results with `HAVING`

3. **Joins**
   - Inner, left, right, and full joins between `orders`, `people`, and `returns`

4. **Window Functions**
   - Ranking orders using `RANK()`, `DENSE_RANK()`, and `ROW_NUMBER()`
   - Running totals with `SUM() OVER()`
   - Moving averages with `AVG() OVER()`


## How to Use
- Open an SQL environment (MySQL, PostgreSQL, SQL Server, etc.).
- Load the dataset if available.
- Run the provided SQL queries to analyze the dataset and practice SQL.

## Contributing
If you have additional queries or improvements, feel free to submit a pull request!

## License
This repository is for educational purposes. Feel free to use and modify the queries as needed.

