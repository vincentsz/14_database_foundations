-- Connect to the encyclopedia database. Write a query to return all of the country names along with their appropriate continent names.
SELECT countries.name, continents.continent_name
FROM countries JOIN continents
ON countries.continent_id = continents.id;
