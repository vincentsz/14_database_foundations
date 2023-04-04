-- Write a query to retrieve the name of the country with the second largest population

SELECT name FROM countries
ORDER BY population DESC
LIMIT 1 OFFSET 1;