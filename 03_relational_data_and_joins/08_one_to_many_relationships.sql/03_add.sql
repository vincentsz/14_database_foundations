/*
0.Query
 -description
Write SQL statements to add the following call data to the database:
when 	duration 	first_name 	last_name 	number
2016-01-17 11:52:00 	175 	Merve 	Elk 	6343511126
2016-01-18 21:22:00 	79 	Sawa 	Fyodorov 	6125594874
 -expected output

 -returned output

1.Understand problem
 -input:
 --tables:

 --columns

 -return:

 -rules:
  --explicit:
  --implicit:
2.Helper data
 -schema

 -tables

3.Data type

4.Algorithm

*/
INSERT INTO contacts(first_name, last_name, number)
VALUES ('Merve', 'Elk', '6343511126'),
       ('Sawa', 'Fyodorov', '6125594874');

INSERT INTO calls (contact_id, "when", duration)
VALUES (27, '2016-01-17 11:52:00', 175),
       (28, '2016-01-18 21:22:00', 79);

-- book
INSERT INTO contacts (first_name, last_name, number) VALUES ('Merve', 'Elk', '6343511126');
INSERT INTO calls ("when", duration, contact_id) VALUES ('2016-01-17 11:52:00', 175, 26);

INSERT INTO contacts (first_name, last_name, number) VALUES ('Sawa', 'Fyodorov', '6125594874');
INSERT INTO calls ("when", duration, contact_id) VALUES ('2016-01-18 21:22:00', 79, 27);