-- True or false: A foreign key constraint prevents NULL values from being stored in a column.

-- false, a foreign key assures data integrity, meaning a value in the foreign key column will not allow a value that does not reference 
-- a value in the primary key column of the table it's related to. Null is an absence of value, so it is allowed, 
-- except if a NOT NULL contsraint is present

-- book

-- False. As we saw above, foreign key columns allow NULL values.
-- As a result, it is often necessary to use NOT NULL and a foreign key constraint together.