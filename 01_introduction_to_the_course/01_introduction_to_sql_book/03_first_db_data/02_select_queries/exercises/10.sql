/* Write a query that will return the first and last names of all the celebrities who sing.*/
SELECT first_name, last_name 
FROM celebrities
WHERE occupation ILIKE '%singer%';