CREATE TABLE directors(
  id serial PRIMARY KEY,
  name text NOT NULL
);

INSERT INTO directors(name)
VALUES ('John McTiernan'),
       ('Michael Curtiz'),
       ('Francis Ford Coppola'),
       ('Michael Anderson'),
       ('Tomas Alfredson'),
       ('Mike Nichols');

ALTER TABLE films
ADD COLUMN director_id integer REFERENCES directors(id);

UPDATE films SET director_id = 1 WHERE director = 'John McTiernan';
UPDATE films SET director_id = 2 WHERE director = 'Michael Curtiz';
UPDATE films SET director_id = 3 WHERE director = 'Francis Ford Coppola';
UPDATE films SET director_id = 4 WHERE director = 'Michael Anderson';
UPDATE films SET director_id = 5 WHERE director = 'Tomas Alfredson';
UPDATE films SET director_id = 6 WHERE director = 'Mike Nichols';
