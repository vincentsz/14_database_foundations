UPDATE users
SET enabled = true
WHERE full_name= 'Harry Potter'
OR full_name = 'Jane Smith';

UPDATE users
SET full_name = 'Alice Walker'
WHERE id = 2;