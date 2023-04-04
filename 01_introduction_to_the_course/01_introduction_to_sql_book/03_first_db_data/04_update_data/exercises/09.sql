-- Add Fries to Aaron Muller's order. 
-- Make sure to add the cost ($0.99) to the appropriate field and add 3 loyalty points to the current total.

UPDATE orders
SET side = 'Fries', 
side_cost = 0.99, 
customer_loyalty_points = 13
WHERE customer_name = 'Aaron Muller'
AND id = 4;
