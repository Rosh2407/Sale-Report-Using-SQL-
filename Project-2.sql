create database sales_data_report;

use sales_data_report;

USE sales_data_report; -- Or your specific database name

CREATE TABLE superstore_sales (
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    customer VARCHAR(255),
    manufactory VARCHAR(255),
    product_name VARCHAR(255),
    segment VARCHAR(255),
    category VARCHAR(255),
    subcategory VARCHAR(255),
    region VARCHAR(50),
    zip INT,
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    discount DECIMAL(10, 4),
    profit DECIMAL(10, 4),
    quantity INT,
    sales DECIMAL(10, 4),
    profit_margin DECIMAL(10, 4)
);

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/superstore_dataset.csv'
INTO TABLE superstore_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(order_id, @vorder_date, @vship_date, customer, manufactory, product_name, segment, category, subcategory, region, zip, city, state, country, discount, profit, quantity, sales, profit_margin)
SET
    order_date = STR_TO_DATE(@vorder_date, '%m/%d/%Y'),
    ship_date = STR_TO_DATE(@vship_date, '%m/%d/%Y');
    
select * from superstore_sales;

 /* write a MySQL query to calculate the:Total Sales, Total Profit, Overall Profit Margin Percentage */
select 
      round(sum(sales),2) as Total_Sales, 
      round(sum(profit),2) as Total_Profit, 
      round((sum(profit) / sum(sales)) * 100,2) as  "Overall Profit Margin Perfcentage"
from 
superstore_sales;

/* write a MySQL query to find the:
Top 5 subcategory by Total Sales.*/

select 
      subcategory, round(sum(sales),2) as Total_Sales 
from 
    superstore_sales 
group by 
       subcategory 
order by 
        sum(sales) desc 
limit 5;

/* Question 3: Profitability Analysis
Sales volume is important, but profit is what drives the business. Sometimes, high-volume products are not the most profitable. 
write a MySQL query to identify the:
Bottom 5 subcategory by Total Profit.*/

select 
	 subcategory, round(sum(profit),2) as Total_Profit 
from 
    superstore_sales 
group by 
        subcategory 
order by 
        sum(profit) asc 
limit 5;

/* Question 4: Time-Series Trend Analysis
A key part of any sales report is analyzing performance over time to identify growth, decline, and seasonality.
write a MySQL query to find the:
Total Sales and Total Profit for each year in the dataset.*/

select 
      year(order_date) as Order_Year, round(sum(sales),2) as Total_Sales, round(sum(profit),2) as Total_Profit 
from 
    superstore_sales
group by
        year(order_date)
order by 
	    year(order_date) asc;
        
/*Question 5: Geographical Performance
Now let's examine sales performance geographically. 
Regional analysis is crucial for identifying areas that are succeeding and those that might need additional resources or strategic adjustment.
write a MySQL query to find the:
Total Sales and Total Profit for each region.*/

select 
      region ,round(sum(sales),2) as Total_Sales,round(sum(profit),2) as Total_Profit 
from 
    superstore_sales
group by
        region
order by sum(profit) desc;

/*Question 6: Advanced Profitability and Efficiency
Sometimes, a region with low sales might be highly efficient (high profit margin), and a region with high sales might be inefficient (low profit margin). 
This is a crucial metric for operational review.
write a MySQL query to find the:
Total Sales, Total Profit, and the Profit Margin Percentage for each region.
*/

select 
	  region,
      round(sum(sales),2) as Total_Sales, 
      round(sum(profit),2) as Total_Profit, 
      round((sum(profit) / sum(sales)) * 100,2) as  "Profit Margin Percentage"
from 
    superstore_sales
group by 
        region
order by 
        round((sum(profit) / sum(sales)) * 100,2) desc;
        
/* Question 7: Customer Segmentation
Now let's switch focus to your customers. Understanding which segments drive the most revenue and profit is key for targeted marketing and resource allocation.
write a MySQL query to find the:
Total Sales and Total Profit for each customer segment (Consumer, Corporate, Home Office). */

select 
      segment, round(sum(sales),2) as Total_sales, round(sum(profit),2) as Total_Profit 
from 
    superstore_sales
group by 
        segment
order by
		sum(sales) desc;