-- Write an SQL statement that deletes the record that describes a 3 year-old finch.

SELECT * FROM birds
WHERE age = 3 AND species = 'Finch';

DELETE FROM birds
WHERE age = 3 AND species = 'Finch';
