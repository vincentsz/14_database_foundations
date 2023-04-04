-- surrogate key:
CREATE TABLE colors (id serial, name text);

INSERT INTO colors (name) VALUES ('red');
INSERT INTO colors (name) VALUES ('blue');
INSERT INTO colors (name) VALUES ('green');

-- shorthand for:
CREATE SEQUENCE colors_id_seq;
CREATE TABLE colors (
    id integer NOT NULL DEFAULT nextval('colors_id_seq'),
    name text
);

-- nextvl can be called in any SQL statement:
SELECT nextval('colors_id_seq');

--  nextval 
-- ---------
--        4

-- that value will not be returned again regardless of if it was stored in a row
INSERT INTO colors (name) VALUES ('yellow');

--  id |  name  
-- ----+--------
--   1 | red
--   2 | blue
--   3 | green
--   5 | yellow

-- uniqueness not enforced:
INSERT INTO colors (id, name) VALUES (2, 'purple');

--  id |  name  
-- ----+--------
--   1 | red
--   2 | blue
--   3 | green
--   5 | yellow
--   2 | purple

-- add a unique constraint:
ALTER TABLE colors ADD CONSTRAINT unique_id UNIQUE(id); 

-- check uniqueness constraint

INSERT INTO colors(id, name) VALUES (2, 'purple');

INSERT INTO colors(name) VALUES ('purple');
