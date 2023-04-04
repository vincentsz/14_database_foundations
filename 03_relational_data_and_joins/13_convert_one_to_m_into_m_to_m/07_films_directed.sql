-- Write a SQL statement that determines how many films each director in the database has directed. 
-- Sort the results by number of films (greatest first) and then name (in alphabetical order).

SELECT directors.name AS directors, count(films.id) AS films 
  FROM films
    JOIN directors_films
      ON films.id =  directors_films.film_id
    JOIN directors
      ON directors_films.director_id = directors.id
  GROUP BY directors.id
  ORDER BY films DESC, directors.name ASC;

--          director       | films
-- ----------------------+-------
--  Francis Ford Coppola |     2
--  Joel Coen            |     2
--  Michael Anderson     |     2
--  Robert Rodriguez     |     2
--  Ethan Coen           |     1
--  Frank Miller         |     1
--  John McTiernan       |     1
--  Michael Curtiz       |     1
--  Mike Nichols         |     1
--  Penelope Spheeris    |     1
--  Sidney Lumet         |     1
--  Tomas Alfredson      |     1
-- (12 rows)

-- book

SELECT directors.name AS director, COUNT(directors_films.film_id) AS films
  FROM directors
    INNER JOIN directors_films ON directors.id = directors_films.director_id
  GROUP BY directors.id
  ORDER BY films DESC, directors.name ASC;

    -- add director with no films 
  INSERT INTO directors (name)
  VALUES ('Vincent Sijssens');

  -- join

SELECT directors.name, count(film_id) as "films directed"
  FROM directors
  LEFT OUTER JOIN directors_films
   ON directors.id = directors_films.director_id
  GROUP BY directors.id
  ORDER BY "films directed" DESC, directors.name;

  -- as subquery

SELECT name, (SELECT count(film_id) FROM directors_films WHERE directors.id = directors_films.director_id) as "films directed"
FROM directors
ORDER BY "films directed" DESC, name;