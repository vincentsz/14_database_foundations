-- Connect to the ls_burger database. Write a query that returns the average burger cost for all orders that include fries

SELECT avg(burger_cost) 
FROM orders
WHERE side = 'FRIES';


SELECT avg(burger_cost)
FROM orders
WHERE side = 'Fries';