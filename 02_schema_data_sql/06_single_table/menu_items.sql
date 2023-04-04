-- Write a SQL statement to create the table shown below, menu_items:
-- item 	prep_time 	ingredient_cost 	sales 	menu_price
-- omelette 	10 	1.50 	182 	7.99
-- tacos 	5 	2.00 	254 	8.99
-- oatmeal 	1 	0.50 	79 	5.99

CREATE TABLE menu_items(
  item varchar(255),
  prep_time integer CHECK(prep_time > 0),
  ingredient_cost decimal(5,2) CHECK(ingredient_cost > 0),
  sales integer CHECK(sales > 0),
  menu_price decimal(5,2) CHECK(menu_price > 0)
);

INSERT INTO menu_items
VALUES ('omelette', 10, 1.5, 182, 7.99),
('tacos', 5, 2, 254, 8.99),
('oatmeal', 1, 0.50, 79, 5.99);

-- Using the table and data from #8 and #9, write a SQL query to determine which menu item is the most profitable 
-- based on the cost of its ingredients, returning the name of the item and its profit.

SELECT item, menu_price - ingredient_cost AS profit FROM menu_items
ORDER BY profit DESC LIMIT 1;

-- Write a SQL query to determine how profitable each item on the menu is based on the amount of time it takes to prepare one item. 
-- Assume that whoever is preparing the food is being paid $13 an hour. List the most profitable items first. 
-- Keep in mind that prep_time is represented in minutes and ingredient_cost and menu_price are both in dollars and cents:

-- cost of prperation of one item: ((prep_time * round((13 /60),2))*sales) + ((ingredient_cost - menu_price)*sales)/ sales

-- SELECT item, ((prep_time*sales) * round((13 /60),2) + (ingredient_cost * sales) - (menu_price * sales))/ sales AS "profit per unit" FROM menu_items
-- ORDER BY "profit per unit" DESC;


-- SELECT item, (((ingredient_cost - menu_price)*sales) - ((prep_time * round((13 /60),2))*sales)) / sales AS "profit per unit" FROM menu_items
-- ORDER BY "profit per unit" DESC;


-- cost_of_preparation = (13/60) * time_to_prepare
-- paid_by_client - (cost_of_ingredients + cost_of_preparation)


-- ((paid_by_client * sales) - ((cost_of_ingredients * sales) + (cost_preparation * sales))) / sales

-- SELECT item, ((menu_price * sales) - ((ingredient_cost * sales) + ((round((13/6),2)* prep_time) * sales))) / sales AS "profit per unit" FROM menu_items
-- ORDER BY "profit per unit" DESC;


-- SELECT item, menu_price, ingredient_cost, (round((13/60.0),2)* prep_time), menu_price - ingredient_cost - (round((13/60.0),2)* prep_time) FROM menu_items;
 
 SELECT item,
 menu_price,
 ingredient_cost,
 round(prep_time * (13/60.0), 2) AS labor,
 round(menu_price - ingredient_cost - prep_time * (13/60.0),2) AS profit
 FROM menu_items
 ORDER BY profit DESC;

--  book

SELECT item, menu_price, ingredient_cost,
       round(prep_time/60.0 * 13.0, 2) AS labor,
       menu_price - ingredient_cost - round(prep_time/60.0 * 13.0, 2) AS profit
  FROM menu_items
  ORDER BY profit DESC;