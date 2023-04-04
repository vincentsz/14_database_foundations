-- Write a SQL statement to add a new column, rainfall, to the temperatures table. 
-- It should store millimeters of rain as integers and have a default value of 0.

ALTER TABLE temperatures
ADD COLUMN rainfall integer DEFAULT 0;

