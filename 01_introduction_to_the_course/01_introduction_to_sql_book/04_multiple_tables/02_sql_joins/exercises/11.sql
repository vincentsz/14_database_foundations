-- Write a query to return the name of every product included in an order alongside the number of times it has been ordered. 
-- Sort the results by product name, ascending.
-- , count(p.product_name) AS "Times product ordered"

SELECT p.product_name, count(oi.id) AS "Times ordered"
FROM products AS p
JOIN order_items AS oi
  ON p.id = oi.product_id
JOIN orders AS o
  ON oi.order_id = o.id
GROUP BY product_name
ORDER BY p.product_name ASC;
