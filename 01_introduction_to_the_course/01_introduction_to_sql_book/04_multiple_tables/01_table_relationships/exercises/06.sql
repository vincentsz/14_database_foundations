-- To associate customers with products, we need to do two more things:

--     Alter or replace the orders table so that we can associate a customer with one or more orders 
--     (we also want to record an order status in this table).
--     Create an order_items table so that an order can have one or more products associated with it.

-- Based on the order descriptions below, amend and create the tables as necessary and populate them with the appropriate data.

-- James has one order, consisting of a Chicken Burger, Fries, Onion Rings, and a Lemonade. It has a status of 'In Progress'.

-- Natasha has two orders. The first consists of a Cheeseburger, Fries, and a Cola, and has a status of 'Placed'; 
-- the second consists of a Double Deluxe Burger, a Cheeseburger, two sets of Fries, Onion Rings, a Chocolate Shake and a Vanilla Shake, 
-- and has a status of 'Complete'.

-- Aaron has one order, consisting of an LS Burger and Fries. It has a status of 'Placed'.

-- Assume that the order_status field of the orders table can hold strings of up to 20 characters.

DROP TABLE orders;

CREATE TABLE orders (
  id serial PRIMARY KEY,
  customer_id int,
  order_status varchar(20),
  FOREIGN KEY(customer_id)
    REFERENCES customers(id)
    ON DELETE CASCADE
);

CREATE TABLE order_items(
  id serial PRIMARY KEY,
  order_id int NOT NULL,
  product_id int NOT NULL,
  FOREIGN KEY (order_id)
    REFERENCES orders(id)
    ON DELETE CASCADE,
  FOREIGN KEY(product_id)
    REFERENCES products(id)
    ON DELETE CASCADE
);

INSERT INTO orders (customer_id, order_status)
VALUES 
(1, 'In Progress'),
(2, 'Placed'),
(2, 'Complete'),
(3, 'Placed');

INSERT INTO order_items (order_id, product_id)
VALUES
(1, 3),
(1, 5),
(1, 6),
(1, 8),
(2, 2),
(2, 5),
(2, 7),
(3, 4),
(3, 2),
(3, 5),
(3, 5),
(3, 6),
(3, 10),
(3, 9),
(4, 1),
(4, 5);
