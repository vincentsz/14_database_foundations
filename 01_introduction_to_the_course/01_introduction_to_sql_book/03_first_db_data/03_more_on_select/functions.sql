/* string functions */

SELECT length(full_name) FROM users;

SELECT full_name FROM users
WHERE length(full_name) > 10; 

INSERT INTO users (id, full_name)
VALUES (6, '      Harry Potter');

SELECT trim(leading '' from full_name)
FROM users;

/* date/time functions */
SELECT full_name, date_part('year', last_login)
FROM users;

SELECT full_name, age(last_login)
FROM users;

/* aggregate functions */
SELECT count(id)
FROM users;

SELECT sum(id)
FROM users;

SELECT min(id)
FROM users;

SELECT max(id)
FROM users;

SELECT avg(id)
FROM users;
