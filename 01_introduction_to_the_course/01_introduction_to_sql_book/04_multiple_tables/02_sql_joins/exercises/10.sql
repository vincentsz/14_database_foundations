-- Write a query to return the total cost of Natasha O'Shea's orders.

SELECT sum(p.product_cost) AS "Total cost Natahsa's orders"
FROM customers AS c 
JOIN orders AS o
  ON c.id = o.customer_id
JOIN order_items AS oi
  ON o.id = oi.order_id
JOIN products AS p
  ON oi.product_id = p.id
WHERE c.customer_name = 'Natasha O''Shea';
