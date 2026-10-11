
USE zepto_db;

-- 1. Check the current prices before conversion
SELECT name, mrp, discountedSellingPrice
FROM zepto_v2
LIMIT 10;

-- 2. Convert paise to rupees
-- IMPORTANT: Run this UPDATE only once.
UPDATE zepto_v2
SET mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0
WHERE id > 0;

-- 3. Verify the converted prices
SELECT name, mrp, discountedSellingPrice
FROM zepto_v2
LIMIT 10;
