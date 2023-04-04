SELECT u.full_name, b.title, c.checkout_date
  FROM users AS u
  INNER JOIN checkouts AS c
  ON u.id = c.user_id
  INNER JOIN books AS b
  ON b.id = c.book_id;