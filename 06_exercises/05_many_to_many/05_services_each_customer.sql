/*
0.Query
 -description
Write a query to display a list of all customer names together with a comma-separated list of the services they use. Your output should look like this:


 -expected output
     name      |                                services
---------------+-------------------------------------------------------------------------
 Pat Johnson   | Unix Hosting, DNS, Whois Registration
 Nancy Monreal |
 Lynn Blake    | DNS, Whois Registration, High Bandwidth, Business Support, Unix Hosting
 Chen Ke-Hua   | High Bandwidth, Unix Hosting
 Scott Lakso   | DNS, Dedicated Hosting, Unix Hosting
 Jim Pornot    | Unix Hosting, Dedicated Hosting, Bulk Email
(6 rows)
 -returned output
     name      |                                services                                 
---------------+-------------------------------------------------------------------------
 Pat Johnson   | Unix Hosting, DNS, Whois Registration
 Nancy Monreal | 
 Lynn Blake    | DNS, Whois Registration, High Bandwidth, Business Support, Unix Hosting
 Chen Ke-Hua   | High Bandwidth, Unix Hosting
 Scott Lakso   | DNS, Dedicated Hosting, Unix Hosting
 Jim Pornot    | Unix Hosting, Dedicated Hosting, Bulk Email
(6 rows)

1.Understand problem
 -input:
 --tables:
customers, services
 --columns
customers.names, services.description(aggregated)
 -return:

 -rules:
  --explicit:
  --implicit:
2.Helper data
 -schema
                        List of relations
 Schema |           Name            |   Type   |      Owner      
--------+---------------------------+----------+-----------------
 public | customers                 | table    | vincentsijssens
 public | customers_id_seq          | sequence | vincentsijssens
 public | customers_services        | table    | vincentsijssens
 public | customers_services_id_seq | sequence | vincentsijssens
 public | services                  | table    | vincentsijssens
 public | services_id_seq           | sequence | vincentsijssens
(6 rows)

                                  Table "public.customers"
    Column     |     Type     | Collation | Nullable |                Default                
---------------+--------------+-----------+----------+---------------------------------------
 id            | integer      |           | not null | nextval('customers_id_seq'::regclass)
 name          | text         |           | not null | 
 payment_token | character(8) |           | not null | 
Indexes:
    "customers_pkey" PRIMARY KEY, btree (id)
    "customers_payment_token_key" UNIQUE CONSTRAINT, btree (payment_token)
Check constraints:
    "customers_payment_token_check" CHECK (payment_token ~ '^[A-Z]{8}$'::text)
Referenced by:
    TABLE "customers_services" CONSTRAINT "customers_services_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE

                                  Table "public.services"
   Column    |     Type      | Collation | Nullable |               Default                
-------------+---------------+-----------+----------+--------------------------------------
 id          | integer       |           | not null | nextval('services_id_seq'::regclass)
 description | text          |           | not null | 
 price       | numeric(10,2) |           | not null | 
Indexes:
    "services_pkey" PRIMARY KEY, btree (id)
Check constraints:
    "services_price_check" CHECK (price >= 0.00)
Referenced by:
    TABLE "customers_services" CONSTRAINT "customers_services_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id)

 -tables

3.Data type

4.Algorithm
inner join customers with customers_services, inner join with services
group customers
select customer name, string aggergate decriptions
*/

SELECT customers.name, 
       string_agg(services.description, ', ') AS services 
FROM customers
LEFT OUTER JOIN customers_services
  ON customers.id = customers_services.customer_id
LEFT OUTER JOIN services
  ON customers_services.service_id = services.id
GROUP BY customers.id;

-- further exploration
-- Can you modify the above command so the output looks like this?

--      name      |    description
-- ---------------+--------------------
--  Chen Ke-Hua   | High Bandwidth
--                | Unix Hosting
--  Jim Pornot    | Dedicated Hosting
--                | Unix Hosting
--                | Bulk Email
--  Lynn Blake    | Whois Registration
--                | High Bandwidth
--                | Business Support
--                | DNS
--                | Unix Hosting
--  Nancy Monreal |
--  Pat Johnson   | Whois Registration
--                | DNS
--                | Unix Hosting
--  Scott Lakso   | DNS
--                | Dedicated Hosting
--                | Unix Hosting
-- (17 rows)

--      case      |    description     
-- ---------------+--------------------
--                | High Bandwidth
--                | Unix Hosting
--  Jim Pornot    | Dedicated Hosting
--                | Unix Hosting
--                | Bulk Email
--  Lynn Blake    | Whois Registration
--                | High Bandwidth
--                | Business Support
--                | DNS
--                | Unix Hosting
--  Nancy Monreal | 
--  Pat Johnson   | Whois Registration
--                | DNS
--                | Unix Hosting
--  Scott Lakso   | DNS
--                | Dedicated Hosting
--                | Unix Hosting
-- (17 rows)

-- This won't be easy! Hint: you will need to use the window lag function together with a CASE condition in your SELECT. To get you started, try this command:

SELECT customers.name,
       lag(customers.name)
         OVER (ORDER BY customers.name)
         AS previous,
       services.description
FROM customers
LEFT OUTER JOIN customers_services
             ON customer_id = customers.id
LEFT OUTER JOIN services
             ON services.id = service_id;

-- Examine the relationship between the previous column and the rest of the table to get a handle on what lag does.

SELECT customers.name, 
       string_agg(services.description, ', ') AS services 
FROM customers
LEFT OUTER JOIN customers_services
  ON customers.id = customers_services.customer_id
LEFT OUTER JOIN services
  ON customers_services.service_id = services.id
GROUP BY customers.id;
-- ORDER BY customers.name;

SELECT CASE 
  WHEN lag(customers.name) OVER (ORDER BY customers.name) = customers.name 
    THEN NULL
  ELSE name
  END,
services.description
FROM customers
LEFT OUTER JOIN customers_services
             ON customer_id = customers.id
LEFT OUTER JOIN services
             ON services.id = service_id;

            --  name if name != lag_function, null if name == lag_function

CASE WHEN name != lag(customers.name) OVER (ORDER BY customers.name)
THEN name
ELSE null
END

SELECT CASE
          WHEN (lag(customers.name) OVER (ORDER BY customers.name)) = customers.name THEN ''
          WHEN (lag(customers.name) OVER (ORDER BY customers.name)) IS NULL THEN customers.name
          ELSE customers.name END AS name,
       services.description
FROM customers
LEFT OUTER JOIN customers_services
             ON customer_id = customers.id
LEFT OUTER JOIN services
             ON services.id = service_id;