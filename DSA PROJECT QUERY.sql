SELECT * FROM dbo.KMS_Case_Study

---1. Product category with highest sales----
SELECT top 1 Product_Category, SUM(Sales) AS
TotalSales
from KMS_Case_Study
group by Product_Category
order by TotalSales desc

----2a. Top 3 sales---
SELECT top 3 Region, SUM(Sales) AS
TotalSales
from KMS_Case_Study
group by Region
order by TotalSales desc

----2b. Bottom 3 sales---
SELECT top 3 Region, SUM(Sales) AS
TotalSales
from KMS_Case_Study
group by Region
order by TotalSales asc

----3. Total sales of appliances in Ontario---
SELECT SUM(Sales) AS
AppliancesSalesOntario
from KMS_Case_Study
where Region = 'Ontario'

----4. Bottom 10 customers---
SELECT top 10 Customer_Name, SUM(Sales) AS
TotalSales
from KMS_Case_Study
group by Customer_Name
order by TotalSales asc

----5. Most shiping cost---
SELECT top 1 Ship_Mode, SUM(Shipping_Cost) AS
TotalShippingCost
from KMS_Case_Study
group by Ship_Mode
order by TotalShippingCost desc

---6. TOP CUSTOMERS and product purchased---
SELECT top 5 Customer_Name, SUM(Sales) AS
TotalSales
from KMS_Case_Study
group by Customer_Name
order by TotalSales desc

select Customer_Name, Product_Category from KMS_Case_Study
where Customer_Name in (select top 5 Customer_Name from KMS_Case_Study 
group by Customer_Name order by SUM(Sales) desc)
group by Customer_Name, Product_Category
order by Customer_Name, SUM(Sales) desc;

SELECT top 5 Product_Name, count (*) AS
PurchaseCount
from KMS_Case_Study
group by Product_Name
order by PurchaseCount desc

----7. Small business customer with highest sales
SELECT top 1 Customer_Name, SUM(Sales) AS
TotalSales
from KMS_Case_Study
where Customer_Segment = 'Small Business'
group by Customer_Name
order by TotalSales desc

----8. Corporate customer with most orders in 2009-2012
SELECT top 1 Customer_Name, count(distinct Order_ID) AS
OrderCount
from KMS_Case_Study
where Customer_Segment = 'Corporate'
group by Customer_Name
order by OrderCount desc

---9. The most profitable consumer customer
SELECT top 1 Customer_Name, sum(Profit) AS
TotalProfit
from KMS_Case_Study
where Customer_Segment = 'Consumer'
group by Customer_Name
order by TotalProfit desc

-----10. 
select Customer_Name, Customer_Segment 
from KMS_Case_Study
where Product_Name = 'Returned'
group by Customer_Name, Customer_Segment


----11. Order priority and shipping method
select Order_Priority, Ship_Mode,
avg(Shipping_Cost) as AvgShippingCost
from KMS_Case_Study
group by Order_Priority, Ship_Mode
order by Order_Priority,
AvgShippingCost desc



