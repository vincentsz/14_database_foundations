-- Change the name of the celebrities table to singers, and remove anyone who isn't a singer.

ALTER TABLE celebrities
RENAME TO singers;

DELETE FROM singers
WHERE occupation NOT ILIKE '%singer%';