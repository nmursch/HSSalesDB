CREATE INDEX customer_sales_product
ON sales(customer_id, product_id);

CREATE VIEW sales_summary
AS
SELECT
    p.model AS model,
    SUM(sales.quantity) AS total_sold
    FROM sales
JOIN products p ON sales.product_id = p.product_id
GROUP BY p.model
ORDER BY total_sold DESC;

SELECT * FROM sales_summary;
