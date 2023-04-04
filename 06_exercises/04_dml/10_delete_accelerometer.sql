-- Our workshop has decided to not make an Accelerometer after all. 
-- Delete any data related to "Accelerometer", this includes the parts associated with an Accelerometer.

-- - go in the schema and change the foreign key to delete on cascade
-- or
delete from parts where device_id is in a selection of devices id whee name = Accelorometer

DELETE FROM parts
WHERE device_id IN
(SELECT id FROM devices
WHERE name = 'Accelerometer');

DELETE FROM devices
WHERE name = 'Accelerometer';

-- further exploration

ALTER TABLE parts
DROP CONSTRAINT parts_device_id_fkey,
ADD FOREIGN KEY (device_id) REFERENCES devices(id) ON DELETE CASCADE;

