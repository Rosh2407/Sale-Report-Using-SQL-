# 📊 Project 2: Sales Data Report and Trend Analysis (MySQL)

## ⭐ Project Goal

This project aims to analyze a comprehensive sales dataset to identify key business trends, evaluate product performance, and uncover areas for strategic improvement. The analysis was performed entirely using **MySQL** queries to aggregate, segment, and interpret the data.

## 📁 Dataset Details

The dataset used is a version of the popular **Superstore Sales Data**, containing transactional records across various products, regions, and customer segments.

* **File Used:** `superstore_dataset.csv`
* **Total Records:** 9,994
* **Key Columns:** `order_date`, `sales`, `profit`, `category`, `subcategory`, `region`, `segment`.
* **Tools Used:** MySQL Workbench / SQL Client for database management and querying.

## 🚀 Key Analytical Findings

The following insights were derived from the executed SQL queries.

### 1. Overall Performance Summary

| Metric | Result | Interpretation |
| :--- | :--- | :--- |
| **Total Sales** | 22,94,200.86 | Represents the overall revenue generated. |
| **Total Profit** | 2,86,397.02 | Indicates the total profit realized. |
| **Overall Profit Margin** | 12.47 % | The overall profitability rate of the business. |

### 2. Product Performance (Top and Bottom)

| Type | Subcategory | Metric (Sales/Profit) |
| :--- | :--- | :--- |
| **Top 5 by Sales** | Phones | 3,30,007.05 |
| | Chairs | 3,28,449.10 |
| | Storage |	2,23,843.61 |
| | Tables	| 2,06,965.53 |
| | Binders	| 2,03,412.73 |
| **Bottom 5 by Profit** | Tables | -17,725.48 |
| | Bookcases | 3,472.56 |
| | Supplies	| -1189.10 |
| | Fasteners	| 949.52 |
| | Machines | 	3,384.76 |

***Insight:*** 1. Focusing on the Loss Leaders (Highest Negative Profit)

The **Tables** subcategory represents a significant operational risk, resulting in a net loss of **17,725.48** across the dataset. This suggests immediate action is required to review pricing, manufacturing costs, or discount strategy for this product line.

2. Focusing on High Sales, Low Profit (Efficiency Problem)

A key efficiency finding is that the **Phones** subcategory, despite being a top revenue driver, contributes a disproportionately low amount of profit. This indicates that while customer demand is high, the profit margin is likely too thin, suggesting pricing needs to be adjusted or costs need to be streamlined."

3. Focusing on the Most Profitable Products

The **Machines** subcategory is the most profitable segment of the business, generating over **3,384.76** in profit. This area should be prioritized for increased marketing and investment.

### 3. Time Series Trends

The data shows a clear upward trend in both sales and profit over the four-year period.

| Year | Total Sales | Total Profit |
| :--- | :--- | :--- |
| **2019** | 4,84,247.50 | 49,543.97 |
| **2020** | 4,70,532.51 | 61,618.60 |
| **2021** | 6,09,205.60 | 81,795.17 |
| **2022** | 7,33,215.26 | 93,439.27 |

### 4. Regional Profitability (Efficiency)

| Region | Total Sales | Total Profit | Profit Margin % |
| :--- | :--- | :--- | :--- |
| **West** | 7,25,457.82 | 1,08,418.45 | 14.94 % |
| **East** | 6,78,781.24 | 91,522.78 | 13.48 % |
| **South** | 3,91,721.91 | 46,749.43 | 11.93 % |
| **Central** | 5,01,239.89 | 39,706.36 | 7.92 % |

***Insight:*** 
Although the West region yielded the highest absolute total profit, the East region was more efficient, generating a higher profit margin. This suggests a strategic focus on expanding high-margin, smaller-market operations could improve overall company profitability.

## 💻 SQL Queries 

The following are examples of the analytical queries used in this project.

### A. Profitability Analysis by Segment

## 1. Write a MySQL query to find the Total Sales and Total Profit for each customer segment (Consumer, Corporate, Home Office). 

```sql
SELECT 
    segment, 
    ROUND(SUM(sales), 2) AS Total_Sales, 
    ROUND(SUM(profit), 2) AS Total_Profit 
FROM 
    superstore_sales
GROUP BY 
    segment
ORDER BY 
    SUM(sales) DESC;
```

