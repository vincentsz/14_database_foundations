/*
0.Query
 -description
Write a query that displays the description for every service that is subscribed to by at least 3 customers. 
Include the customer count for each description in the report. The report should look like this:

 -expected output
 description  | count
--------------+-------
 DNS          |     3
 Unix Hosting |     5
(2 rows)

 -returned output

1.Understand problem
 -input:
 --tables:
customers, services
 --columns
services.description, count of customers.id
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
inner jon services with customers_services, inner join w customers
group by customer id
select decription and count
where count >= 3
*/

SELECT services.description, count(customers.id) FROM services
INNER JOIN customers_services
  ON services.id = customers_services.service_id
INNER JOIN customers
  ON customers.id = customers_services.customer_id
GROUP BY services.id
HAVING count(customers.id) >= 3;

-- but what if we're looking for a zero count?

SELECT services.description, count(customers.id) FROM services
LEFT OUTER JOIN customers_services
  ON services.id = customers_services.service_id
LEFT OUTER JOIN customers
  ON customers.id = customers_services.customer_id
GROUP BY services.id
HAVING count(customers.id) = 0;

-- we didn't need the customers table though

SELECT services.description, count(services.id) FROM services
LEFT OUTER JOIN customers_services
ON services.id = customers_services.service_id
GROUP BY services.id
HAVING count(services.id) >= 3;