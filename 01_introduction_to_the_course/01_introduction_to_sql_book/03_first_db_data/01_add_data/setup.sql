CREATE TABLE users(
  id serial UNIQUE NOT NULL,
  full_name varchar(25) NOT NULL,
  enabled boolean DEFAULT true,
  last_login timestamp DEFAULT now()
);