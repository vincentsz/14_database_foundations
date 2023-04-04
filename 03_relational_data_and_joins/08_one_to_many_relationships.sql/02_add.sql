/*
0.Query
 -description
Write a SQL statement to add the following call data to the database:
when 	duration 	first_name 	last_name 	number
2016-01-18 14:47:00 	632 	William 	Swift 	7204890809
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

INSERT INTO contacts(id, first_name, last_name, "number")
VALUES(6, 'William', 'Swift', 7204890809);

INSERT INTO calls(contact_id, "when", duration)
VALUES(6, '2016-01-18 14:47:00', 632);

DELETE FROM calls WHERE contact_id = 6;

DELETE FROM contacts WHERE id = 26;

--book

INSERT INTO calls ("when", duration, contact_id) VALUES ('2016-01-18 14:47:00', 632, 6);