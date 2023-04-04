/* Write a query that returns the three meal items for any order that includes both a side and a drink. */

SELECT burger, side, drink 
FROM orders
WHERE side IS NOT NULL
AND drink IS NOT NULL; 