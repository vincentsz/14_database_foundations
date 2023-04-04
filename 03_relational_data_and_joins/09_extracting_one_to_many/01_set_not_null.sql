-- Set films.director_id to be NOT NULL now that all the rows contain a value in that column:

ALTER TABLE films
ALTER COLUMN director_id 
SET NOT NULL;