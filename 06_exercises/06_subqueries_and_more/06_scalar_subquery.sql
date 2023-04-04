/*
0.Query
 -description
For this exercise, use a scalar subquery to determine the number of bids on each item. 
The entire query should return a table that has the name of each item along with the number of bids on an item.

-- approach

Refer to the PostgreSQL documentation on scalar subqueries to solve this exercise. Keep a few key facts in mind:

You may reference columns within your subquery from the outer SELECT query. Those values will act as constants for the current subquery evaluation.
A scalar subquery must only return one column and one row.

 -expected output
    name      | count
--------------+-------
Video Game    |     4
Outdoor Grill |     1
Painting      |     8
Tent          |     4
Vase          |     9
Television    |     0
(6 rows)
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


SELECT name, (SELECT count(item_id) FROM bids WHERE bids.item_id = items.id) FROM items;

-- further exploration
-- If we wanted to get an equivalent result, without using a subquery, 
-- then we would have to use a LEFT OUTER JOIN. Can you come up with the equivalent query that uses LEFT OUTER JOIN?

SELECT name, count(bids.item_id) FROM items
LEFT OUTER JOIN bids
ON items.id = bids.item_id
GROUP BY items.id
ORDER BY items.id;