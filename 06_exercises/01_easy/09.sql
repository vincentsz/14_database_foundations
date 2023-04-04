-- It seems we are done with our birds table, and no longer have a need for it in our animals database. 
-- Write an SQL statement that will drop the birds table and all its data from the animals database.

DROP TABLE birds;

-- verification

DROP TABLE IF EXISTS birds;

-- multiple tables

DROP TABLE birds, reptiles;