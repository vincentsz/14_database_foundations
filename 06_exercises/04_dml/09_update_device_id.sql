/*
0.Query
 -description
We've realized that the last two parts we're using for device number 2, "Gyroscope", actually belong to an "Accelerometer". 
Write an SQL statement that will associate the last two parts from our parts table with an "Accelerometer" instead of a "Gyroscope".
 -expected output

 -returned output

1.Understand problem
 -input:
 --tables:

 --columns

 -return:

 -rules:
  --explicit:
  --implicit:
2.Helper data
 -schema

 -tables

3.Data type

4.Algorithm
we want to change the device_id from 2 to 1 for the 2 parts with the highest id that have a device of 2
*/
SELECT * FROM parts;

UPDATE parts
SET device_id = 1
WHERE device_id = 2 AND id > 6;

-- if you dont know the highest ids:
UPDATE parts 
SET device_id = 1
WHERE part_number IN (
  SELECT part_number
  FROM parts 
  WHERE device_id = 2
  ORDER BY part_number DESC
  LIMIT 2
);

--further exploration
-- What if we wanted to set the part with the smallest part_number to be associated with "Gyroscope"? How would we go about doing that?
UPDATE parts
SET device_id = 2
WHERE part_number IN
(SELECT part_number FROM parts
ORDER BY part_number ASC
LIMIT 1);
