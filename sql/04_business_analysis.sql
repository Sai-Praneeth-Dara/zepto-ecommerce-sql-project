
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

-- Question 3: Estimate potential revenue by category
SELECT Category,
       SUM(discountedSellingPrice * availableQuantity)
           AS potential_revenue
FROM zepto_v2
GROUP BY Category
ORDER BY potential_revenue DESC;


-- Question 6: Find value-for-money products by price per gram
SELECT name,
       weightInGms,
       discountedSellingPrice,
       ROUND(discountedSellingPrice / weightInGms, 2)
           AS price_per_gram
FROM zepto_v2
WHERE weightInGms > 0
ORDER BY price_per_gram ASC
LIMIT 10;


-- Question 7: Group products by weight
SELECT name,
       weightInGms,
       CASE
           WHEN weightInGms < 1000 THEN 'Low'
           WHEN weightInGms <= 5000 THEN 'Medium'
           ELSE 'Bulk'
       END AS weight_category
FROM zepto_v2;


-- Question 8: Calculate total inventory weight by category
SELECT Category,
       SUM(weightInGms * availableQuantity)
           AS total_inventory_weight
FROM zepto_v2
GROUP BY Category
ORDER BY total_inventory_weight DESC;
