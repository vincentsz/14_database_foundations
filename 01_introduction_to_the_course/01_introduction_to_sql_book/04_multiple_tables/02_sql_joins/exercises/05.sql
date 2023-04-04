-- Write a query to return the first name and last name of any singer without an associated album entry.
SELECT singers.first_name, singers.last_name
FROM singers LEFT JOIN albums
ON singers.id = albums.singer_id
WHERE albums.id IS NULL;
