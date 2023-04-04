/*
0.Query
 -description
Can you insert a row into orders without a product_id? Write a SQL statement to prove your answer.
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
                             Table "public.products"
 Column |  Type   | Collation | Nullable |               Default                
--------+---------+-----------+----------+--------------------------------------
 id     | integer |           | not null | nextval('products_id_seq'::regclass)
 name   | text    |           | not null | 
Indexes:
    "products_pkey" PRIMARY KEY, btree (id)
Referenced by:
    TABLE "orders" CONSTRAINT "orders_product_id_fkey" FOREIGN KEY (product_id) REFERENCES products(id)


                              Table "public.orders"
   Column   |  Type   | Collation | Nullable |              Default               
------------+---------+-----------+----------+------------------------------------
 id         | integer |           | not null | nextval('orders_id_seq'::regclass)
 product_id | integer |           |          | 
 quantity   | integer |           | not null | 
Indexes:
    "orders_pkey" PRIMARY KEY, btree (id)
Foreign-key constraints:
    "orders_product_id_fkey" FOREIGN KEY (product_id) REFERENCES products(id)
 -tables

3.Data type

4.Algorithm

*/

No, orders.peoduct_id functions as a foreign key, referencing products.id. 
A foreign key assures referential integrity, meaning that it MUST refer to a value in the products.id primary key column.

INSERT INTO orders(product_id)
VALUES (3); -- this violates the not-null constraint for quantity

INSERT INTO orders(product_id, quantity)
VALUES (3, 35); -- this violates the foreign key constraint, since the value is not present in products table

--however: book shows us that we can, as long as the foreign key is null (and there's no null constraint)

Yes:

INSERT INTO orders (quantity) VALUES (42);
-- INSERT 0 1