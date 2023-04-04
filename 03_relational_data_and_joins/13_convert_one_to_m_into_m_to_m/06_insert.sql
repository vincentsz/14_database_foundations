-- Write SQL statements to insert data for the following films into the database:
-- Film 	Year 	Genre 	Duration 	Directors
-- Fargo 	1996 	comedy 	98 	Joel Coen
-- No Country for Old Men 	2007 	western 	122 	Joel Coen, Ethan Coen
-- Sin City 	2005 	crime 	124 	Frank Miller, Robert Rodriguez
-- Spy Kids 	2001 	scifi 	88 	Robert Rodriguez

INSERT INTO films (title, "year", genre, duration)
VALUES ('Fargo', 1996, 'comedy', 98),
       ('No Country for Old Men', 2007, 'western', 122),
       ('Sin City', 2005, 'crime', 124),
       ('Spy Kids',	2001, 'scifi', 88);

INSERT INTO directors ("name")
VALUES ('Joel Coen'),
       ('Ethan Coen'),
       ('Frank Miller'),
       ('Robert Rodriguez');

INSERT INTO directors_films(film_id, director_id)
VALUES (11,9),
       (12, 9),
       (12, 10),
       (13, 11),
       (13, 12),
       (14, 12);

-- book

INSERT INTO films (title, year, genre, duration) VALUES ('Fargo', 1996, 'comedy', 98);
INSERT INTO directors (name) VALUES ('Joel Coen');
INSERT INTO directors (name) VALUES ('Ethan Coen');
INSERT INTO directors_films (director_id, film_id) VALUES (9, 11);

INSERT INTO films (title, year, genre, duration) VALUES ('No Country for Old Men', 2007, 'western', 122);
INSERT INTO directors_films (director_id, film_id) VALUES (9, 12);
INSERT INTO directors_films (director_id, film_id) VALUES (10, 12);

INSERT INTO films (title, year, genre, duration) VALUES ('Sin City', 2005, 'crime', 124);
INSERT INTO directors (name) VALUES ('Frank Miller');
INSERT INTO directors (name) VALUES ('Robert Rodriguez');
INSERT INTO directors_films (director_id, film_id) VALUES (11, 13);
INSERT INTO directors_films (director_id, film_id) VALUES (12, 13);

INSERT INTO films (title, year, genre, duration) VALUES ('Spy Kids', 2001, 'scifi', 88) RETURNING id;
INSERT INTO directors_films (director_id, film_id) VALUES (12, 14);

-- verification
SELECT films.title, directors.name
  FROM films
    INNER JOIN directors_films ON directors_films.film_id = films.id
    INNER JOIN directors ON directors.id = directors_films.director_id
  ORDER BY films.title ASC;