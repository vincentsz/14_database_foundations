/*
0.Query
 -description
We want to grab all parts that have a part_number that starts with 3. 
Write a SELECT query to get this information. This table may show all attributes of the parts table.
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

*/

SELECT * FROM parts
WHERE substring(part_number::text for 1) = '3';

-- book

SELECT * FROM parts
WHERE part_number::text LIKE '3%';