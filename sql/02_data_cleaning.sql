USE zepto_db;

-- 1. Check for products with zero MRP
SELECT *
FROM zepto_v2
WHERE mrp = 0;

-- 2. Check for products with zero discounted selling price
SELECT *
FROM zepto_v2
WHERE discountedSellingPrice = 0;

-- 3. Check for missing product names
SELECT *
FROM zepto_v2
WHERE name IS NULL
   OR TRIM(name) = '';

-- 4. Check for duplicate product names
SELECT name, COUNT(*) AS product_count
FROM zepto_v2
GROUP BY name
HAVING COUNT(*) > 1;
