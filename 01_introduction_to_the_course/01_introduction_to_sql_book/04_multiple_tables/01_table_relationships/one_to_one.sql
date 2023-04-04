/*
one-to-one: User has one address
*/

CREATE TABLE addresses (
  user_id int, -- Both a primary and foreign key
  street varchar(30) NOT NULL,
  city varchar(30) NOT NULL,
  state varchar(30) NOT NULL,
  PRIMARY KEY (user_id),
  FOREIGN KEY (user_id)
    REFERENCES users (id)
    ON DELETE CASCADE
);

INSERT INTO addresses (user_id, street, city, state)
VALUES 
  (1, '1 Main Street', 'San Francisco', 'CA'),
  (2, '2 Elm Street', 'San Francisco', 'CA'),
  (3, '112 8th Avenue', 'Boston', 'MA'),
  (5, '123 Arlington Road', 'Boston', 'MA');

  INSERT INTO addresses (user_id, street, city, state)
  VALUES 1, '1 test street', 'test city', 'TS';