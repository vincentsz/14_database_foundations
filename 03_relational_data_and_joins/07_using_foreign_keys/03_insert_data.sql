/*
0.Query
 -description
Use psql to insert the data shown in the following table into the database:
Quantity 	Product
10 	small bolt
25 	small bolt
15 	large bolt
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

INSERT INTO products(name)
VALUES ('small bolt'),
       ('large bolt');

INSERT INTO orders(product_id, quantity)
VALUES (1, 10),
       (1, 25),
       (2, 15);