--  id |      name
-- ----+----------------
--   1 | William Gibson
--   2 | Iain M. Banks
--   3 | Philip K. Dick
-- (3 rows)

--  id |        title         |     isbn      | author_id
-- ----+----------------------+---------------+-----------
--   1 | Neuromancer          | 9780441569595 |         1
--   2 | Consider Phlebas     | 9780316005388 |         2
--   3 | Idoru                | 9780425158647 |         1
--   4 | The State of the Art | 0929480066    |         2
--   5 | The Simulacra        | 9780547572505 |         3
--   6 | Pattern Recognition  | 9780425198681 |         1
--   7 | A Scanner Darkly     | 9780547572178 |         3
-- (7 rows)

INSERT INTO authors(name)
VALUES ('William Gibson'),
       ('Iain M. Banks'),
       ('Philip K. Dick');

ALTER TABLE books
ALTER COLUMN isbn TYPE text;

ALTER TABLE books
DROP CONSTRAINT books_isbn_check;

ALTER TABLE books
ADD CHECK (isbn ~ '[^0-9$]{10,13}');

ALTER TABLE books
ALTER COLUMN isbn
DROP NOT NULL;

ALTER TABLE books
ALTER COLUMN isbn
SET NOT NULL;

INSERT INTO books(title, isbn, author_id)
VALUES ('Neuromancer', '9780441569595', 1),
       ('Consider Phlebas', '9780316005388', 2),
       ('Idoru', '9780425158647', 1),
       ('The State of the Art', '0929480066', 2),
       ('The Simulacra', '9780547572505', 3),
       ('Pattern Recognition', '9780425198681', 1),
       ('A Scanner Darkly', '9780547572178', 3);

-- =, can only be used on subquery that returns one value 
SELECT title FROM books WHERE author_id = 
  (SELECT id FROM authors WHERE name = 'William Gibson');

-- EXISTS 
-- not so common, used in correlated subqueries

SELECT 1 WHERE EXISTS
  (SELECT id FROM bidders WHERE name = 'Alison Walker');

-- IN
-- look for author's name that have written books that start with the, use subquery
SELECT name FROM authors WHERE id IN
  (SELECT author_id FROM books WHERE title LIKE 'The%');

-- NOT IN
-- look for author's names that have not written any books that start with 'The'

SELECT name FROM authors WHERE id NOT IN
  (SELECT author_id FROM books WHERE title LIKE 'The%');

-- ANY/ SOME

-- select author names where the length of the name is bigger than the length of any book that starts with 'The'
SELECT name FROM authors WHERE length(name) > ANY
  (SELECT length(title) FROM books WHERE title LIKE 'The%');

  -- ALL
  -- select author names where their length is bigger than the length of all of the books with titles that start with 'The'

  SELECT name FROM authors WHERE length(name) > ALL
    (SELECT length(title) FROM books WHERE title LIKE 'The%');