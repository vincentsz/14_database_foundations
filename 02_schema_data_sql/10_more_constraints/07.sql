-- Add a constraint to films that requires all rows to have a value for title that is at least 1 character long.

ALTER TABLE films
ADD CONSTRAINT title_length CHECK (length(title) >= 1);