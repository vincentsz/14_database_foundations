-- Write a query to retrieve the customer data for every customer who does not currently subscribe to any services.
SELECT customers.* FROM customers
WHERE customers.id NOT IN (SELECT customers.id FROM customers JOIN customers_services ON customers.id = customers_services.customer_id);

-- book

SELECT customers.*, customers_services.* FROM customers
LEFT OUTER JOIN customers_services
             ON customer_id = customers.id;
WHERE service_id IS NULL;


-- further exploration

-- Can you write a query that displays all customers with no services and all services that currently don't have any customers? The output should look like this:

--  id |     name      | payment_token | id |     description     | price
-- ----+---------------+---------------+----+---------------------+--------
--   2 | Nancy Monreal | JKWQPJKL      |    |                     |
--     |               |               |  8 | One-to-one Training | 999.00

SELECT customers.*, customers_services.*, services.* FROM customers
LEFT OUTER JOIN customers_services
  ON customers.id = customers_services.customer_id
FULL OUTER JOIN services
  ON customers_services.service_id = services.id
WHERE customer_id IS NULL ;
