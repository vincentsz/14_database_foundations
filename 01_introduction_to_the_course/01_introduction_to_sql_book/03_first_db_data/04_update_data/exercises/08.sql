-- Connect to the ls_burger database. Change the drink on James Bergman's order from a Cola to a Lemonade.
UPDATE orders
SET drink = 'Lemonade'
WHERE id = '1'
AND customer_name = 'James BERGMAN';