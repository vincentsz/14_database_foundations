/*
0.Query description
Write a query that determines what percentage of the customers in the database have purchased a ticket to one or more of the events.
1.Understand problem
 -input:
 --tables:
tickets
 --columns
customer_id
 -return:
percentage
 -rules:
  --explicit:
  --implicit:
2.Examples & test cases
 -raised errors:
 -examples:
3.Data type

4.Algorithm
- calculate total customers
  - count * from customers
- calculate total customers who bought ticket
  - count the unique customer_ids in the ticket table
- divide customers w tickets / divided by total customers times a 100
- round result  
*/

SELECT ROUND((COUNT(DISTINCT tickets.customer_id)/COUNT(DISTINCT customers.id)::decimal) * 100, 2)
FROM customers
LEFT JOIN tickets
ON customers.id = tickets.customer_id;

--book

SELECT round( COUNT(DISTINCT tickets.customer_id)
            / COUNT(DISTINCT customers.id)::decimal * 100,
            2)
       AS percent
  FROM customers
  LEFT OUTER JOIN tickets
    ON tickets.customer_id = customers.id;