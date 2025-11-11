--Counting Duplicates--
SELECT [Order_ID], [Order_Date], [Unit_Cost], [Price], [Order_Qty],
       [Cost_of_Sales], [Sales], [Profit], [Channel], [Promotion_Name],
       [Product_Name], [Manufacturer], [Product_Sub_Category],
       [Product_Category], [Region], [City], [Country],
       COUNT(*) AS repeated

FROM dbo.Sales_Profit

GROUP BY [Order_ID], [Order_Date], [Unit_Cost], [Price], [Order_Qty],
       [Cost_of_Sales], [Sales], [Profit], [Channel], [Promotion_Name],
       [Product_Name], [Manufacturer], [Product_Sub_Category],
       [Product_Category], [Region], [City], [Country]

HAVING COUNT(*) > 1;

--Counting NULL values--
SELECT *
FROM dbo.Sales_Profit
WHERE [Order_ID] IS NULL
   OR [Order_Date] IS NULL
   OR [Unit_Cost] IS NULL
   OR [Price] IS NULL
   OR [Order_Qty] IS NULL
   OR [Cost_of_Sales] IS NULL
   OR [Sales] IS NULL
   OR [Profit] IS NULL
   OR [Channel] IS NULL
   OR [Promotion_Name] IS NULL
   OR [Product_Name] IS NULL
   OR [Manufacturer] IS NULL
   OR [Product_Sub_Category] IS NULL
   OR [Product_Category] IS NULL
   OR [Region] IS NULL
   OR [City] IS NULL
   OR [Country] IS NULL;

--Verifying dates out of range--
SELECT *
FROM dbo.Sales_Profit
WHERE Order_Date > CAST(GETDATE() AS DATE);

SELECT *
FROM dbo.Sales_Profit
WHERE YEAR(CONVERT(date, Order_Date, 101)) > 2019
