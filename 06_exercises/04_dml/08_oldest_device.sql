/*
0.Query
 -description
Insert one more device into the devices table. You may use this SQL statement or create your own.

INSERT INTO devices (name) VALUES ('Magnetometer');
INSERT INTO parts (part_number, device_id) VALUES (42, 3);

Assuming nothing about the existing order of the records in the database, 
write an SQL statement that will return the name of the oldest device from our devices table.
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
SELECT name from devices
order by date_created asc
limit to 1
*/

INSERT INTO devices(name)
VALUES('Magnetometer');

INSERT INTO parts(part_number, device_id)
VALUES(42, 3);

SELECT name AS oldest_device 
FROM devices
ORDER BY created_at ASC
LIMIT 1;
