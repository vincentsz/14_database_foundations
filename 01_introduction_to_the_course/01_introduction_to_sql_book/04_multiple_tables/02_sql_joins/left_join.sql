SELECT users.*, addresses.*
  FROM users
  LEFT JOIN addresses
  ON users.id = addresses.user_id;