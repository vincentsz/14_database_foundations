-- Write a query to return the longest binomial name from the animals table.

SELECT binomial_name FROM animals
ORDER BY length(binomial_name)
LIMIT 1;