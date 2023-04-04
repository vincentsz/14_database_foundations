/*
Based on the table schema and following information, write and execute an INSERT statement to add the appropriate data to the orders table.

There are three customers -- James Bergman, Natasha O'Shea, Aaron Muller. 

James' email address is james1998@email.com. 
Natasha's email address is natasha@osheafamily.com. 
Aaron doesn't supply an email address.

James orders a LS Chicken Burger, Fries and a Cola. 
Natasha has two orders -- an LS Cheeseburger with Fries but no drink, and an LS Double Deluxe Burger with Onion Rings and a Chocolate Shake.
Aaron orders an LS Burger with no side or drink.

The item costs and loyalty points are listed below:
Item 	Cost ($) 	Loyalty Points
LS Burger 	3.00 	10
LS Cheeseburger 	3.50 	15
LS Chicken Burger 	4.50 	20
LS Double Deluxe Burger 	6.00 	30
Fries 	0.99 	3
Onion Rings 	1.50 	5
Cola 	1.50 	5
Lemonade 	1.50 	5
Vanilla Shake 	2.00 	7
Chocolate Shake 	2.00 	7
Strawberry Shake 	2.00 	7
 */

 INSERT INTO orders (customer_name, customer_email, burger, side, drink, customer_loyalty_points, burger_cost, side_cost, drink_cost)
 VALUES ('James Bergman', 'james1998@email.com', 'LS Chicken Burger', 'Fries', 'Cola', 28, 4.50, 0.99, 1.50), 
 ('Natasha O''Shea', 'natasha@osheafamily.com', 'LS Cheeseburger', 'Fries', null, 18, 3.50, 0.99, DEFAULT),
 ('Natasha O''Shea', 'natasha@osheafamily.com', 'LS Double Deluxe Burger', 'Onion Rings', 'Chocolate Shake', 42, 6.00, 1.50, 2.00),
 ('Aaron Muller', null, 'LS Burger', null, null, 10, 3.00, DEFAULT, DEFAULT);