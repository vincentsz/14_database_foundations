CREATE TABLE shoes (name text, size numeric(3,1) DEFAULT 0);
ALTER TABLE shoes ADD CONSTRAINT shoe_size CHECK (size BETWEEN 1 AND 15);
INSERT INTO shoes (name) VALUES ('blue sneakers');