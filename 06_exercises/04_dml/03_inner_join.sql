/*
0.Query
 -description
Write an SQL query to display all devices along with all the parts that make them up. 
We only want to display the name of the devices. Its parts should only display the part_number.

 -expected output
     name      | part_number
---------------+-------------
 Accelerometer |          12
 Accelerometer |          14
 Accelerometer |          16
 Gyroscope     |          31
 Gyroscope     |          33
 Gyroscope     |          35
 Gyroscope     |          37
 Gyroscope     |          39
(8 rows)

NOTE: The part numbers and sequence may vary from those shown above.

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

                                        Table "public.devices"
   Column   |            Type             | Collation | Nullable |               Default               
------------+-----------------------------+-----------+----------+-------------------------------------
 id         | integer                     |           | not null | nextval('devices_id_seq'::regclass)
 name       | text                        |           | not null | 
 created_at | timestamp without time zone |           |          | CURRENT_TIMESTAMP
Indexes:
    "devices_pkey" PRIMARY KEY, btree (id)
Referenced by:
    TABLE "parts" CONSTRAINT "parts_device_id_fkey" FOREIGN KEY (device_id) REFERENCES devices(id)

                               Table "public.parts"
   Column    |  Type   | Collation | Nullable |              Default              
-------------+---------+-----------+----------+-----------------------------------
 id          | integer |           | not null | nextval('parts_id_seq'::regclass)
 part_number | integer |           | not null | 
 device_id   | integer |           |          | 
Indexes:
    "parts_pkey" PRIMARY KEY, btree (id)
    "parts_part_number_key" UNIQUE CONSTRAINT, btree (part_number)
Foreign-key constraints:
    "parts_device_id_fkey" FOREIGN KEY (device_id) REFERENCES devices(id)
 -tables

3.Data type

4.Algorithm
Inner Join device with parts on devices.id = parts.device_id (gives you device w each associated part)
select device name and part number
*/

--inner join
SELECT devices.name, parts.part_number
FROM devices
INNER JOIN parts
ON devices.id = parts.device_id;

--subquery
SELECT
    (SELECT name FROM devices WHERE devices.id = parts.device_id) AS name, 
    parts.part_number 
FROM parts
WHERE device_id IS NOT NULL;
