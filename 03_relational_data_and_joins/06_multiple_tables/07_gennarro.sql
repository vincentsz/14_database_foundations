/*
0.Query
 -description
Write a query to print out a report of all tickets purchased by the customer with the email address 'gennaro.rath@mcdermott.co'.
The report should include the event name and starts_at and the seat's section name, row, and seat number.
 -expected output
        event        |      starts_at      |    section    | row | seat
--------------------+---------------------+---------------+-----+------
  Kool-Aid Man       | 2016-06-14 20:00:00 | Lower Balcony | H   |   10
  Kool-Aid Man       | 2016-06-14 20:00:00 | Lower Balcony | H   |   11
  Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   14
  Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   15
  Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   16
  Ultra Archangel IX | 2016-05-23 18:00:00 | Upper Balcony | G   |    7
  Ultra Archangel IX | 2016-05-23 18:00:00 | Upper Balcony | G   |    8
(7 rows)
 -returned output
       event        |      starts_at      |    section    | row | seat 
--------------------+---------------------+---------------+-----+------
 Kool-Aid Man       | 2016-06-14 20:00:00 | Lower Balcony | H   |   10
 Kool-Aid Man       | 2016-06-14 20:00:00 | Lower Balcony | H   |   11
 Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   14
 Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   15
 Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   16
 Ultra Archangel IX | 2016-05-23 18:00:00 | Upper Balcony | G   |    7
 Ultra Archangel IX | 2016-05-23 18:00:00 | Upper Balcony | G   |    8
(7 rows)
1.Understand problem
 -input:
 --tables:
 tickets, customers, seats, sections

 --columns
tickets.customer_id, tickets.event_id, tickets_seat_id
customers.id, customers.email
events.id, events.name, events.start_at
seats.id, seats.row, setas.number, seats.section_id
sections.id, sections.name

 -return:
        event        |      starts_at      |    section    | row | seat
 -rules:
  --explicit: 
  all tickets purchased by 'gennaro.rath@mcdermott.co'
  include the event name and starts_at and the seat's section name, row, and seat number
  --implicit:
2.Helper data
 -schema
 organization=# \d
                   List of relations
 Schema |       Name       |   Type   |      Owner      
--------+------------------+----------+-----------------
 public | customers        | table    | vincentsijssens
 public | customers_id_seq | sequence | vincentsijssens
 public | events           | table    | vincentsijssens
 public | events_id_seq    | sequence | vincentsijssens
 public | seats            | table    | vincentsijssens
 public | seats_id_seq     | sequence | vincentsijssens
 public | sections         | table    | vincentsijssens
 public | sections_id_seq  | sequence | vincentsijssens
 public | tickets          | table    | vincentsijssens
 public | tickets_id_seq   | sequence | vincentsijssens

 -tables
organization=# SELECT * FROM tickets LIMIT 10;
 id | event_id | seat_id | customer_id 
----+----------+---------+-------------
  1 |        1 |     152 |        8528
  2 |        1 |     153 |        8528
  3 |        1 |     365 |        9571
  4 |        1 |     395 |        7662
  5 |        1 |     396 |        7662
  6 |        1 |     397 |        7662
  7 |        1 |     398 |        7662
  8 |        1 |     240 |        6979
  9 |        1 |     241 |        6979
 10 |        1 |     411 |        5456

 organization=# SELECT * FROM customers LIMIT 10;
 id | first_name | last_name |   phone    |                email                 
----+------------+-----------+------------+--------------------------------------
  1 | Malinda    | Luettgen  | 1830178263 | malinda.luettgen@hodkiewiczrobel.org
  2 | Kevin      | Lehner    | 6298905698 | kevin.lehner@bergnaum.name
  3 | Erik       | Rodriguez | 6445040698 | erik.rodriguez@larson.com
  4 | Grover     | Larkin    | 1121572984 | grover.larkin@gerholdcummerata.biz
  5 | Stuart     | Veum      | 2372496046 | stuart.veum@monahan.net
  6 | Madelyn    | Bernier   | 5298846404 | madelyn.bernier@okeefe.info
  7 | Allen      | Kling     | 7690215543 | allen.kling@lindgrenstokes.org
  8 | Angel      | Corwin    | 1115407615 | angel.corwin@nicolascrona.info
  9 | Herbert    | Nikolaus  | 7591544841 | herbert.nikolaus@cole.com
 10 | Margarita  | Block     | 7700771425 | margarita.block@nolanrodriguez.name
(10 rows)

organization=# SELECT * FROM seats LIMIT 10;
 id | section_id | row | number 
----+------------+-----+--------
  1 |          1 | A   |      1
  2 |          1 | A   |      2
  3 |          1 | A   |      3
  4 |          1 | A   |      4
  5 |          1 | A   |      5
  6 |          1 | A   |      6
  7 |          1 | A   |      7
  8 |          1 | A   |      8
  9 |          1 | A   |      9
 10 |          1 | A   |     10
(10 rows)

organization=# SELECT * FROM sections LIMIT 10;
 id | code |     name      | price_multiplier 
----+------+---------------+------------------
  1 | ORCH | Orchestra     |            1.000
  2 | BAL1 | Lower Balcony |            0.870
  3 | BAL2 | Upper Balcony |            0.710
(3 rows)

organization=# SELECT * FROM events LIMIT 10;
 id |            name            |      starts_at      | base_price 
----+----------------------------+---------------------+------------
  1 | Kool-Aid Man               | 2016-06-14 20:00:00 |      53.00
  2 | Siren I                    | 2016-01-24 22:00:00 |      32.00
  3 | Magnificent Stardust       | 2016-03-09 20:00:00 |      28.00
  4 | A-Bomb                     | 2016-10-06 17:00:00 |      24.00
  5 | Red Hope Summers the Fated | 2016-03-24 18:00:00 |      20.00
  6 | Captain Deadshot Wolf      | 2016-05-20 17:00:00 |      47.00
  7 | Green Husk Strange         | 2016-02-28 18:00:00 |      45.00
  8 | Illustrious Firestorm      | 2016-10-21 19:00:00 |      44.00
  9 | Red Magus                  | 2016-10-09 20:00:00 |      42.00
 10 | Ultra Archangel IX         | 2016-05-23 18:00:00 |      44.00
(10 rows)
3.Data type

4.Algorithm
- Find the customer id's for 'gennaro.rath@mcdermott.co' --> just one id 6193
- Inner Join tickets and customers on customers.id and tickets.curtomer
SELECT tickets where email = 'gennaro.rath@mcdermott.co'
*/




SELECT events.name AS event, 
       events.starts_at, 
       sections.name AS section, 
       seats.row, 
       seats.number AS seat
FROM tickets
INNER JOIN customers
  ON tickets.customer_id = customers.id
INNER JOIN events
  ON tickets.event_id = events.id
INNER JOIN seats
  ON tickets.seat_id = seats.id
INNER JOIN sections
  ON seats.section_id = sections.id
WHERE customers.email = 'gennaro.rath@mcdermott.co';


-- book

SELECT events.name AS event,
       events.starts_at,
       sections.name AS section,
       seats.row,
       seats.number AS seat
  FROM tickets
  INNER JOIN events
    ON tickets.event_id = events.id
  INNER JOIN customers
    ON tickets.customer_id = customers.id
  INNER JOIN seats
    ON tickets.seat_id = seats.id
  INNER JOIN sections
    ON seats.section_id = sections.id
  WHERE customers.email = 'gennaro.rath@mcdermott.co';