    /*
    0.Query description and expected output
    Write a query that returns the name of each event and how many tickets were sold for it, in order from most popular to least popular.

                name            | popularity
----------------------------+------------
  A-Bomb                     |        555
  Captain Deadshot Wolf      |        541
  Illustrious Firestorm      |        521
  Siren I                    |        457
  Kool-Aid Man               |        439
  Green Husk Strange         |        414
  Ultra Archangel IX         |        359
  Red Hope Summers the Fated |        307
  Magnificent Stardust       |        134
  Red Magus                  |         56

              name            | popularity 
----------------------------+------------
 A-Bomb                     |        555
 Captain Deadshot Wolf      |        541
 Illustrious Firestorm      |        521
 Siren I                    |        457
 Kool-Aid Man               |        439
 Green Husk Strange         |        414
 Ultra Archangel IX         |        359
 Red Hope Summers the Fated |        307
 Magnificent Stardust       |        134
 Red Magus                  |         56
 
    1.Understand problem
     -input:
     --tables:
tickets
events    
     --columns
events.name
tickets.id
     -return:
name of each event (name)
how many tickets were sol for it (popularity)
     -rules:
      --explicit: order from most poular to least DESC
      --implicit:
    2.Helper tables

  id  | event_id | seat_id | customer_id 
------+----------+---------+-------------
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
   11 |        1 |     449 |         591
   12 |        1 |     450 |         591
   13 |        1 |     399 |        9681
   14 |        1 |     400 |        9681
   15 |        1 |     482 |        3915
   16 |        1 |     195 |        4309
   17 |        1 |     196 |        4309
   18 |        1 |     545 |        9559
   19 |        1 |     620 |        3359
   ...

organization=# SELECT * FROM events;
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
varchar, integer    
    4.Algorithm
  Left outer Join tickets and events on tickets.eventd_id and events.id, so all events are included even thos wo any sold tickets
  group by event (events.id)
  count the the times an event appears in a group (count events.id) as popularity
  order by popularity descending
  select name and popularity
    */


SELECT e.name, count(e.id) AS popularity
FROM events AS e
LEFT JOIN tickets AS t
ON t.event_id = e.id
GROUP BY e.id
ORDER BY popularity DESC;