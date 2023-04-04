/*
0.Query
 -description
Hmm... it turns out that 25 characters isn't enough room to store a star's complete name. 
For instance, the star "Epsilon Trianguli Australis A" requires 30 characters. Modify the column so that it allows star names as long as 50 characters.

Further Exploration

Assume the stars table already contains one or more rows of data. 
What will happen when you try to run the above command? To test this, revert the modification and add a row or two of data:

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

*/

ALTER TABLE stars
ALTER COLUMN name TYPE varchar(50);

-- further exploration

ALTER TABLE stars
ALTER COLUMN name TYPE varchar(25);

INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Alpha Centauri B', 4, 'K', 3);

ALTER TABLE stars
ALTER COLUMN name TYPE varchar(50);