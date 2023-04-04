-- Write a query to retrieve the customer data for every customer who currently subscribes to at least one service.
SELECT customers.id, customers.name, customers.payment_token FROM customers
JOIN customers_services
ON customers.id = customers_services.customer_id
GROUP BY customers.id;

--book

SELECT DISTINCT customers.* FROM customers
INNER JOIN customers_services
        ON customer_id = customers.id;