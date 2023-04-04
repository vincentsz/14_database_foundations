-- Write a query to return the first name and last name of any singer who released an album in the 80s and who is still living, 
-- along with the names of the album that was released and the release date. 
-- Order the results by the singer's age (youngest first).


UPDATE singers
SET deceased = 'false'
WHERE first_name = 'Madonna';

UPDATE singers
SET deceased = 'false'
WHERE first_name = 'Bruce';


SELECT s.first_name, s.last_name, a.album_name, a.released
FROM singers AS s JOIN albums AS a
ON s.id = a.singer_id
WHERE s.deceased = 'false' AND
(a.released >= '1980-01-01' AND a.released <= '1989-12-31')
ORDER BY s.date_of_birth DESC;
