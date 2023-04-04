CREATE TABLE people(
  name varchar(255), 
  age integer, 
  occupation varchar(255)
);

INSERT INTO people (name, age, occupation)
VALUES ('Abby', 34, 'biologist'),
       ('Mu''nisah', 26, NULL),
       ('Mirabelle', 40, 'contractor');

      --  Write 3 SQL queries that can be used to retrieve the second row of the table shown in #1 and #2.

SELECT * FROM people
LIMIT 1
OFFSET 1;      

SELECT * FROM people
WHERE occupation IS NULL;

SELECT * FROM people
WHERE name = 'Mu''nisah';