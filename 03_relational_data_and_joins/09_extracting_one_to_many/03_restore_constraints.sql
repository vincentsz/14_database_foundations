-- Restore the constraint that was on the films.director column to directors.name

ALTER TABLE directors
ADD CONSTRAINT director_name 
CHECK (length(name::text) >=1 AND "position"(name::text, ' '::text) > 0);

-- book

ALTER TABLE directors ADD CONSTRAINT valid_name
CHECK (length(name) >= 1 AND position(' ' in name) > 0);

SELECT *
FROM films
INNER JOIN directors
ON films.director_id = directors.id;