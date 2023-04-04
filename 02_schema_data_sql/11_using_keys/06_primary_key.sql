-- Write a SQL statement to add an auto-incrementing integer primary key column to the films table.

\d films

ALTER TABLE films ADD COLUMN id serial PRIMARY KEY;