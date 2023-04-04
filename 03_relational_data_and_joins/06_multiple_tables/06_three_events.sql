/*
0.Query
 -description
Write a query that returns the user id, email address, and number of events for all customers that have purchased tickets to three events.
 -expected output
  id   |                email                 | count
-------+--------------------------------------+-------
  141  | isac.hayes@herzog.net                |     3
  326  | tatum.mraz@schinner.org              |     3
  624  | adelbert.yost@kleinwisozk.io         |     3
  1719 | lionel.feeney@metzquitzon.biz        |     3
  2058 | angela.ruecker@reichert.co           |     3
  3173 | audra.moore@beierlowe.biz            |     3
  4365 | ephraim.rath@rosenbaum.org           |     3
  6193 | gennaro.rath@mcdermott.co            |     3
  7175 | yolanda.hintz@binskshlerin.com       |     3
  7344 | amaya.goldner@stoltenberg.org        |     3
  7975 | ellen.swaniawski@schultzemmerich.net |     3
  9978 | dayana.kessler@dickinson.io          |     3
(12 rows)
 -returned output
  id  |                email                 | count 
------+--------------------------------------+-------
  141 | isac.hayes@herzog.net                |     3
  326 | tatum.mraz@schinner.org              |     3
  624 | adelbert.yost@kleinwisozk.io         |     3
 1719 | lionel.feeney@metzquitzon.biz        |     3
 2058 | angela.ruecker@reichert.co           |     3
 3173 | audra.moore@beierlowe.biz            |     3
 4365 | ephraim.rath@rosenbaum.org           |     3
 6193 | gennaro.rath@mcdermott.co            |     3
 7175 | yolanda.hintz@binskshlerin.com       |     3
 7344 | amaya.goldner@stoltenberg.org        |     3
 7975 | ellen.swaniawski@schultzemmerich.net |     3
 9978 | dayana.kessler@dickinson.io          |     3
(12 rows)
1.Understand problem
 -input:
 --tables:
customers, tickets
 --columns
customers.id, customers.email
tickets.customer_id
 -return:
id, email, count
 -rules:
  --explicit: id, email, count for customers that have bought tickets fro three events
  --implicit:
2.Helper data
 -schema
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
 organization=# select* from customers;
  id   | first_name  |   last_name   |   phone    |                     email                      
-------+-------------+---------------+------------+------------------------------------------------
     1 | Malinda     | Luettgen      | 1830178263 | malinda.luettgen@hodkiewiczrobel.org
     2 | Kevin       | Lehner        | 6298905698 | kevin.lehner@bergnaum.name
     3 | Erik        | Rodriguez     | 6445040698 | erik.rodriguez@larson.com
     4 | Grover      | Larkin        | 1121572984 | grover.larkin@gerholdcummerata.biz
     5 | Stuart      | Veum          | 2372496046 | stuart.veum@monahan.net
     6 | Madelyn     | Bernier       | 5298846404 | madelyn.bernier@okeefe.info
     7 | Allen       | Kling         | 7690215543 | allen.kling@lindgrenstokes.org
     8 | Angel       | Corwin        | 1115407615 | angel.corwin@nicolascrona.info
     9 | Herbert     | Nikolaus      | 7591544841 | herbert.nikolaus@cole.com
    10 | Margarita   | Block         | 7700771425 | margarita.block@nolanrodriguez.name
    11 | Celestino   | White         | 1144206753 | celestino.white@okuneva.info
    12 | Zoie        | Dickinson     | 9803411843 | zoie.dickinson@herman.org
    13 | Kaylah      | Luettgen      | 9305176980 | kaylah.luettgen@damorevon.info

    organization=# select * from tickets limit 10;
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

 LIMIT 10;
 id | first_name | last_name |   phone    |                email                 |  id  | event_id | seat_id | customer_id 
----+------------+-----------+------------+--------------------------------------+------+----------+---------+-------------
  1 | Malinda    | Luettgen  | 1830178263 | malinda.luettgen@hodkiewiczrobel.org |      |          |         |            
  2 | Kevin      | Lehner    | 6298905698 | kevin.lehner@bergnaum.name           |      |          |         |            
  3 | Erik       | Rodriguez | 6445040698 | erik.rodriguez@larson.com            | 2571 |        7 |     246 |           3
  3 | Erik       | Rodriguez | 6445040698 | erik.rodriguez@larson.com            | 2570 |        7 |     245 |           3
  4 | Grover     | Larkin    | 1121572984 | grover.larkin@gerholdcummerata.biz   |      |          |         |            
  5 | Stuart     | Veum      | 2372496046 | stuart.veum@monahan.net              |      |          |         |            
  6 | Madelyn    | Bernier   | 5298846404 | madelyn.bernier@okeefe.info          |      |          |         |            
  7 | Allen      | Kling     | 7690215543 | allen.kling@lindgrenstokes.org       |      |          |         |            
  8 | Angel      | Corwin    | 1115407615 | angel.corwin@nicolascrona.info       |  291 |        1 |     285 |           8
  8 | Angel      | Corwin    | 1115407615 | angel.corwin@nicolascrona.info       |  290 |        1 |     284 |           8
(10 rows)
3.Data type
serial, varchar, int
4.Algorithm
LEFT JOIN customers and tickets on customers.id =  tickets.customer_id
select customer id, tickets_customer id  and count the customers id
group by customers_id
filter any resuls where the count equals three
order by customers id ascending 
*/

SELECT customers.id, customers.email, count(DISTINCT tickets.event_id)
FROM customers
LEFT JOIN tickets
ON customers.id = tickets.customer_id
GROUP BY customers.id
HAVING count(DISTINCT tickets.event_id)
 = 3
 ORDER BY customers.id ASC;

 -- book
 SELECT customers.id, customers.email, COUNT(DISTINCT tickets.event_id)
  FROM customers
  INNER JOIN tickets
    on tickets.customer_id = customers.id
  GROUP BY customers.id
  HAVING COUNT(DISTINCT tickets.event_id) = 3;