### B. Advanced Profitability and Efficiency

## 2. Write a MySQL query to find the Total Sales, Total Profit, and the Profit Margin Percentage for each region.

```sql
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
```

### C. Geographical Performance

## 3. write a MySQL query to find the Total Sales and Total Profit for each region.

```sql
select 
      region ,round(sum(sales),2) as Total_Sales,round(sum(profit),2) as Total_Profit 
from 
    superstore_sales
group by
        region
order by
        sum(profit) desc;
```

### D. Time-Series Trend Analysis

## 4. write a MySQL query to find the Total Sales and Total Profit for each year in the dataset.

```sql
select 
      year(order_date) as Order_Year, round(sum(sales),2) as Total_Sales, round(sum(profit),2) as Total_Profit 
from 
    superstore_sales
group by
        year(order_date)
order by 
	    year(order_date) asc;
```

### E. Profitability Analysis

## 5. write a MySQL query to identify the Bottom 5 subcategory by Total Profit.

```sql
select 
	 subcategory, round(sum(profit),2) as Total_Profit 
from 
    superstore_sales 
group by 
        subcategory 
order by 
        sum(profit) asc 
limit 5;
```

### F. Product Performance

## 6.  Write a MySQL query to find the Top 5 subcategory by Total Sales.

``` sql
select 
      subcategory, round(sum(sales),2) as Total_Sales 
from 
    superstore_sales 
group by 
       subcategory 
order by 
        sum(sales) desc 
limit 5;
```

### G. Overall Performance

## 7. Write a MySQL query to calculate the Total Sales, Total Profit, Overall Profit Margin Percentage 

```sql
select 
      round(sum(sales),2) as Total_Sales, 
      round(sum(profit),2) as Total_Profit, 
      round((sum(profit) / sum(sales)) * 100,2) as  "Overall Profit Margin Perfcentage"
from 
superstore_sales;
```

## 🎯 Conclusion and Recommendations

**1. Executive Summary**

The comprehensive analysis of the sales data successfully identified critical performance metrics, temporal trends, and operational efficiencies across various product lines and geographical regions. Overall, the business demonstrates a healthy upward trajectory in revenue, but profitability is severely hindered by specific product and regional inefficiencies.

**2. Key Findings**

Financial Growth: The company is experiencing robust growth, with a consistent year-over-year increase in both Total Sales and Total Profit, culminating in a cumulative revenue of approximately **22,94,200.86** over the period.

Critical Profitability Issues: A major finding is the presence of high-volume, low-margin products. The **Tables** subcategory, despite being a top-ranking revenue contributor, is the largest loss leader (net loss of **17,725.48** ), indicating that current pricing, discounting, or cost structures are unsustainable.

Operational Excellence: The geographical analysis revealed a disparity between total profit and operational efficiency. While the **West** region delivered the highest absolute profit, the **West** demonstrated superior operational efficiency with the highest Profit Margin Percentage **(14.94%)**.

Customer Focus: The **Consumer** segment drives the largest portion of sales revenue, affirming its role as the primary market focus.

**3. Actionable Recommendations**

Based on the data-driven insights, the following strategic recommendations are proposed:

Profit Margin Intervention for Loss Leaders:

Action: Immediately review and reformulate the pricing and discount policies for the Binders and Tables subcategories to eliminate current losses.

Goal: Shift these products from loss leaders to at least break-even within the next quarter.

Investigate Central Region Inefficiency:

Action: Conduct a deep dive into the operational costs and competitive pricing environment of the Central region, which exhibits the lowest profit margin **(7.92%)**.

Goal: Identify whether higher freight costs, excessive local discounting, or different competitive pressures are suppressing profitability.

Replicate High-Efficiency Strategies:

Action: Study the sales and supply chain practices of the most efficient region and implement successful strategies in the less efficient regions.

Goal: Boost the overall company Profit Margin Percentage by improving efficiency company-wide.

In summary, the business is growing, but targeted strategic interventions in product pricing and regional cost management are essential to maximize profitability and realize the full potential of its sales revenue.
