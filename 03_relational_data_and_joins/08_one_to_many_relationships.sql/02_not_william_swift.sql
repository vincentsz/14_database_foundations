/*
0.Query
 -description
Write a SQL statement to retrieve the call times, duration, and first name for all calls not made to William Swift.
 -expected output

 -returned output

1.Understand problem
 -input:
 --tables:
calls, contacts
 --columns
calls.when, calls.duration
contacts.first_name
 -return:

 -rules:
  --explicit:
  --implicit:
2.Helper data
 -schema
                  List of relations
 Schema |      Name       |   Type   |      Owner      
--------+-----------------+----------+-----------------
 public | calls           | table    | vincentsijssens
 public | calls_id_seq    | sequence | vincentsijssens
 public | contacts        | table    | vincentsijssens
 public | contacts_id_seq | sequence | vincentsijssens
(4 rows)

                                        Table "public.calls"
   Column   |            Type             | Collation | Nullable |              Default              
------------+-----------------------------+-----------+----------+-----------------------------------
 id         | integer                     |           | not null | nextval('calls_id_seq'::regclass)
 when       | timestamp without time zone |           | not null | 
 duration   | integer                     |           | not null | 
 contact_id | integer                     |           | not null | 
Indexes:
    "calls_pkey" PRIMARY KEY, btree (id)
Foreign-key constraints:
    "calls_contact_id_fkey" FOREIGN KEY (contact_id) REFERENCES contacts(id)

                                     Table "public.contacts"
   Column   |         Type          | Collation | Nullable |               Default                
------------+-----------------------+-----------+----------+--------------------------------------
 id         | integer               |           | not null | nextval('contacts_id_seq'::regclass)
 first_name | text                  |           | not null | 
 last_name  | text                  |           | not null | 
 number     | character varying(10) |           | not null | 
Indexes:
    "contacts_pkey" PRIMARY KEY, btree (id)
Referenced by:
    TABLE "calls" CONSTRAINT "calls_contact_id_fkey" FOREIGN KEY (contact_id) REFERENCES contacts(id)
 -tables

3.Data type

4.Algorithm

*/

SELECT calls.when, calls.duration, contacts.first_name
FROM calls
JOIN contacts
ON calls.contact_id = contacts.id
WHERE first_name != 'William' AND last_name != 'Swift';

-- book

sql-course=# SELECT calls.when, calls.duration, contacts.first_name
sql-course-# FROM calls INNER JOIN contacts ON calls.contact_id = contacts.id
sql-course-# WHERE (contacts.first_name || ' ' || contacts.last_name) != 'William Swift';
--         when         | duration | first_name
-- ---------------------+----------+------------
--  2016-01-08 15:30:00 |      350 | Yuan
--  2016-01-11 11:06:00 |      111 | Tamila
--  2016-01-13 18:13:00 |     2521 | Tamila
--  2016-01-17 09:43:00 |      982 | Yuan
-- (4 rows)