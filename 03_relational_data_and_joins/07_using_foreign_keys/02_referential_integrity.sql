/*
0.Query
 -description
Update the orders table so that referential integrity will be preserved for the data between orders and products.
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
                   List of relations
 Schema |      Name       |   Type   |      Owner      
--------+-----------------+----------+-----------------
 public | orders          | table    | vincentsijssens
 public | orders_id_seq   | sequence | vincentsijssens
 public | products        | table    | vincentsijssens
 public | products_id_seq | sequence | vincentsijssens

                               Table "public.orders"
   Column   |  Type   | Collation | Nullable |              Default               
------------+---------+-----------+----------+------------------------------------
 id         | integer |           | not null | nextval('orders_id_seq'::regclass)
 product_id | integer |           |          | 
 quantity   | integer |           | not null | 
Indexes:
    "orders_pkey" PRIMARY KEY, btree (id)

 Column |  Type   | Collation | Nullable |               Default                
--------+---------+-----------+----------+--------------------------------------
 id     | integer |           | not null | nextval('products_id_seq'::regclass)
 name   | text    |           | not null | 
Indexes:
    "products_pkey" PRIMARY KEY, btree (id)

 -tables

3.Data type

4.Algorithm
set orders.product_id to foreign key referencing products.id
*/

ALTER TABLE orders ADD CONSTRAINT orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);

-- book

ALTER TABLE orders ADD CONSTRAINT orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);