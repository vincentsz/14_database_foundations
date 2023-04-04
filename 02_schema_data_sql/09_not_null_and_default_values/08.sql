UPDATE temperatures
   SET rainfall = (high + low) / 2 - 35
WHERE (high + low) / 2 > 35;

ALTER TABLE temperatures ALTER COLUMN rainfall TYPE decimal(6,3);

UPDATE temperatures
SET rainfall = rainfall * 0.039;

SELECT * FROM temperatures;