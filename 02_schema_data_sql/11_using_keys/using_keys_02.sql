-- 'Godzilla', 1998, 'scifi', 'Roland Emmerich', 139
-- 'Godzilla', 2014, 'scifi', 'Gareth Edwards', 123

INSERT INTO films VALUES ('Godzilla', 1998, 'scifi', 'Roland Emmerich', 139);
INSERT INTO films VALUES ('Godzilla', 2014, 'scifi', 'Gareth Edwards', 123);

UPDATE films SET duration = 123 WHERE title = 'Godzilla' AND directot = "Roland Emmerich";