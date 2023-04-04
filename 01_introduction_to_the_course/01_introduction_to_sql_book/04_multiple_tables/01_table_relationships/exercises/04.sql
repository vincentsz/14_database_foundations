-- Connect to the ls_burger database. 
-- If you run a simple SELECT query to retrieve all the data from the orders table, 
-- you will see it is very unnormalised. We have repetition of item names and costs and of customer data.

-- SELECT * FROM orders;

--  id | customer_name  |         burger          |    side     |      drink      |     customer_email      | customer_loyalty_points | burger_cost | side_cost | drink_cost
-- ----+----------------+-------------------------+-------------+-----------------+-------------------------+-------------------------+-------------+-----------+------------
--   3 | Natasha O'Shea | LS Double Deluxe Burger | Onion Rings | Chocolate Shake | natasha@osheafamily.com |                      42 |        6.00 |      1.50 |       2.00
--   2 | Natasha O'Shea | LS Cheeseburger         | Fries       |                 | natasha@osheafamily.com |                      18 |        3.50 |      1.20 |       0.00
--   1 | James Bergman  | LS Chicken Burger       | Fries       | Lemonade        | james1998@email.com     |                      28 |        4.50 |      1.20 |       1.50
--   4 | Aaron Muller   | LS Burger               | Fries       |                 |                         |                      13 |        3.00 |      1.20 |       0.00
-- (4 rows)

-- We want to break this table up into multiple tables. 
-- First of all create a customers table to hold the customer name data and an email_addresses table 
-- to hold the customer email data. Create a one-to-one relationship between them, 
-- ensuring that if a customer record is deleted so is the equivalent email address record. 
-- Populate the tables with the appropriate data from the current orders table.

CREATE TABLE customers(
  id serial PRIMARY KEY,
  customer_name varchar(100) NOT NULL
);

CREATE TABLE email_addresses (
  customer_id int PRIMARY KEY,
  customer_email varchar(50),
  FOREIGN KEY (customer_id)
    REFERENCES customers(id)
    ON DELETE CASCADE
);

INSERT INTO customers (customer_name)
VALUES ('James Bergman'),
('Natasha O''Shea'),
('Aaron Muller');

INSERT INTO email_addresses (customer_id, customer_email)
VALUES (1, 'james1998@email.com'),
(2, 'natasha@osheafamily.com');
