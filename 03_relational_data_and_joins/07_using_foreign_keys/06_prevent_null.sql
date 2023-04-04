/*
0.Query
 -description
Write a SQL statement that will prevent NULL values from being stored in orders.product_id. What happens if you execute that statement?
 -expected output

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

ALTER TABLE orders
ALTER COLUMN product_id
SET NOT NULL;