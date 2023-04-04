-- Write a query to return the first name of any singer who had an album released under the Warner Bros label.
SELECT DISTINCT singers.first_name AS "First name of singer with WB release"
FROM singers JOIN albums
ON singers.id = albums.singer_id
WHERE albums.label ILIKE '%warner bros%';
