-- Write an SQL statement to query all data that is currently in our birds table.

SELECT * FROM birds;

-- or

SELECT id, name, age, species FROM birds;

-- use parentheses to group data in one column

SELECT (id,name, age, species) AS "group" FROM birds;