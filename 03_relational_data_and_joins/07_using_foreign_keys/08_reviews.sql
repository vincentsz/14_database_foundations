/*
0.Query
 -description
Create a new table called reviews to store the data shown below. This table should include a primary key 
and a reference to the products table.
Product 	Review
small bolt 	a little small
small bolt 	very round!
large bolt 	could have been smaller
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

CREATE TABLE reviews(
  product_id integer REFERENCES products(id),
  review varchar(500) NOT NULL
);

ALTER TABLE reviews
ADD COLUMN id serial PRIMARY KEY;

--book
CREATE TABLE reviews (
  id serial PRIMARY KEY,
  body text NOT NULL,
  product_id integer REFERENCES products (id)
);
