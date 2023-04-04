-- In the celebrities table, update the Elvis row so that the value in the deceased column is true. 
-- Then change the column so that it no longer allows NULL values.

UPDATE celebrities
SET deceased = true
WHERE first_name = 'Elvis';

ALTER TABLE celebrities
ALTER COLUMN deceased
SET NOT NULL;
