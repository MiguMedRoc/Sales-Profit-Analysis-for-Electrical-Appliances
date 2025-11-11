--Top 5 Products with the Highest Average Profit Margin--
SELECT TOP 5 Product_Name,
       AVG(Profit) AS Average_Profit
FROM dbo.Sales_Profit
GROUP BY [Product_Name]
ORDER BY Average_Profit DESC;


--Region with the Highest Total Sales in the Most Recent Year--
SELECT TOP 1 Region,
       SUM(Sales) AS Total_Revenue
FROM dbo.Sales_Profit
WHERE YEAR(CONVERT(date, Order_Date, 101)) = 
(
    SELECT MAX(YEAR(CONVERT(date, Order_Date, 101))) 
    FROM dbo.Sales_Profit
)
GROUP BY Region
ORDER BY Total_Revenue DESC;


--Product Category with the Highest Profit Margin (%)--
SELECT Product_Category,
       (SUM(Profit) / SUM(Sales)) * 100 AS Profit_Margin_Percent
FROM dbo.Sales_Profit
GROUP BY Product_Category
ORDER BY Profit_Margin_Percent DESC;


--Most Profitable Month per Year--
WITH MonthlyProfit AS (
    SELECT 
        YEAR(CONVERT(date, Order_Date, 101)) AS Year,
        MONTH(CONVERT(date, Order_Date, 101)) AS Month,
        SUM(Profit) AS Total_Profit,
        ROW_NUMBER() OVER (
            PARTITION BY YEAR(CONVERT(date, Order_Date, 101)) 
            ORDER BY SUM(Profit) DESC
        ) AS RankMonth
    FROM dbo.Sales_Profit
    GROUP BY YEAR(CONVERT(date, Order_Date, 101)), MONTH(CONVERT(date, Order_Date, 101))
)
SELECT 
    Year, 
    Month, 
    Total_Profit
FROM MonthlyProfit
WHERE RankMonth = 1
ORDER BY Year, Total_Profit DESC;


--Months With Financial Losses--
SELECT YEAR(CONVERT(date, Order_Date, 101)) AS Year,
       MONTH(CONVERT(date, Order_Date, 101)) AS Month,
       SUM(Profit) AS Monthly_Profit
FROM dbo.Sales_Profit
GROUP BY YEAR(CONVERT(date, Order_Date, 101)), MONTH(CONVERT(date, Order_Date, 101))
HAVING SUM(Profit) < 0
ORDER BY Year, Month;