CREATE DATABASE SalesAnalysis;
USE SalesAnalysis;
DESCRIBE salesanalysis.supermarketanalysis;
SELECT * FROM supermarketanalysis;

/* TO change the column name */
ALTER TABLE supermarketanalysis CHANGE `ï»¿Invoice ID` `InvoiceID` varchar(50);

/* To change the data type of each column to appropiate type */
ALTER TABLE supermarketanalysis
MODIFY COLUMN Branch varchar(50);

ALTER TABLE supermarketanalysis
MODIFY COLUMN City varchar(50);

ALTER TABLE supermarketanalysis
MODIFY COLUMN `Customer type`  varchar(50);

ALTER TABLE supermarketanalysis
MODIFY COLUMN Gender varchar(50);

ALTER TABLE supermarketanalysis
MODIFY COLUMN `Product line` varchar(50);

ALTER TABLE supermarketanalysis
MODIFY COLUMN `Unit price` varchar(50);

ALTER TABLE supermarketanalysis
MODIFY COLUMN Date date;

ALTER TABLE supermarketanalysis
MODIFY COLUMN Time time;

/* assigned primary key to a column InvoiceID */
ALTER TABLE supermarketanalysis
ADD PRIMARY KEY (InvoiceID);

/* 1. Total Sales */
SELECT SUM(Sales) TotalSales FROM supermarketanalysis;

/* 2. Total Sales by City */
SELECT City, SUM(Sales) TotalSales 
FROM  supermarketanalysis
GROUP BY City
ORDER BY TotalSales DESC;

/* 3. Calculate total sales for each branch */
SELECT Branch, SUM(Sales) TotalSales 
FROM  supermarketanalysis
GROUP BY Branch
ORDER BY TotalSales DESC;

/* 4.Get the average customer rating for each product line */
SELECT `Product line`, avg(sales) AverageSales
FROM supermarketanalysis
GROUP BY `Product line` 
ORDER BY AverageSales DESC;

/* 5. Calculate the total sales and total quantity sold for each product line */
SELECT `Product line`, SUM(sales) TotalSales, SUM(quantity) TotalQuantity
FROM supermarketanalysis
GROUP BY `Product line`
ORDER BY TotalSales DESC;

/* 6.Show sales trend over month */
SELECT MONTH(Date) month, SUM(Sales) MonthlySales
FROM supermarketanalysis
GROUP BY MONTH
ORDER BY month;

/* 7.Calculate gross income and gross margin percentage for each payment type */
SELECT `Payment`, 
    SUM(`gross income`) AS totalgrossincome, 
    AVG(`gross margin percentage`) AS avgeragegrossmarginpercentage
FROM supermarketanalysis
GROUP BY `Payment`
ORDER BY totalgrossincome DESC;

/* 8. Analyze total sales by gender */
SELECT Gender, SUM(`Sales`) AS total_sales
FROM supermarketanalysis
GROUP BY Gender
ORDER BY total_sales DESC;

/* 9. Analyze sales by time of day */
SELECT HOUR(time) Hour, SUM(sales) TotalSales
FROM supermarketanalysis
GROUP BY Hour
ORDER BY Hour;

/* 10. Analyze gross income based on customer type */
SELECT `Customer type`, SUM(`gross income`) TotalGrossIncome
FROM supermarketanalysis
GROUP BY `Customer type`
ORDER BY TotalGrossIncome DESC;

/* 11. Analyze total sales by gender*/
SELECT Gender, SUM(`Sales`) AS totalSales
FROM supermarketanalysis
GROUP BY Gender
ORDER BY totalSales DESC;

/* 12. The top 3 total sales of each product line within each customer type*/
SELECT  `product line`, `customer type`, sum(sales) TotalSales,
RANK() OVER(PARTITION BY `customer type` ORDER BY sum(sales) DESC) SalesRank
FROM supermarketanalysis
GROUP BY `product line`, `customer type`
ORDER BY SalesRank;

/* 13. Calculates monthly sales and the percentage change from the previous month*/
WITH MonthlySales as (
SELECT DATE_FORMAT(Date,'%Y-%m') Month, sum(sales) TotalSales
FROM supermarketanalysis
GROUP BY Month),
PreviousMonthSales as(
SELECT Month, TotalSales, LAG(TotalSales) OVER(ORDER BY Month ) PreviousMonthSale
FROM MonthlySales)
SELECT Month, TotalSales,PreviousMonthSale, ROUND(((TotalSales-PreviousMonthSale)/PreviousMonthSale)*100,2) AS MonthOverMonthPercentage
FROM PreviousMonthSales;

/* 14. Find the top selling product line in each city*/
WITH CitySales AS(
SELECT City, `product line`, sum(sales) TotalSales
FROM supermarketanalysis
GROUP BY City, `product line`
ORDER BY City),
CitySalesRank AS(
SELECT City, `product line`, TotalSales, RANK() OVER(PARTITION BY City ORDER BY TotalSales) CityRank
FROM CitySales
)
SELECT City, `product line`, TotalSales FROM CitySalesRank
WHERE CityRank=1;

/* Analyze the contribution of each customer type to the total sales, both in absolute values and percentages*/
WITH OverallSales as(
SELECT SUM(sales) TotalSales
FROM supermarketanalysis
),
CustomerContribution as(
SELECT `Customer type`, SUM(`Sales`) AS total_sales, ROUND((SUM(`Sales`)/(SELECT TotalSales FROM OverallSales))*100,2) AS contribution_percentage
FROM supermarketanalysis
GROUP BY `Customer type`)
SELECT * FROM CustomerContribution;

/* 15.calculates the cumulative sales over time */
WITH DailySales as(
SELECT Date, SUM(Sales) AS TotalSale
FROM supermarketanalysis
GROUP BY Date
ORDER BY Date),
CumulativeSales as(
SELECT  Date, SUM(Sales) OVER( ORDER BY Date) CumulativeSales
FROM supermarketanalysis)
SELECT ds.Date, ds.TotalSale, cs.CumulativeSales FROM CumulativeSales cs
INNER JOIN DailySales ds ON cs.Date=ds.Date;


