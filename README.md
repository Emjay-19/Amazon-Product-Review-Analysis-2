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
1. Product category with highest sales
``` SQL
SELECT top 1 Product_Category, SUM(Sales) AS
TotalSales
from KMS_Case_Study
group by Product_Category
order by TotalSales desc
```
2a. Top 3 sales
```SQL
SELECT top 3 Region, SUM(Sales) AS
TotalSales
from KMS_Case_Study
group by Region
order by TotalSales desc
```
2b. Bottom 3 sales
```SQL
SELECT top 3 Region, SUM(Sales) AS
TotalSales
from KMS_Case_Study
group by Region
order by TotalSales asc
```
3. Total sales of appliances in Ontario
```SQL
SELECT SUM(Sales) AS
AppliancesSalesOntario
from KMS_Case_Study
where Region = 'Ontario'
```
4. Bottom 10 customers
```SQL
SELECT top 10 Customer_Name, SUM(Sales) AS
TotalSales
from KMS_Case_Study
group by Customer_Name
order by TotalSales asc
```
5. Most shiping cost
```SQL
SELECT top 1 Ship_Mode, SUM(Shipping_Cost) AS
TotalShippingCost
from KMS_Case_Study
group by Ship_Mode
order by TotalShippingCost desc
```
6. TOP CUSTOMERS and product purchased
```SQL
SELECT top 5 Customer_Name, SUM(Sales) AS
TotalSales
from KMS_Case_Study
group by Customer_Name
order by TotalSales desc
```
```SQL
select Customer_Name, Product_Category from KMS_Case_Study
where Customer_Name in (select top 5 Customer_Name from KMS_Case_Study 
group by Customer_Name order by SUM(Sales) desc)
group by Customer_Name, Product_Category
order by Customer_Name, SUM(Sales) desc;
```
```SQL
SELECT top 5 Product_Name, count (*) AS
PurchaseCount
from KMS_Case_Study
group by Product_Name
order by PurchaseCount desc
```
7. Small business customer with highest sales
```SQL
SELECT top 1 Customer_Name, SUM(Sales) AS
TotalSales
from KMS_Case_Study
where Customer_Segment = 'Small Business'
group by Customer_Name
order by TotalSales desc
```
8. Corporate customer with most orders in 2009-2012
```SQL
SELECT top 1 Customer_Name, count(distinct Order_ID) AS
OrderCount
from KMS_Case_Study
where Customer_Segment = 'Corporate'
group by Customer_Name
order by OrderCount desc
```
9. The most profitable consumer customer
```SQL
SELECT top 1 Customer_Name, sum(Profit) AS
TotalProfit
from KMS_Case_Study
where Customer_Segment = 'Consumer'
group by Customer_Name
order by TotalProfit desc
```
10. Customer that return sales 
```SQL
select Customer_Name, Customer_Segment 
from KMS_Case_Study
where Product_Name = 'Returned'
group by Customer_Name, Customer_Segment
```

11. Order priority and shipping method
```SQL
select Order_Priority, Ship_Mode,
avg(Shipping_Cost) as AvgShippingCost
from KMS_Case_Study
group by Order_Priority, Ship_Mode
order by Order_Priority,
AvgShippingCost desc
```

### Recommendations
1. To increase revenue from the bottom 10 customers, KMS could consider implementing the following strategies;
- Tailor promotions and offers to individual customer preferences.
- Develop and implement loyalty programs or reward that will keep customers coming back.
- Leaverage data-driven insights to understand what customers like and show them relevant offers.
- Enhance customer service and support to foster loyalty and satisfaction.

2. Based on the data analyzed, the company's shipping cost spending does not aligned with the order priority, as they are not using the fastest shipping method (Express Air) more frequently for critical and high priority orders.




