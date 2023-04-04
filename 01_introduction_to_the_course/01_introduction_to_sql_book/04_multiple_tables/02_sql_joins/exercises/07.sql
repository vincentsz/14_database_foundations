-- Connect to the ls_burger database. Return a list of all orders and their associated product items.

SELECT orders.id, products.product_name
FROM orders 
INNER JOIN order_items
  ON orders.id = order_items.order_id
INNER JOIN products
  ON products.id = order_items.product_id;

SELECT orders.*, products.*
FROM orders 
INNER JOIN order_items
  ON orders.id = order_items.order_id
INNER JOIN products
  ON products.id = order_items.product_id;

--  Schema |      Name       | Type  |      Owner      
-- --------+-----------------+-------+-----------------
--  public | customers       | table | vincentsijssens
--  public | email_addresses | table | vincentsijssens
--  public | order_items     | table | vincentsijssens
--  public | orders          | table | vincentsijssens
--  public | products        | table | vincentsijssens
-- (5 rows)

-- ls_burger=# \d orders
--                                       Table "public.orders"
--     Column    |         Type          | Collation | Nullable |              Default               
-- --------------+-----------------------+-----------+----------+------------------------------------
--  id           | integer               |           | not null | nextval('orders_id_seq'::regclass)
--  customer_id  | integer               |           |          | 
--  order_status | character varying(20) |           |          | 
-- Indexes:
--     "orders_pkey" PRIMARY KEY, btree (id)
-- Foreign-key constraints:
--     "orders_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
-- Referenced by:
--     TABLE "order_items" CONSTRAINT "order_items_order_id_fkey" FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE

--     ls_burger=# \d products
--                                            Table "public.products"
--          Column         |         Type          | Collation | Nullable |               Default                
-- ------------------------+-----------------------+-----------+----------+--------------------------------------
--  id                     | integer               |           | not null | nextval('products_id_seq'::regclass)
--  product_name           | character varying(50) |           |          | 
--  product_cost           | numeric(4,2)          |           |          | 
--  product_type           | character varying(20) |           |          | 
--  product_loyalty_points | integer               |           |          | 
-- Indexes:
--     "products_pkey" PRIMARY KEY, btree (id)
-- Referenced by:
--     TABLE "order_items" CONSTRAINT "order_items_product_id_fkey" FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE

-- ls_burger=# \d order_items;
--                               Table "public.order_items"
--    Column   |  Type   | Collation | Nullable |                 Default                 
-- ------------+---------+-----------+----------+-----------------------------------------
--  id         | integer |           | not null | nextval('order_items_id_seq'::regclass)
--  order_id   | integer |           |          | 
--  product_id | integer |           |          | 
-- Indexes:
--     "order_items_pkey" PRIMARY KEY, btree (id)
-- Foreign-key constraints:
--     "order_items_order_id_fkey" FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
--     "order_items_product_id_fkey" FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE