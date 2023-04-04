-- It seems we are done with our birds table, and no longer have a need for it in our animals database. 
-- Write an SQL statement that will drop the birds table and all its data from the animals database.



CREATE TABLE table_name(
id serial PRIMARY KEY,
_id int,
FOREIGN KEY (_id)
REFERENCES target_table(id)
ON DELETE CASCADE
);

CREATE TABLE table_name(
id serial PRIMARY KEY,
_id int,
FOREIGN KEY (_id)
REFERENCES target_table(id)
ON DELETE CASCADE
);

ALTER TABLE table_name
ADD FOREIGN KEY (column) REFERENCES table(id)
ON DELETE CASCADE;

ALTER TABLE table_name
DROP CONSTRAINT table_name_column_fkey;

ALTER TABLE table
ALTER COLUMN column
SET NOT NULL;

CREATE TABLE data_type_test(
test_text text,
test_integer int
);

INSERT INTO data_type_test (test_text, test_integer)
VALUES ('1', 1),
       (2, '2');

SELECT * FROM data_type_test;

ALTER TABLE data_type_test
ALTER COLUMN test_text
SET DEFAULT 0;

INSERT INTO data_type_test (test_text, test_integer)
VALUES (NULL, 2);

INSERT INTO data_type_test (test_integer)
VALUES (2);


ALTER TABLE table
ALTER COLUMN column
SET DEFAULT value;

ALTER TABLE table
ALTER COLUMN column
DROP DEFAULT;

ALTER TABLE table
ADD CONSTRAINT table_column_check
CHECK (column conditional);

CREATE TABLE table_name(
id serial PRIMARY KEY,
test text CHECK(test = 'this')
);

INSERT INTO table_name (test)
VALUES ('this');

INSERT INTO table_name (test)
VALUES ('that');

SELECT concat('no', ' ', 'way');

SELECT upper('uppercased');

SELECT lower('LOWERCASED');