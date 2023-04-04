-- Write a SQL statement that modifies the table films to remove its primary key while preserving the id column and the values it contains.

ALTER TABLE films DROP CONSTRAINT films_pkey;