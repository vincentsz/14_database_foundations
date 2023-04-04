/*
0.Query
 -description
-- Now that we have the infrastructure for our workshop set up, 
-- let's start adding in some data. Add in two different devices. 
-- One should be named, "Accelerometer". The other should be named, "Gyroscope".

-- The first device should have 3 parts (this is grossly simplified). 
-- The second device should have 5 parts. The part numbers may be any number between 1 and 10000. 
-- There should also be 3 parts that don't belong to any device yet.

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
 -tables

3.Data type

4.Algorithm

*/
ALTER TABLE parts
ALTER COLUMN device_id
DROP NOT NULL;

INSERT INTO devices(name)
VALUES ('Accelerometer'),
       ('Gyroscope');

INSERT INTO parts(part_number, device_id)
VALUES (1, 1),
       (2, 1),
       (3, 1),
       (4, 2),
       (5, 2),
       (6, 2),
       (7, 2),
       (8, 2),
       (9, NULL),
       (10, NULL),
       (11, NULL);