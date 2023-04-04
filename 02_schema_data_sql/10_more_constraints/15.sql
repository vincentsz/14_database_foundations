-- Write an UPDATE statement that attempts to change the director for "Die Hard" to "Johnny". 
-- Show the error that occurs when this statement is executed.

UPDATE films
SET director = 'Johnny'
WHERE title = 'Die Hard';