/*
0.Query
 -description
For many of the closest stars, we know the distance from Earth fairly accurately; for instance, 
Proxima Centauri is roughly 4.3 light years away. 
Our database, as currently defined, only allows integer distances, so the most accurate value we can enter is 4. 
Modify the distance column in the stars table so that it allows fractional light years to any degree of precision required.
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
ALTER COLUMN distance TYPE numeric;

-- further exploration

ALTER TABLE stars
ALTER COLUMN distance TYPE integer;

INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Alpha Orionis', 643, 'M', 9);

ALTER TABLE stars
ALTER COLUMN distance TYPE numeric ;

-- Further exploration: going from the integer type to the numeric type will invoke an implicit cast on any existing data, 
-- and the type alteration will run without a problem. To get a list of all the types that will implicitly cast to numeric:

SELECT castsource::regtype
FROM   pg_cast
WHERE  casttarget = 'numeric'::regtype                                          
AND    castcontext = 'i';

-- This statement will have this result:

--  castsource 
-- ------------
--  bigint
--  smallint
--  integer
--  numeric

-- Meaning, a column with any of these types will convert to numeric with no need for an explicit cast and no data loss.

-- As for going the other way, integers don't support fractional values by definition, 
-- so any cast from a type that does will have any fractional values truncated. 
-- SELECT 4.3::integer; will demonstrate this in simple terms. The same is true when altering the type in a column. 
-- Changing the type from numeric to integer will lose all fractional data.

-- If this is a concern in a particular situation, then, well, don't do it! 
-- If you need to keep fractional data, then integer is the wrong data type to use. 
-- The only reason to make the change is because you realize that you don't need to keep numbers of any further precision than whole numbers, 
-- and can safely lose any decimal values. (If you wanted to round to the nearest whole number instead of truncating the decimal values, 
-- you could add a USING clause.)