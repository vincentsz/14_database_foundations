/* Connect to the ls_burger database. Write a query that lists all of the burgers that have been ordered, 
from cheapest to most expensive, where the cost of the burger is less than $5.00. */
SELECT burger FROM orders
WHERE burger_cost < 5.00
ORDER BY burger_cost;