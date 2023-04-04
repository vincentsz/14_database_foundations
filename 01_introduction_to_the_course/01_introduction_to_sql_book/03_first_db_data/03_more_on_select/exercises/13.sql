-- Write a query that returns the cost of the cheapest side ordered

SELECT min(side_cost)
FROM orders
WHERE side IS NOT NULL;