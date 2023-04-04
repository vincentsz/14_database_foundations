-- Write a SQL statement that attempts to insert a duplicate number for a new contact but fails. What error is shown?

INSERT INTO contacts(first_name, last_name, number)
VALUES ('Tom', 'Cruise', 6125594874);
-- book

one-to-many=# INSERT INTO contacts (first_name, last_name, number) VALUES ('Nivi', 'Petrussen', '6125594874');
ERROR:  duplicate key value violates unique constraint "number_unique"
DETAIL:  Key (number)=(6125594874) already exists.