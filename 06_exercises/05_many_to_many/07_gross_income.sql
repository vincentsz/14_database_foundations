/*
0.Query
 -description
Assuming that everybody in our database has a bill coming due, and that all of them will pay on time, 
write a query to compute the total gross income we expect to receive.

 -expected output
  gross
 --------
 678.50
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
we need all service that have a customer id (or service id), inner join service and customers_services
calculate the sum all the rows price
*/

SELECT sum(price) as gross FROM services
INNER JOIN customers_services
ON services.id = customers_services.service_id;