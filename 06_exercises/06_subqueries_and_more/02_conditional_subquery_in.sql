/*
0.Query
 -description
Write a SQL query that shows all items that have had bids put on them. Use the logical operator IN for this exercise, as well as a subquery.
 -expected output
 Bid on Items
---------------
 Video Game
 Outdoor Grill
 Painting
 Tent
 Vase
(5 rows)
 -returned output
 Bid on items  
---------------
 Video Game
 Outdoor Grill
 Painting
 Tent
 Vase
(5 rows
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
                               Table "public.bids"
  Column   |     Type     | Collation | Nullable |             Default              
-----------+--------------+-----------+----------+----------------------------------
 id        | integer      |           | not null | nextval('bids_id_seq'::regclass)
 bidder_id | integer      |           | not null | 
 item_id   | integer      |           | not null | 
 amount    | numeric(6,2) |           | not null | 
Indexes:
    "bids_pkey" PRIMARY KEY, btree (id)
    "bids_bidder_id_item_id_idx" btree (bidder_id, item_id)
Check constraints:
    "bids_amount_check" CHECK (amount >= 0.01 AND amount <= 1000.00)

                                  Table "public.items"
    Column     |     Type     | Collation | Nullable |              Default              
---------------+--------------+-----------+----------+-----------------------------------
 id            | integer      |           | not null | nextval('items_id_seq'::regclass)
 name          | text         |           | not null | 
 initial_price | numeric(6,2) |           | not null | 
 sales_price   | numeric(6,2) |           |          | 
Indexes:
    "items_pkey" PRIMARY KEY, btree (id)
Check constraints:
    "items_initial_price_check" CHECK (initial_price >= 0.01 AND initial_price <= 1000.00)
    "items_initial_price_check1" CHECK (initial_price >= 0.01 AND initial_price <= 1000.00)
Referenced by:
    TABLE "bids" CONSTRAINT "bids_item_id_fkey" FOREIGN KEY (item_id) REFERENCES items(id)


                            Table "public.bidders"
 Column |  Type   | Collation | Nullable |               Default               
--------+---------+-----------+----------+-------------------------------------
 id     | integer |           | not null | nextval('bidders_id_seq'::regclass)
 name   | text    |           | not null | 
Indexes:
    "bidders_pkey" PRIMARY KEY, btree (id)
Referenced by:
    TABLE "bids" CONSTRAINT "bids_bidder_id_fkey" FOREIGN KEY (bidder_id) REFERENCES bidders(id)

 -tables

3.Data type

4.Algorithm
select name as 'Bid on items' from items where the id is in
  select all the item_id from bids
*/
SELECT name AS "Bid on items" FROM items WHERE id IN
  (SELECT DISTINCT item_id FROM bids);
