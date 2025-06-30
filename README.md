# Kultra Mega Stores Inventory

This repository presents a collection of SQL Project and queries that demonstrate my skills in extracting insights from data, designing databases and crafting efficient queries.

## Project Name: Kultra Mega Stores Inventory (KMS) Data Analysis Project

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
**Insight:** Identifies the product category with highest sales. 

2. Top 3 sales and Bottom regions in terms of sales
```SQL
SELECT top 3 Region, SUM(Sales) AS
TotalSales
from KMS_Case_Study
group by Region
order by TotalSales desc
```
```SQL
SELECT top 3 Region, SUM(Sales) AS
TotalSales
from KMS_Case_Study
group by Region
order by TotalSales asc
```
**Insight:** Identifies top and bottom geographical regions for expansion or strategy improvement.

3. Total sales of appliances in Ontario
```SQL
SELECT SUM(Sales) AS
AppliancesSalesOntario
from KMS_Case_Study
where Region = 'Ontario'
```
**Insight:** Helps evaluate regional product performance assessment in a specific region.

4. Bottom 10 customers
```SQL
SELECT top 10 Customer_Name, SUM(Sales) AS
TotalSales
from KMS_Case_Study
group by Customer_Name
order by TotalSales asc
```
**Insight:** Identifies customers with least sales.

5. Most shiping cost
```SQL
SELECT top 1 Ship_Mode, SUM(Shipping_Cost) AS
TotalShippingCost
from KMS_Case_Study
group by Ship_Mode
order by TotalShippingCost desc
```
**Insight:** Optimize logistics and renegotiate contracts with shipping partners if needed.

6. Top customers and product purchased
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
**Insight:** Identifies the top 10 customers by total sales and analyze their purchasing behavior.

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
**Insight:** Monitor high-return customers and understand reasons (product quality, delivery issues)

10. Customer that return sales 
```SQL
select * from (
    select Order_ID, Customer_Name, Customer_Segment 
	       from KMS_Case_Study) As kMS
join (
    select Order_ID, Status
	    from Order_Status) as Ord
on KMS.Order_ID = Ord.Order_ID
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
### Analysis
Based on the data analyzed, Delivery Truck is consistently used the most across all priorities, and even slightly more for critical than for low. This is counterintuitive because critical orders should prioritize speed over cost.
Express Air, the fastest and most expensive method, is used almost equally across all priorities. This suggests no adjustment for urgency, which is inappropriate. We'd expect much higher usage for critical orders and much lower for low-priority.
Regular Air shows similarly small variation and is actually used more for low priority than for critical.
In conclusion, the data shows that the company’s shipping method choices do not reflect the urgency of the order priorities. Use of Express Air does not increase for higher-priority orders, and Delivery Truck is used most often, even for critical orders.


### Recommendations
1. To increase revenue from the bottom 10 customers, KMS could consider implementing the following strategies;
- Tailor promotions and offers to individual customer preferences.
- Develop and implement loyalty programs or reward that will keep customers coming back.
- Leaverage data-driven insights to understand what customers like and show them relevant offers.
- Enhance customer service and support to foster loyalty and satisfaction.

2. The company should reassess its logistics strategy and better align shipping methods with order urgency to balance cost and service quality effectively.




