-- Write a query that returns the number of orders that include Fries and the number of orders that include Onion Rings.
SELECT count(id) 
FROM orders
WHERE side = 'Onion Rings' OR
side = 'Fries'
GROUP BY side;
