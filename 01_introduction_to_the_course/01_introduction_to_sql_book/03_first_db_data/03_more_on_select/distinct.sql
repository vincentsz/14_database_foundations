INSERT INTO users (id, full_name)
VALUES (4, 'Harry Potter'),
(5, 'Jane Smith');

SELECT full_name FROM users;

 /* helps with duplication */

SELECT DISTINCT full_name FROM users;

/* in conjuction with SQL functions */

SELECT count(DISTINCT full_name) FROM users;