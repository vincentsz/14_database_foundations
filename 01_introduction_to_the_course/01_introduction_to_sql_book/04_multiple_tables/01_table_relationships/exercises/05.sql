-- We want to make our ordering system more flexible, so that customers can order any combination of burgers, sides and drinks. 
-- The first step towards doing this is to put all our product data into a separate table called products. 
-- Create a table and populate it with the following data:
-- Product Name 	Product Cost 	Product Type 	Product Loyalty Points
-- LS Burger 	3.00 	Burger 	10
-- LS Cheeseburger 	3.50 	Burger 	15
-- LS Chicken Burger 	4.50 	Burger 	20
-- LS Double Deluxe Burger 	6.00 	Burger 	30
-- Fries 	1.20 	Side 	3
-- Onion Rings 	1.50 	Side 	5
-- Cola 	1.50 	Drink 	5
-- Lemonade 	1.50 	Drink 	5
-- Vanilla Shake 	2.00 	Drink 	7
-- Chocolate Shake 	2.00 	Drink 	7
-- Strawberry Shake 	2.00 	Drink 	7

-- The table should also have an auto-incrementing id column which acts as its PRIMARY KEY. 
-- The product_type column should hold strings of up to 20 characters. 
-- Other than that, the column types should be the same as their equivalent columns from the orders table.
CREATE TABLE products (
  id serial PRIMARY KEY,
  product_name varchar(50),
  product_cost numeric(4,2),
  product_type varchar(20),
  product_loyalty_points int
);


INSERT INTO products (product_name, product_cost, product_type, product_loyalty_points)
VALUES ('LS Burger', 3.00, 'Burger', 10 ),
('LS Cheeseburger', 3.50, 'Burger', 15 ),
('LS Chicken Burger', 4.50, 'Burger', 20 ),
('LS Double Deluxe Burger', 6.00, 'Burger', 30 ),
('Fries', 1.20, 'Side', 3 ),
('Onion Rings', 1.50, 'Side', 5 ),
('Cola', 1.50, 'Drink', 5 ),
('Lemonade', 1.50, 'Drink', 5 ),
('Vanilla Shake', 2.00, 'Drink', 7 ),
('Chocolate Shake', 2.00, 'Drink', 7 ),
('Strawberry Shake', 2.00, 'Drink', 7);
