# An inventory management system solution designed to track, manage, and optimize stock levels.
Features:
Demand forecasting based on historical sales and trends
Restocking alerts to prevent stockouts or overstocking
Batch and expiry tracking for perishable goods


Quick Reports SQL Queries

## 1. Top Selling Product

```sql
SELECT p.Product_Name, SUM(o.Order_Quantity) AS Total_Sold
FROM Orders o
JOIN Products p ON o.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY Total_Sold DESC
FETCH FIRST 1 ROWS ONLY;
```

## 2. Top Selling Product of the Month
Replace 7 with the desired month number. Example below uses July (7th month).

```sql
SELECT p.Product_Name, SUM(o.Order_Quantity) AS Total_Sold
FROM Orders o
JOIN Products p ON o.Product_ID = p.Product_ID
WHERE EXTRACT(MONTH FROM o.Order_Date) = 7
GROUP BY p.Product_Name
ORDER BY Total_Sold DESC
FETCH FIRST 1 ROWS ONLY;
```

## 3. Most Ordered Product in Each Category

```sql
SELECT
    p.Product_Category,
    p.Product_Name,
    SUM(o.Order_Quantity) AS Total_Ordered
FROM
    Products p
    JOIN Orders o ON p.Product_ID = o.Product_ID
GROUP BY
    p.Product_Category,
    p.Product_Name
ORDER BY
    p.Product_Category,
    Total_Ordered DESC;
```
```sql  
## 4. Average Order Value on Weekends and Weekdays

SELECT
    TO_CHAR(o.Order_Date, 'DD-MON-YYYY') AS Order_Date,
    CASE
        WHEN TO_CHAR(o.Order_Date, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH') IN ('SAT', 'SUN') THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_Type,
    ROUND(SUM(o.Order_Quantity * p.Price) / COUNT(o.Order_ID), 2) AS Average_Order_Value
FROM
    Orders o
    JOIN Products p ON o.Product_ID = p.Product_ID
GROUP BY
    o.Order_Date,
    CASE
        WHEN TO_CHAR(o.Order_Date, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH') IN ('SAT', 'SUN') THEN 'Weekend'
        ELSE 'Weekday'
    END
ORDER BY
    o.Order_Date;
```
