-- Write a query to return the highest maximum age from the animals table

SELECT max_age_years FROM animals
ORDER BY max_age_years DESC
LIMIT 1;

-- or

SELECT max(max_age_years) FROM animals;