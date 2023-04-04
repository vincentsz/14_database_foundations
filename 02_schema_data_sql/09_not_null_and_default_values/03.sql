-- Write the SQL statement to create a table called temperatures to hold the following data:

--     date    | low | high
-- ------------+-----+------
--  2016-03-01 | 34  | 43
--  2016-03-02 | 32  | 44
--  2016-03-03 | 31  | 47
--  2016-03-04 | 33  | 42
--  2016-03-05 | 39  | 46
--  2016-03-06 | 32  | 43
--  2016-03-07 | 29  | 32
--  2016-03-08 | 23  | 31
--  2016-03-09 | 17  | 28

-- Keep in mind that all rows in the table should always contain all three values

CREATE TABLE temperatures(
  date integer NOT NULL,
  low integer NOT NULL,
  high integer NOT NULL
);

ALTER TABLE temperatures DROP COLUMN date;

ALTER TABLE temperatures
ADD COLUMN date date NOT NULL;