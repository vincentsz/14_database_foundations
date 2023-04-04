/*
0.Query
 -description


You may have noticed that, when we created the stars and planets tables, we did not do anything to establish a relationship between the two tables. 
They are simply standalone tables that are related only by the fact that they both belong to the extrasolar database. 
However, there is no relationship between the rows of each table.

To correct this problem, add a star_id column to the planets table; 
this column will be used to relate each planet in the planets table to its home star in the stars table. 
Make sure the column is defined in such a way that it is required and must have a value that is present as an id in the stars table.

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
                                 Table "public.planets"
   Column    |     Type     | Collation | Nullable |               Default               
-------------+--------------+-----------+----------+-------------------------------------
 id          | integer      |           | not null | nextval('planets_id_seq'::regclass)
 designation | character(1) |           |          | 
 mass        | integer      |           |          | 
Indexes:
    "planets_pkey" PRIMARY KEY, btree (id)
    "planets_designation_key" UNIQUE CONSTRAINT, btree (designation)

                                           Table "public.stars"
    Column     |         Type          | Collation | Nullable |              Default              
---------------+-----------------------+-----------+----------+-----------------------------------
 id            | integer               |           | not null | nextval('stars_id_seq'::regclass)
 name          | character varying(25) |           | not null | 
 distance      | integer               |           | not null | 
 spectral_type | character(1)          |           |          | 
 companions    | integer               |           | not null | 
Indexes:
    "stars_pkey" PRIMARY KEY, btree (id)
    "stars_name_key" UNIQUE CONSTRAINT, btree (name)
Check constraints:
    "stars_companions_check" CHECK (companions >= 0)
    "stars_distance_check" CHECK (distance > 0)


 -tables

3.Data type

4.Algorithm

*/

 ALTER TABLE planets
 ADD COLUMN star_id integer REFERENCES (stars.id) NOT NULL;

 -- book

ALTER TABLE planets
ADD COLUMN star_id integer NOT NULL REFERENCES stars (id);