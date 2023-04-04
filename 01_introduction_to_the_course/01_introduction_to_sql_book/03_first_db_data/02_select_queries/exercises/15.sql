/* Write a query that returns all the burgers ordered by Natasha O'Shea. */

SELECT burger 
FROM orders
WHERE customer_name = 'Natasha O''Shea';