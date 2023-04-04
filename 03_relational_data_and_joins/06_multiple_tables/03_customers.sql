
/*
0.Query description
-- Write a query that determines how many different customers purchased tickets to at least one event.

1.Understand problem
 -input:
 --tables:
tickets
customers
 --columns
tickets.customer_id
customers.id
 -return:
integer
 -rules:
  --explicit:
  --implicit:
2.Examples & test cases
 -raised errors:
 -examples:
3.Data type
serial, integer
4.Algorithm
- Create an inner join with tickets and customers on customers.id equaling tickets.customer_id
- count customers.id
*/

SELECT COUNT(DISTINCT customer_id) FROM tickets;