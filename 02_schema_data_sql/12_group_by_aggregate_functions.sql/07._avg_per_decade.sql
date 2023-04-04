-- Write a SQL query that determines the average duration of movies for each decade represented in the films table, 
-- rounded to the nearest minute and listed in chronological order.

/*
1.Understand problem
 -input:
 --tables:
  films
 --columns
  duration
 -return:
  average duration of movies per decade
  rounded to nearest minute
  ordered per decade ascending
 -rules:
   -explicit:
   -implicit: a decade is charachterized by first three numbers ot yesr ex (1999 -> 199, 2004 -> 200)
2.Examples & test cases
 -raised errors:
 -examples:
3.Data type
  integer
4.Algorithm
  - Convert year to decade
    - divide year by 10
  - Group the movies per decade
  - perform aggregate(avg) on duration, round
  - order by decade ascending
*/

SELECT year/10*10 AS decade, round(avg(duration)) as average_duration 
FROM films
GROUP BY decade
ORDER BY decade ASC;

-- book

SELECT year / 10 * 10 as decade, ROUND(AVG(duration)) as average_duration
  FROM films GROUP BY decade ORDER BY decade;