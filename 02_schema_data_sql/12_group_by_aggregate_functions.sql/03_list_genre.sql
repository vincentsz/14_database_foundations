-- Write a SQL query that lists all genres for which there is a movie in the films table.

SELECT DISTINCT genre FROM films;

-- q4
SELECT genre FROM films
GROUP BY genre;