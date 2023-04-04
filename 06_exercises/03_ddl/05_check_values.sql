/*
0.Query
 -description
The spectral_type column in the stars table is currently defined as a one-character string that contains one of the following 7 values: 
'O', 'B', 'A', 'F', 'G', 'K', and 'M'. 
However, there is currently no enforcement on the values that may be entered. 
Add a constraint to the table stars that will enforce the requirement that a row must hold one of the 7 listed values above. 
Also, make sure that a value is required for this column.

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

ALTER  TABLE stars
ADD CHECK (regexp_match ('OBAFGKM', spectral_type) IS NOT NULL);

-- or
ALTER  TABLE stars
DROP CONSTRAINT stars_spectral_type_check;

ALTER  TABLE stars
ADD CHECK ('OBAFGKM' ~ spectral_type);

-- second requirement

ALTER TABLE stars 
ALTER COLUMN spectral_type
SET NOT NULL;

-- test

INSERT INTO stars(name, distance, spectral_type, companions)
VALUES('Beetlegeus', 20030003030.2929, 'A', 9);

INSERT INTO stars(name, distance, spectral_type, companions)
VALUES('Beetlegeus 2', 20030003030.2929, 'R', 9);

-- book
ALTER TABLE stars
ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
ALTER COLUMN spectral_type SET NOT NULL;

-- further exploration

ALTER TABLE stars
DROP CONSTRAINT stars_spectral_type_check1,
ALTER COLUMN spectral_type DROP NOT NULL;

INSERT INTO stars (name, distance, companions)
           VALUES ('Epsilon Eridani', 10.5, 0);

INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Lacaille 9352', 10.68, 'X', 0);

-- solution

UPDATE stars
SET spectral_type = '?'
WHERE spectral_type ~ '[^OBAFGKM]' OR spectral_type IS NULL;

-- This replaces all invalid values w '?'

ALTER TABLE stars
ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')) NOT VALID;

-- Normally, this form will cause a scan of the table to verify that all existing rows in the table satisfy the new constraint. 
-- But if the NOT VALID option is used, this potentially-lengthy scan is skipped.

-- the '?' values will be ignored, the check is added though, so no new bad values can be added

-- the last step would be to manually clean up the bad data

ALTER TABLE stars
ALTER COLUMN spectral_type SET NOT NULL;

INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Lacaille 9352', 10.68, '?', 0);