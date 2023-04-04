ALTER TABLE celebrities ALTER COLUMN last_name DROP NOT NULL;
INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth, deceased) 
VALUES ('Madonna', null, 'Singer, Actress', '1958-08-16', false),
('Prince', null, 'Singer, Songwriter, Musician, Actor', '1958-07-06', true);