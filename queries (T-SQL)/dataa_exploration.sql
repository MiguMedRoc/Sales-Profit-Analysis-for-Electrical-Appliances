-- 1. Total Records
SELECT COUNT(*) AS Total_Recorrds
FROM dbo.Sales_Profit

-- 2. Number of unique products
SELECT COUNT(DISTINCT Product_Name) AS Unique_Products
FROM dbo.Sales_Profit

-- 3. Total Sales per year
SELECT YEAR(CONVERT(date, Order_Date, 101)) AS Año,
       COUNT(*) AS Total_Sales
FROM dbo.Sales_Profit
GROUP BY YEAR(CONVERT(date, Order_Date, 101))
ORDER BY Año;

-- 4. Total sales per region
SELECT Region, COUNT(*) AS Total_Sales
FROM dbo.Sales_Profit
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 5. Producto más vendido (por cantidad)
SELECT TOP 1 Product_Name,
       SUM(Order_Qty) AS Total_Qty
FROM dbo.Sales_Profit
GROUP BY Product_Name
ORDER BY Total_Qty DESC;

-- 6. Porduct with the highest sales
SELECT TOP 1 Product_Name,
       SUM(Sales) AS Total_Sales
FROM dbo.Sales_Profit
GROUP BY Product_Name
ORDER BY Total_Sales DESC;

-- 7. Total sales and profit
SELECT SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM dbo.Sales_Profit
