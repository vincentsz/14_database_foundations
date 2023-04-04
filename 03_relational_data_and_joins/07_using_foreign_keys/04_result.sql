/*
0.Query
 -description
Write a SQL statement that returns a result like this:


 -expected output
 quantity |    name
----------+------------
       10 | small bolt
       25 | small bolt
       15 | large bolt
(3 rows)


 quantity |    name    
----------+------------
       10 | small bolt
       25 | small bolt
       15 | large bolt
(3 rows)
 -returned output

1.Understand problem
 -input:
 --tables:

 --columns

 -return:

 -rules:
  --explicit:
  --implicit:
2.Helper data
 -schema

 -tables

3.Data type

4.Algorithm

*/

SELECT orders.quantity, products.name
FROM orders
INNER JOIN products
ON orders.product_id = products.id;

-- book

SELECT quantity, name FROM orders INNER JOIN products ON orders.product_id = products.id;