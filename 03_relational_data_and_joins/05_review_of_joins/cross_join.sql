-- cross join

SELECT * FROM comments CROSS JOIN users;

-- old cross join syntax, same as above:

SELECT * FROM comments, users;

-- used to emulate inner join:

SELECT * FROM comments, users
WHERE comments.user_id = users.id;

-- inner join

SELECT * FROM comments INNER JOIN users 
ON comments.user_id = users.id;