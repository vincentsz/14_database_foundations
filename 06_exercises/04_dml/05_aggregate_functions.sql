/*
0.Query
 -description
Write an SQL query that returns a result table with the name of each device in our database together with the number of parts for that device.
 -expected output

 -returned output

1.Understand problem
 -input:
 --tables:
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
Inner join device table with parts where device.id = part.device_id
This gives you the overlap of each device and part
group by device.id
select name and the count of device.id
*/

SELECT d.name, count(d.id)
FROM devices AS d
INNER JOIN parts AS p
ON d.id = p.device_id
GROUP BY d.id;
--if there were a device wo parts, this would be wrong, you need an outer join!

SELECT d.name, count(d.id)
FROM devices AS d
LEFT OUTER JOIN parts AS p
ON d.id = p.device_id
GROUP BY d.id;