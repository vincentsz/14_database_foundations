--  Make any changes needed to avoid the error message encountered in #6.

SELECT * FROM orders;

DELETE FROM orders 
WHERE product_id IS NULL;

ALTER TABLE orders
ALTER COLUMN product_id
SET NOT NULL;