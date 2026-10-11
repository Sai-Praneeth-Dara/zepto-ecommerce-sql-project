
USE zepto_db;

-- 1. Top 10 products with the highest discounts
SELECT name, Category, mrp, discountedSellingPrice, discountPercent
FROM zepto_v2
ORDER BY discountPercent DESC
LIMIT 10;

-- 2. High-MRP products that are out of stock
SELECT name, Category, mrp
FROM zepto_v2
WHERE outOfStock = 'True'
ORDER BY mrp DESC
LIMIT 10;

-- 3. Average discount by category
SELECT Category,
       ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto_v2
GROUP BY Category
ORDER BY avg_discount DESC;

-- 4. Products with MRP greater than ₹500 and discount below 10%
SELECT name, Category, mrp, discountPercent
FROM zepto_v2
WHERE mrp > 500
  AND discountPercent < 10
ORDER BY mrp DESC;

-- 5. Count products in each category
SELECT Category, COUNT(*) AS total_products
FROM zepto_v2
GROUP BY Category
ORDER BY total_products DESC;
