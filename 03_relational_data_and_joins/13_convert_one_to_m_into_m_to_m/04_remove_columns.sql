-- Write a SQL statement to remove any unneeded columns from films.

ALTER TABLE films
DROP COLUMN director_id;