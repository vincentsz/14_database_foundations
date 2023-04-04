-- Write a query to return each unique conservation status code alongside the number of animals that have that code
SELECT conservation_status, count(name)
FROM animals
GROUP BY conservation_status;
