-- 04_sanity_check.sql

-- ===========================================================
-- Example queries to verify data integrity and support Power BI DAX measures
-- ===========================================================

-- 1. Verify all sales have valid products
SELECT *
FROM sales s
LEFT JOIN products p ON s.product_id = p.product_id
WHERE p.product_id IS NULL;

-- 2. Verify all sales have valid agencies
SELECT *
FROM sales s
LEFT JOIN agencies a ON s.agency_id = a.agency_id
WHERE a.agency_id IS NULL;

-- 3. Total number of sales
SELECT COUNT(*) AS total_sales
FROM sales;

-- 4. Total net revenue
SELECT SUM(net_sales) AS total_net_revenue
FROM sales;

-- 5. Total claims
SELECT COUNT(*) AS total_claims
FROM sales
WHERE claim_status = 'Yes';

-- 6. Sample: number of sales per agency
SELECT a.agency_name, COUNT(s.sale_id) AS sales_count
FROM sales s
JOIN agencies a ON s.agency_id = a.agency_id
GROUP BY a.agency_name
ORDER BY sales_count DESC
LIMIT 5;
