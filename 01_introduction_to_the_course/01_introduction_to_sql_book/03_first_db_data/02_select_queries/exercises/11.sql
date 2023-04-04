/* Write a query that will return the first and last names of all the celebrities who act */
SELECT first_name, last_name
FROM celebrities
WHERE occupation ILIKE '%actor%'
OR occupation ILIKE '%actress%';