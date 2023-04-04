-- Write a query to return the first name of any celebrity born in 1958
SELECT first_name FROM celebrities
 WHERE date_of_birth >= '1958-01-01' AND
 date_of_birth <= '1958-12-31';

--  or

SELECT first_name FROM celebrities
WHERE date_part('year', date_of_birth) = 1958;