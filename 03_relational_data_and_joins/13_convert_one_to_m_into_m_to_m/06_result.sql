-- Write a SQL statement that will return the following result:

--            title           |         name
-- ---------------------------+----------------------
--  12 Angry Men              | Sidney Lumet
--  1984                      | Michael Anderson
--  Casablanca                | Michael Curtiz
--  Die Hard                  | John McTiernan
--  Let the Right One In      | Michael Anderson
--  The Birdcage              | Mike Nichols
--  The Conversation          | Francis Ford Coppola
--  The Godfather             | Francis Ford Coppola
--  Tinker Tailor Soldier Spy | Tomas Alfredson
--  Wayne's World             | Penelope Spheeris
-- (10 rows)

SELECT films.title, directors.name 
  FROM films
    JOIN directors_films
      ON films.id = directors_films.film_id
    JOIN directors
      ON directors_films.director_id = directors.id
  ORDER BY films.title;

-- book

SELECT films.title, directors.name
  FROM films
    INNER JOIN directors_films ON directors_films.film_id = films.id
    INNER JOIN directors ON directors.id = directors_films.director_id
  ORDER BY films.title ASC;