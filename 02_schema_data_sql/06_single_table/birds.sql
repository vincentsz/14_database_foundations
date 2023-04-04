-- Write a SQL statement that will create a table named birds that can hold the following values:
-- name 	length 	wingspan 	family 	extinct
-- Spotted Towhee 	21.6 	26.7 	Emberizidae 	f
-- American Robin 	25.5 	36.0 	Turdidae 	f
-- Greater Koa Finch 	19.0 	24.0 	Fringillidae 	t
-- Carolina Parakeet 	33.0 	55.8 	Psittacidae 	t
-- Common Kestrel 	35.5 	73.5 	Falconidae 	f

CREATE TABLE birds(
  name varchar(255),
  length decimal(4,1),
  wingspan decimal(4,1),
  family text,
  extinct boolean
);


-- Using the table created in #4, write the SQL statements to insert the data as shown in the listing

INSERT INTO birds (name, length, wingspan, family, extinct)
VALUES ('Spotted Towhee', 21.6, 26.7, 'Emberizidae', false),
('American Robin', 25.5, 36.0, 'Turdidae', false),
('Greater Koa Finch', 19.0, 24.0, 'Fringillidae', true),
('Carolina Parakeet', 33.0, 55.8, 'Psittacidae', true),
('Common Kestrel', 35.5, 73.5, 'Falconidae', false);


-- Write a SQL statement that finds the names and families for all birds that are not extinct, 
-- in order from longest to shortest (based on the length column's value).

SELECT name, family FROM birds
WHERE extinct=false
ORDER BY length DESC;

-- Use SQL to determine the average, minimum, and maximum wingspan for the birds shown in the table.

SELECT round(avg(wingspan),1), min(wingspan), max(wingspan) FROM birds;

