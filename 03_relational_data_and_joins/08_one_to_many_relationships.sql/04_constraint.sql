-- Add a constraint to contacts that prevents a duplicate value being added in the column number.

ALTER TABLE contacts
ADD CONSTRAINT unique_number UNIQUE (number);

-- book
ALTER TABLE contacts ADD CONSTRAINT number_unique UNIQUE (number);