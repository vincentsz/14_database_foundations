-- Write a SQL statement that will delete all users that are located in the state of California (CA).

SELECT * FROM people
WHERE state = 'CA';

DELETE FROM people
WHERE state = 'CA';
