-- 1 Find warehouses with highest average delivery time (delay issue)
SELECT 
    Warehouse_ID,
    ROUND(AVG(Total_Delivery_Time), 2) AS avg_delivery_time
FROM
    supply_data
GROUP BY Warehouse_ID
ORDER BY avg_delivery_time DESC;


-- 2 Calculate delivery delay rate using Delivery_Delay_Flag
SELECT 
    Warehouse_ID,
    COUNT(CASE WHEN Delivery_Delay_Flag = 'Delayed' THEN 1 END) * 100.0 / COUNT(*) AS delay_percentage
FROM supply_data
GROUP BY Warehouse_ID
ORDER BY delay_percentage DESC;



-- 3 Identify slow shipping routes (shipping time impact)
SELECT 
    Location,
    ROUND(AVG(Shipping_Time_Days), 2) AS avg_shipping_time
FROM
    supply_data
GROUP BY Location
ORDER BY avg_shipping_time DESC;


-- 4 Find inventory imbalance (stock vs demand)
SELECT 
    Warehouse_ID,
    Product_Category,
    SUM(Current_Stock - Demand_Forecast) AS inventory_gap
FROM
    supply_data
GROUP BY Warehouse_ID , Product_Category
ORDER BY inventory_gap DESC;


-- 5 Identify warehouses with high stockout risk
SELECT 
    Warehouse_ID, AVG(Stockout_Risk) AS avg_stockout_risk
FROM
    supply_data
GROUP BY Warehouse_ID
ORDER BY avg_stockout_risk DESC;


-- 6 Find products frequently backordered
SELECT 
    Product_Category,
    SUM(Backorder_Quantity) AS total_backorders
FROM
    supply_data
GROUP BY Product_Category
ORDER BY total_backorders DESC;


-- 7 Analyze demand trend (monthly sales proxy)
SELECT 
    Product_Category, SUM(Monthly_Sales) AS total_sales
FROM
    supply_data
GROUP BY Product_Category
ORDER BY total_sales DESC;


-- 8 Identify high lead time suppliers (delay root cause)
SELECT 
    Supplier_ID, ROUND(AVG(Lead_Time_Days), 2) AS avg_lead_time
FROM
    supply_data
GROUP BY Supplier_ID
ORDER BY avg_lead_time DESC;


-- 9 Calculate total logistics cost by warehouse
SELECT 
    Warehouse_ID, SUM(Logistics_Cost) AS total_logistics_cost
FROM
    supply_data
GROUP BY Warehouse_ID
ORDER BY total_logistics_cost DESC;


-- 10 Analyze delivery efficiency across warehouses
SELECT 
    Warehouse_ID,
    ROUND(AVG(Delivery_Efficiency), 2) AS avg_efficiency
FROM
    supply_data
GROUP BY Warehouse_ID
ORDER BY avg_efficiency ASC;


-- 11 Customer satisfaction vs delivery performance
SELECT 
    Warehouse_ID,
    ROUND(AVG(Customer_Rating), 2) AS avg_rating,
    ROUND(AVG(Total_Delivery_Time), 2) AS avg_delivery_time
FROM
    supply_data
GROUP BY Warehouse_ID
ORDER BY avg_delivery_time DESC;