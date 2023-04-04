-- Build on the query from the previous question to return the name of any customer who ordered fries. 
-- Return this in a column called 'Customers who like Fries'. 
-- Don't repeat the same customer name more than once in the results.
SELECT * FROM customers;

SELECT DISTINCT c.customer_name AS "Customers who like fries"
FROM customers AS c
JOIN orders AS o
  ON c.id = o.customer_id
JOIN order_items AS oi
  ON o.id = oi.order_id
JOIN products AS p
  ON p.id = oi.product_id
WHERE p.product_name = 'Fries';
