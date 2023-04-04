SELECT users.*, addresses.*
  FROM users
  INNER JOIN addresses
  ON users.id = addresses.user_id;