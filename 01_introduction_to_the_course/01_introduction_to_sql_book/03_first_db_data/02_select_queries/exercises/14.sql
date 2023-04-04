/* Write a query to return the customer name and email address and loyalty points from any order worth 20 or more loyalty points. 
List the results from the highest number of points to the lowest. */
SELECT customer_name, customer_email, customer_loyalty_points
FROM orders
WHERE customer_loyalty_points >= 20
ORDER BY customer_loyalty_points DESC;