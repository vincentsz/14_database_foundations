-- Add two more columns to the animals table called phylum and kingdom. Both should hold strings of up to 100 characters

-- Update all the rows in the table so that phylum holds the value Chordata and kingdom holds Animalia for all the rows in the table.

ALTER TABLE animals
ADD COLUMN phylum varchar(100),
ADD COLUMN kingdom varchar(100);

UPDATE animals
SET phylum = 'Chordata', kingdom = 'Animalia';