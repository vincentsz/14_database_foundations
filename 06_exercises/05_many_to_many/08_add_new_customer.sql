-- A new customer, 'John Doe', has signed up with our company. His payment token is 'EYODHLCN'. 
-- Initially, he has signed up for UNIX hosting, DNS, and Whois Registration. 
-- Create any SQL statement(s) needed to add this record to the database.
--                         List of relations
--  Schema |           Name            |   Type   |      Owner      
-- --------+---------------------------+----------+-----------------
--  public | customers                 | table    | vincentsijssens
--  public | customers_id_seq          | sequence | vincentsijssens
--  public | customers_services        | table    | vincentsijssens
--  public | customers_services_id_seq | sequence | vincentsijssens
--  public | services                  | table    | vincentsijssens
--  public | services_id_seq           | sequence | vincentsijssens
-- (6 rows)

--                                   Table "public.customers"
--     Column     |     Type     | Collation | Nullable |                Default                
-- ---------------+--------------+-----------+----------+---------------------------------------
--  id            | integer      |           | not null | nextval('customers_id_seq'::regclass)
--  name          | text         |           | not null | 
--  payment_token | character(8) |           | not null | 
-- Indexes:
--     "customers_pkey" PRIMARY KEY, btree (id)
--     "customers_payment_token_key" UNIQUE CONSTRAINT, btree (payment_token)
-- Check constraints:
--     "customers_payment_token_check" CHECK (payment_token ~ '^[A-Z]{8}$'::text)
-- Referenced by:
--     TABLE "customers_services" CONSTRAINT "customers_services_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE

--                                   Table "public.services"
--    Column    |     Type      | Collation | Nullable |               Default                
-- -------------+---------------+-----------+----------+--------------------------------------
--  id          | integer       |           | not null | nextval('services_id_seq'::regclass)
--  description | text          |           | not null | 
--  price       | numeric(10,2) |           | not null | 
-- Indexes:
--     "services_pkey" PRIMARY KEY, btree (id)
-- Check constraints:
--     "services_price_check" CHECK (price >= 0.00)
-- Referenced by:
--     TABLE "customers_services" CONSTRAINT "customers_services_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id)

--  id |     description     | price  
-- ----+---------------------+--------
--   1 | Unix Hosting        |   5.95
--   2 | DNS                 |   4.95
--   3 | Whois Registration  |   1.95
--   4 | High Bandwidth      |  15.00
--   5 | Business Support    | 250.00
--   6 | Dedicated Hosting   |  50.00
--   7 | Bulk Email          | 250.00
--   8 | One-to-one Training | 999.00
-- (8 rows)

INSERT INTO customers(name, payment_token)
VALUES ('John Doe', 'EYODHLCN');

INSERT INTO customers_services(customer_id, service_id)
VALUES (7, 1),
       (7, 2),
       (7, 3);