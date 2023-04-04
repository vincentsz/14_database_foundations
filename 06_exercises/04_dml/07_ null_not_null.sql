/*
0.Query
 -description
Write two SQL queries:

    One that generates a listing of parts that currently belong to a device.
    One that generates a listing of parts that don't belong to a device.

Do not include the id column in your queries.
 -expected output
part_number | device_id
------------+-----------
         12 |         1
         14 |         1
         16 |         1
         31 |         2
         33 |         2
         35 |         2
         37 |         2
         39 |         2
(8 rows)

part_number | device_id
------------+-----------
         50 |
         54 |
         58 |
(3 rows)
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
parts that belong to a device:
left outer join parts with devices
select part_number and device_id where
device_id IS NOT NULL

parts that don't belong to a device
left outer join parts with devices
select part_number and device_id where
device_id IS NULL

*/

SELECT part_number, device_id
FROM parts
LEFT OUTER JOIN devices
ON parts.device_id = devices.id
WHERE device_id IS NOT NULL;

SELECT part_number, device_id
FROM parts
LEFT OUTER JOIN devices
ON parts.device_id = devices.id
WHERE device_id IS NULL;