USE zepto_db;

-- 1. Check the total number of products
SELECT COUNT(*) AS total_products
FROM zepto_v2;

-- 2. Display sample records
SELECT *
FROM zepto_v2
LIMIT 10;

-- 3. Check available product categories
SELECT DISTINCT Category
FROM zepto_v2
ORDER BY Category;

-- 4. Check products that are out of stock
SELECT COUNT(*) AS out_of_stock_products
FROM zepto_v2
WHERE outOfStock = 'True';
