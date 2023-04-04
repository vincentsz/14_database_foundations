-- What error do you receive if you attempt to update a row to have a value for id that is used by another row?

UPDATE films
SET id = 3
WHERE title = 'Die Hard';

-- ERROR:  duplicate key value violates unique constraint "films_pkey"
-- DETAIL:  Key (id)=(3) already exists.