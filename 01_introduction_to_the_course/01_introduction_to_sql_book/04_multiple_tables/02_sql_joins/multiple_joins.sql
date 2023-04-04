SELECT users.*, books.*, checkouts.*
FROM users
INNER JOIN checkouts
  ON users.id = checkouts.user_id
INNER JOIN books
ON books.id = checkouts.book_id;