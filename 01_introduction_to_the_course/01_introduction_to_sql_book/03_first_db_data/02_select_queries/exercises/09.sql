/* Write a query that will return the first name and last name of 
all entries in the celebrities table 
where the value of the deceased column is not true. */

SELECT first_name, last_name
FROM celebrities
WHERE deceased <> true
OR deceased is NULL;