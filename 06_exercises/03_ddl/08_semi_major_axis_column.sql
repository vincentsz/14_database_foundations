-- Add a semi_major_axis column for the semi-major axis of each planet's orbit; 
-- the semi-major axis is the average distance from the planet's star as measured in astronomical units 
-- (1 AU is the average distance of the Earth from the Sun). Use a data type of numeric, 
-- and require that each planet have a value for the semi_major_axis.

ALTER TABLE planets
ADD COLUMN semi_major_axis numeric NOT NULL;

-- further exploration
ALTER TABLE planets
DROP COLUMN semi_major_axis;

DELETE FROM stars;
INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Alpha Centauri B', 4.37, 'K', 3);
INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Epsilon Eridani', 10.5, 'K', 0);

INSERT INTO planets (designation, mass, star_id)
           VALUES ('b', 0.0036, 9); -- check star_id; see note below
INSERT INTO planets (designation, mass, star_id)
           VALUES ('c', 0.1, 10);

ALTER TABLE planets
ADD COLUMN semi_major_axis numeric NOT NULL;

-- ERROR:  column "semi_major_axis" of relation "planets" contains null values

-- we forgo NOT NULL

ALTER TABLE planets
ADD COLUMN semi_major_axis numeric; 

-- we give the semi-major axis values

UPDATE planets
SET semi_major_axis = 40
WHERE star_id = 10;

UPDATE planets
SET semi_major_axis = 0.04
WHERE star_id = 9;

-- and now we can set NOT NULL

ALTER TABLE planets
ALTER COLUMN semi_major_axis
SET NOT NULL;