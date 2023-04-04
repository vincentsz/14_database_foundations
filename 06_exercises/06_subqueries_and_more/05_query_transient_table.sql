/*
0.Query
 -description
For this exercise, we'll make a slight departure from how we've been using subqueries. We have so far used subqueries to filter our results using a WHERE clause. 
In this exercise, we will build that filtering into the table that we will query. 
Write an SQL query that finds the largest number of bids from an individual bidder.

For this exercise, you must use a subquery to generate a result table (or transient table), and then query that table for the largest number of bids.
 -expected output
  max
------
    9
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
SELECT MAX(count) FROM
(SELECT count(bidder_id) FROM bids
  GROUP BY bidder_id) AS "max" ;

--book
SELECT MAX(bid_counts.count) FROM
  (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;

-- alternative

SELECT COUNT(bidder_id) AS "max" FROM bids
GROUP BY bidder_id
ORDER BY COUNT(bidder_id) DESC
LIMIT 1;