-- Write a query to retrieve the name of the country with the largest population

SELECT name FROM countries
ORDER BY population DESC
LIMIT 1;