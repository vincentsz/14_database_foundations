/*
0.Query description
Write a SQL query that will return the following data:

   genre   | total_duration
-----------+----------------
 horror    |            113
 thriller  |            113
 action    |            132
 crime     |            175
 drama     |            198
 espionage |            245
 comedy    |            407
 scifi     |            632

   genre   | total_duration 
-----------+----------------
 horror    |            113
 thriller  |            113
 action    |            132
 crime     |            175
 drama     |            198
 espionage |            245
 comedy    |            407
 scifi     |            632
(8 rows)
1.Understand problem
 -input:
 --tables:
films
 --columns
genre, duration
 -return:
genre, total duration per genre
 -rules:
  --explicit:
  --implicit:
2.Examples & test cases
 -raised errors:
 -examples:
3.Data type
varchar, integer
4.Algorithm
select genre
select total duration as total_duartion
group by genre
order by total_duration ascending
*/

SELECT genre, sum(duration) as total_duration FROM films
GROUP BY genre
ORDER BY total_duration, genre ASC;

CREATE TABLE peoples (
  id serial,
  name varchar(50)
);

INSERT INTO peoples (name)
VALUES ('tom'),
       ('tim'),
       ('tam');

INSERT INTO peoples (id, name)
VALUES (1, 'laura');