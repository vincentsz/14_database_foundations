/*
0.Query
 -description
Write a SQL query that shows all items that have not had bids put on them. Use the logical operator NOT IN for this exercise, as well as a subquery.


 -expected output

 Not Bid On
------------
 Television
(1 row)

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
SELECT name AS "Bid on items" FROM items WHERE id NOT IN
  (SELECT item_id FROM bids);