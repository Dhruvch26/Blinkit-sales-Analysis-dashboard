
-- ====================================================
-- BLINKIT SALES ANALYSIS USING SQL
-- ====================================================

-- 1. TOTAL SALES PERFORMANCE
SELECT 
    SUM(Sales) AS total_sales,
    AVG(Sales) AS average_sales,
    MAX(Sales) AS highest_sale
FROM blinkit_sales;


-- 2. TOP 10 BEST SELLING PRODUCT CATEGORIES
SELECT 
    Item_Type,
    SUM(Sales) AS total_sales
FROM blinkit_sales
GROUP BY Item_Type
ORDER BY total_sales DESC
LIMIT 10;


-- 3. SALES DISTRIBUTION BY OUTLET LOCATION
SELECT 
    Outlet_Location_Type,
    COUNT(*) AS total_products,
    SUM(Sales) AS total_sales
FROM blinkit_sales
GROUP BY Outlet_Location_Type
ORDER BY total_sales DESC;


-- 4. OUTLET TYPE PERFORMANCE ANALYSIS
SELECT 
    Outlet_Type,
    COUNT(Item_Identifier) AS total_items,
    SUM(Sales) AS total_sales,
    AVG(Sales) AS avg_sales_per_item
FROM blinkit_sales
GROUP BY Outlet_Type
ORDER BY total_sales DESC;


-- 5. PRODUCT FAT CONTENT DEMAND ANALYSIS
SELECT 
    Item_Fat_Content,
    COUNT(*) AS number_of_products,
    SUM(Sales) AS total_sales
FROM blinkit_sales
GROUP BY Item_Fat_Content
ORDER BY total_sales DESC;


-- 6. SALES PERFORMANCE BY OUTLET ESTABLISHMENT YEAR
SELECT 
    Outlet_Establishment_Year,
    SUM(Sales) AS yearly_sales
FROM blinkit_sales
GROUP BY Outlet_Establishment_Year
ORDER BY yearly_sales DESC;


-- 7. HIGH PERFORMING PRODUCTS BASED ON CUSTOMER RATING
SELECT 
    Item_Type,
    AVG(Rating) AS avg_rating,
    SUM(Sales) AS total_sales
FROM blinkit_sales
GROUP BY Item_Type
HAVING AVG(Rating) > 4
ORDER BY avg_rating DESC;


-- 8. IDENTIFY LOW VISIBILITY BUT HIGH SALES PRODUCTS
SELECT 
    Item_Type,
    AVG(Item_Visibility) AS avg_visibility,
    SUM(Sales) AS total_sales
FROM blinkit_sales
GROUP BY Item_Type
ORDER BY total_sales DESC;


-- 9. SALES CONTRIBUTION BY OUTLET SIZE
SELECT 
    Outlet_Size,
    SUM(Sales) AS total_sales,
    AVG(Sales) AS avg_sales
FROM blinkit_sales
GROUP BY Outlet_Size
ORDER BY total_sales DESC;


-- 10. PRODUCT DEMAND SEGMENTATION
SELECT 
    Item_Type,
    CASE
        WHEN SUM(Sales) > 150000 THEN 'High Demand'
        WHEN SUM(Sales) BETWEEN 80000 AND 150000 THEN 'Medium Demand'
        ELSE 'Low Demand'
    END AS demand_category,
    SUM(Sales) AS total_sales
FROM blinkit_sales
GROUP BY Item_Type
ORDER BY total_sales DESC;
