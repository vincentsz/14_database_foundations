/* Write a query that returns the three meal items for any order which does not include fries */
SELECT burger, side, drink
FROM orders
WHERE side <> 'Fries'
OR side IS NULL;