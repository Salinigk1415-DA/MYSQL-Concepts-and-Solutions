USE ECommerceDB;

-- ORDER BY & LIMIT
SELECT product_id, product_name, price
FROM Product
ORDER BY price DESC
LIMIT 3;

-- Aggregate Functions
SELECT 
    COUNT(*) AS total_sales_records,
    SUM(sale_amount) AS total_sales_amount,
    AVG(sale_amount) AS average_sale_amount,
    MAX(sale_amount) AS highest_sale_amount,
    MIN(sale_amount) AS lowest_sale_amount
FROM Sales;

--  GROUP BY & HAVING
SELECT 
    p.product_id,
    p.product_name,
    SUM(s.sale_amount) AS total_sales
FROM Product p
JOIN Sales s
ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(s.sale_amount) > 100;

--  Window Functions

SELECT 
    product_id,
    product_name,
    price,
    RANK() OVER (ORDER BY price DESC) AS product_rank
FROM Product;

