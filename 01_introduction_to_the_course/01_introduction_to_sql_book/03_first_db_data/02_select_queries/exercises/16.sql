/* Write a query that returns the customer name from any order which does not include a drink item */
SELECT customer_name
FROM orders
WHERE drink IS NULL;