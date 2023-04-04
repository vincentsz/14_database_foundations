-- Write the SQL statements needed to insert data into the new join table to represent the existing one-to-many relationships.

INSERT INTO directors_films (film_id, director_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 3),
       (8, 7),
       (9, 8),
       (10, 4);

-- alternative with select
DELETE FROM directors_films;

INSERT INTO directors_films(film_id, director_id) (
  SELECT films.id, films.director_id FROM films
);

  INSERT into foo_bar (foo_id, bar_id) ( 
  SELECT foo.id, bar.id FROM foo CROSS JOIN bar 
    WHERE type = 'name' AND name IN ('selena', 'funny', 'chip') 
);