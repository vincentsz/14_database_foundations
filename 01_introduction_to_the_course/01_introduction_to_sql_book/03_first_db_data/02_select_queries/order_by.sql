SELECT column_name, ...
FROM table_name
WHERE condition
ORDER BY column_name;

/* example 1: */
SELECT full_name, enabled 
FROM users
ORDER BY enabled; 

/* example 2: DESc and ASC keywords */
SELECT full_name, enabled
FROM users
ORDER BY enabled DESC;

/* example 3: additional ordering */

SELECT full_name, enabled
FROM users
ORDER BY enabled DESC, id DESC;