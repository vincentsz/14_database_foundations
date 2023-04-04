/*
0.Query
 -description
We want to check that a given item is in our database. 
There is one problem though: we have all of the data for the item, but we don't know the id number. 
Write an SQL query that will display the id for the item that matches all of the data that we know, but does not use the AND keyword. Here is the data we know:

'Painting', 100.00, 250.00
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
nesting queries
write a query that select all items with name 'Painting'
write a query that select all items with initial price '100.00'
write a query that select all items with sales price '250.00'

*/
SELECT sales.id FROM
  (SELECT init.id, init.sales_price FROM
    (SELECT name.id, name.initial_price, name.sales_price FROM
      (SELECT id, name, initial_price, sales_price FROM items WHERE name = 'Painting') AS name
    WHERE initial_price = 100.00) AS init) AS sales;

 
  SELECT init.id FROM
    (SELECT name.id, name.initial_price, name.sales_price FROM
      (SELECT id, name, initial_price, sales_price FROM items WHERE name = 'Painting') AS name
    WHERE initial_price = 100.00) AS init 
  WHERE sales_price = 250.00 ;

  -- book

  SELECT ROW(1,2.5,'this is a test');

  SELECT id FROM items WHERE 
  ROW('Painting', 100.00, 250.00)
  = ROW(name, initial_price, sales_price);