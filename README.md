# Kultra Mega Stores Inventory

This repository presents a collection of SQL Project and queries that demonstrate my skills in extracting insights from data, designing databases and crafting efficient queries.

## Project Name: Kultra Mega Stores Inventory (KMS) Dta Analysis Project

### Project Overview
This project aim to provide actionable insights and support KMS in making informed business decisions and driving growth by analyzing sales data to identify top performing product categories, regions and customers. It also provide recommendations to increase revenue from low performing customers and evaluate shipping costs and methods. 

### Data Source
The primary source data used is KMS Sql case study.csv downloaded from LMS data profile.

### Tools and Techniques
The project utilized SQL queries to analyze data

### Exploratory Data Analysis
The dataset give answers to some questions such as;
- what product category has the highest sales
- what shipping method incurred the most cost
- what regions has the most sales and least sales
- who are the most valuable customers and what products do they purchased

### Data Analysis
Some basic lines of queries are used during my analysis
``` SQL
SELECT top 1 Product_Category, SUM(Sales) AS
TotalSales
from KMS_Case_Study
group by Product_Category
order by TotalSales desc
```
### Recommendations
1. To increase revenue from the bottom 10 customers, KMS could consider implementing the following strategies;
- Tailor promotions and offers to individual customer preferences.
- Develop and implement loyalty programs or reward that will keep customers coming back.
- Leaverage data-driven insights to understand what customers like and show them relevant offers.
- Enhance customer service and support to foster loyalty and satisfaction.

2. Based on the data analyzed, the company's shipping cost spending does not aligned with the order priority, as they are not using the fastest shipping method (Express Air) more frequently for critical and high priority orders.




