-- To Create Database ECommerceDB
Create Database ECommerceDB;
Use ECommerceDB;

-- 1. Display unique product names from the Product table
SELECT DISTINCT product_name
FROM Product;

-- 2. Display product names with alias Product_Name
SELECT product_name AS Product_Name
FROM Product;

-- 3. Display unique product_id values from the Sales table
SELECT DISTINCT product_id
FROM Sales;

-- 4. Display product price with alias Product_Price
SELECT price AS Product_Price
FROM Product;

-- 5. Display products whose price is greater than 10,000
SELECT *
FROM Product
WHERE price > 10000;

-- 6. Show products whose price is less than 5,000
SELECT *
FROM Product
WHERE price < 5000;

-- 7. Display sales where quantity equals 2
SELECT *
FROM Sales
WHERE quantity = 2;

-- 8. Display products whose price is greater than or equal to 15,000
SELECT *
FROM Product
WHERE price >= 15000;

-- 9. Display sales where quantity is not equal to 5
SELECT *
FROM Sales
WHERE quantity <> 5;

-- 10. Display product name and price after 10% increase
SELECT product_name,
       price,
       price + (price * 0.10) AS Increased_Price
FROM Product;

-- 11. Display sale amount and sale amount after adding 500
SELECT sale_amount,
       sale_amount + 500 AS Updated_Amount
FROM Sales;

-- 12. Display products whose price is greater than 5,000 AND less than 50,000
SELECT *
FROM Product
WHERE price > 5000
AND price < 50000;

-- 13. Display sales where quantity is 2 OR 4
SELECT *
FROM Sales
WHERE quantity = 2
OR quantity = 4;

-- 14. Display products whose price is NOT greater than 20,000
SELECT *
FROM Product
WHERE NOT price > 20000;

-- 15. Display sales records where product_id is NULL
SELECT *
FROM Sales
WHERE product_id IS NULL;

-- 16. Display products where price is NOT NULL
SELECT *
FROM Product
WHERE price IS NOT NULL;

-- 17. Display products with product_id 1, 3, and 5
SELECT *
FROM Product
WHERE product_id IN (1, 3, 5);

-- 18. Display products whose product_id is NOT 2, 4, and 6
SELECT *
FROM Product
WHERE product_id NOT IN (2, 4, 6);

-- 19. Display products whose price is between 1,000 and 20,000
SELECT *
FROM Product
WHERE price BETWEEN 1000 AND 20000;

-- 20. Display products whose price is NOT between 5,000 and 50,000
SELECT *
FROM Product
WHERE price NOT BETWEEN 5000 AND 50000;

-- 21. Display products whose name starts with 'M'
SELECT *
FROM Product
WHERE product_name LIKE 'M%';

-- 22. Display products whose name ends with 'e'
SELECT *
FROM Product
WHERE product_name LIKE '%e';

-- 23. Display products whose name contains 'phone'
SELECT *
FROM Product
WHERE product_name LIKE '%phone%';

-- 24. Display products whose name does not start with 'S'
SELECT *
FROM Product
WHERE product_name NOT LIKE 'S%';

-- 25. Display products whose price is between 1,000 and 20,000
-- AND product name starts with 'M'
SELECT *
FROM Product
WHERE price BETWEEN 1000 AND 20000
AND product_name LIKE 'M%';

-- 26. Display sales where quantity is between 2 and 10
SELECT *
FROM Sales
WHERE quantity BETWEEN 2 AND 10;

-- 27. Display products whose product_id is in (1,2,3)
-- AND price greater than 5,000
SELECT *
FROM Product
WHERE product_id IN (1, 2, 3)
AND price > 5000;

-- 28. Display unique sale quantities from the Sales table
SELECT DISTINCT quantity
FROM Sales;