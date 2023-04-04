/*
0.Query description
Write a SQL query that will return the following data:

 decade |   genre   |                  films
--------+-----------+------------------------------------------
   1940 | drama     | Casablanca
   1950 | drama     | 12 Angry Men
   1950 | scifi     | 1984
   1970 | crime     | The Godfather
   1970 | thriller  | The Conversation
   1980 | action    | Die Hard
   1980 | comedy    | Hairspray
   1990 | comedy    | Home Alone, The Birdcage, Wayne's World
   1990 | scifi     | Godzilla
   2000 | espionage | Bourne Identity
   2000 | horror    | 28 Days Later
   2010 | espionage | Tinker Tailor Soldier Spy
   2010 | scifi     | Midnight Special, Interstellar, Godzilla
(13 rows)


1.Understand problem
 -input:
 --tables:
films
 --columns
year, genre, title
 -return:
decade, genre, films
 -rules:
  --explicit:
  --implicit: 
    - decade columns are created for each movie
    - titles are concatenated when decade and genre coincide, represented as films
    - results are grouped by films
    - results are ordered by decade, ascending
2.Examples & test cases
 -raised errors:
 -examples:
3.Data type

4.Algorithm

*/
SELECT year / 10 * 10 as decade, genre, title FROM films;

SELECT year / 10 * 10 as decade, genre, string_agg(title, ', ') as films 
FROM films
GROUP BY decade, genre
ORDER BY decade ASC;

SELECT year / 10 * 10 AS decade, genre, string_agg(title, ', ') AS films
  FROM films GROUP BY decade, genre ORDER BY decade, genre;