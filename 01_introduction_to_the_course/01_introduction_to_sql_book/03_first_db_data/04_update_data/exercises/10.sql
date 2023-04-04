-- The cost of Fries has increased to $1.20. Update the data in the table to reflect this.
UPDATE orders
SET side_cost = 1.20
WHERE side = 'Fries';