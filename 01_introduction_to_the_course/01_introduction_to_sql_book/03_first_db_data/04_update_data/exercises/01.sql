-- Make sure you are connected to the encyclopedia database. 
-- Add a column to the animals table called class to hold strings of up to 100 characters.
ALTER TABLE animals
ADD COLUMN class varchar(100);