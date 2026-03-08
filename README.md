# Superstore Sales Analysis (Oracle SQL)

This project analyzes the Kaggle Superstore dataset using Oracle SQL.

## Dataset
Global Superstore dataset from Kaggle containing sales transactions (~50k records).

## Database Design
Normalized relational schema:

- **Customers**  
- **Products**  
- **Orders**  
- **Order_Items**  

## Features
- Imported and processed raw CSV data into Oracle 11g tables  
- SQL queries with joins, aggregations, subqueries, and window functions  
- Sales, profit, and customer analysis  
- Insights on top customers, most profitable products, and monthly trends  
- Visualized results in charts (bar, line, horizontal bar)  

## Sample Visuals

### Sales by Category
![Sales by Category](images/sales_by_category.png)

### Monthly Sales Trend
![Monthly Sales Trend](images/monthly_sales_trend.png)

### Top 10 Customers by Sales
![Top 10 Customers](images/top_customers.png)

## Technologies
- Oracle 11g Express Edition  
- SQL  
- Excel / Google Sheets (for charts)

## How to Run
1. Run `create_tables.sql` to create tables  
2. Run `data_loading.sql` to import data  
3. Run `analysis_queries.sql` to generate insights  
4. Open charts in `images/` to view visualizations