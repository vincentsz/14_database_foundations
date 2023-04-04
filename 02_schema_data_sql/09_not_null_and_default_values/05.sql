-- Write a SQL statement to determine the average (mean) temperature (divide the sum of the high and low temperatures by two) for each day
--  from March 2, 2016 through March 8, 2016. 
-- Make sure to round each average value to one decimal place

-- SELECT date, (low + high) / 2 AS average temperature FROM temperatures
-- WHERE date >= '2016-03-02' AND date <= '2016-03-08'


-- SELECT date, CAST(((low + high) / 2) AS DECIMAL(3,1)) AS decimal_value FROM temperatures
-- WHERE date >= '2016-03-02' AND date <= '2016-03-08'
;


SELECT date, ROUND((low +high)/2.0, 1) AS average_temperature FROM temperatures
WHERE date >= '2016-03-02' AND date <= '2016-03-08';

-- book

SELECT date, ROUND((high + low) / 2.0, 1) as average
  FROM temperatures
 WHERE date BETWEEN '2016-03-02' AND '2016-03-08';