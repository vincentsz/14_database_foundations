-- Each day, it rains one millimeter for every degree the average temperature goes above 35. 
-- Write a SQL statement to update the data in the table temperatures to reflect this.

UPDATE temperatures
  SET rainfall = (low + high)/2 - 35
  WHERE (low + high)/2 > 35;

SELECT date, low, high, rainfall FROM temperatures;

-- book
UPDATE temperatures
   SET rainfall = (high + low) / 2 - 35
 WHERE (high + low) / 2 > 35;