-- Write a SQL statement that will update the given_name values to be all uppercase for all users with an email address that contains teleworm.us.

UPDATE people
  SET given_name = upper(given_name)
  WHERE email LIKE '%@teleworm.us';

-- book

UPDATE people SET given_name = UPPER(given_name) WHERE email LIKE '%teleworm.us';