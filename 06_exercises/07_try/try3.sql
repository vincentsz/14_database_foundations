-- Write a query that determines how many tickets have been sold.

-- Expected Output

-- count
-- -------
-- 3783
-- (1 row)

SELECT count(id)
  FROM tickets;

-- Write a query that determines how many different customers purchased tickets to at least one event.

-- Expected Output

--   count
-- -------
--   1652
-- (1 row)

SELECT count(DISTINCT customer_id)
  FROM tickets;

-- Write a query that determines what percentage of the customers in the database have purchased a ticket to one or more of the events.

-- Expected Output

--   percent
-- ----------
--     16.52
-- (1 row)
/*
0.Query
 -description

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
                       List of relations
 Schema |          Name           |   Type   |      Owner      
--------+-------------------------+----------+-----------------
 public | counter                 | sequence | vincentsijssens
 public | customers               | table    | vincentsijssens
 public | customers_id_seq        | sequence | vincentsijssens
 public | even_sequence           | sequence | vincentsijssens
 public | events                  | table    | vincentsijssens
 public | events_id_seq           | sequence | vincentsijssens
 public | films                   | table    | vincentsijssens
 public | films_id_seq            | sequence | vincentsijssens
 public | regions                 | table    | vincentsijssens
 public | regions_id_seq          | sequence | vincentsijssens
 public | seats                   | table    | vincentsijssens
 public | seats_id_seq            | sequence | vincentsijssens
 public | sections                | table    | vincentsijssens
 public | sections_id_seq         | sequence | vincentsijssens
 public | test_constraint_default | table    | vincentsijssens
 public | tickets                 | table    | vincentsijssens
 public | tickets_id_seq          | sequence | vincentsijssens

                                      Table "public.customers"
   Column   |         Type          | Collation | Nullable |                Default                
------------+-----------------------+-----------+----------+---------------------------------------
 id         | integer               |           | not null | nextval('customers_id_seq'::regclass)
 first_name | text                  |           | not null | 
 last_name  | text                  |           | not null | 
 phone      | character varying(10) |           | not null | 
 email      | text                  |           | not null | 
Indexes:
    "customers_pkey" PRIMARY KEY, btree (id)
    "customers_email_key" UNIQUE CONSTRAINT, btree (email)
Referenced by:
    TABLE "tickets" CONSTRAINT "tickets_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(id)
 -tables

3.Data type

4.Algorithm
- customers tables has al cistomers pk id)
- tickets tables has all sold tickets, customer_id identifies each customer hat bought that tickets

percentage of all customers who bought one or more tickets

(all disticnt customers_id from ticketrs / all ids from customers) *100


*/

SELECT round(((count(DISTINCT tickets.customer_id)/count(DISTINCT customers.id)::decimal) * 100), 2)
   FROM customers
  LEFT JOIN tickets
   ON customers.id = tickets.customer_id;

-- NOTE:

-- Write a query that returns the name of each event and how many tickets were sold for it, in order from most popular to least popular.

-- Expected Output

--             name            | popularity
-- ----------------------------+------------
--   A-Bomb                     |        555
--   Captain Deadshot Wolf      |        541
--   Illustrious Firestorm      |        521
--   Siren I                    |        457
--   Kool-Aid Man               |        439
--   Green Husk Strange         |        414
--   Ultra Archangel IX         |        359
--   Red Hope Summers the Fated |        307
--   Magnificent Stardust       |        134
--   Red Magus                  |         56
-- (10 rows)

-- left outer join events with tickets, this gives all events
-- count event_id as popularity

SELECT events.name, count(tickets.event_id) AS popularity
  FROM events
  LEFT JOIN tickets
   ON events.id = tickets.event_id
   ORDER BY popularity DESC;


SELECT events.name, count(events.id) as popularity
  FROM events
  LEFT JOIN tickets
   ON events.id = tickets.event_id
   GROUP BY events.id
   ORDER BY popularity DESC;

-- Write a query that returns the user id, email address, and number of events for all customers that have purchased tickets to three events.

-- Expected Output

--   id   |                email                 | count
-- -------+--------------------------------------+-------
--   141  | isac.hayes@herzog.net                |     3
--   326  | tatum.mraz@schinner.org              |     3
--   624  | adelbert.yost@kleinwisozk.io         |     3
--   1719 | lionel.feeney@metzquitzon.biz        |     3
--   2058 | angela.ruecker@reichert.co           |     3
--   3173 | audra.moore@beierlowe.biz            |     3
--   4365 | ephraim.rath@rosenbaum.org           |     3
--   6193 | gennaro.rath@mcdermott.co            |     3
--   7175 | yolanda.hintz@binskshlerin.com       |     3
--   7344 | amaya.goldner@stoltenberg.org        |     3
--   7975 | ellen.swaniawski@schultzemmerich.net |     3
--   9978 | dayana.kessler@dickinson.io          |     3
-- (12 rows)
-- inner join customers with tickets


SELECT customers.id, customers.email, count(DISTINCT events.id) AS count
  FROM customers
  INNER JOIN tickets
   ON customers.id = tickets.customer_id
   INNER JOIN events
   ON tickets.event_id = events.id
   GROUP BY customers.id
   HAVING count(DISTINCT events.id) = 3;
-- Write a query to print out a report of all tickets purchased by the customer with the email address 'gennaro.rath@mcdermott.co'. 
-- The report should include the event name and starts_at and the seat's section name, row, and seat number.

-- Expected Output

--         event        |      starts_at      |    section    | row | seat
-- --------------------+---------------------+---------------+-----+------
--   Kool-Aid Man       | 2016-06-14 20:00:00 | Lower Balcony | H   |   10
--   Kool-Aid Man       | 2016-06-14 20:00:00 | Lower Balcony | H   |   11
--   Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   14
--   Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   15
--   Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   16
--   Ultra Archangel IX | 2016-05-23 18:00:00 | Upper Balcony | G   |    7
--   Ultra Archangel IX | 2016-05-23 18:00:00 | Upper Balcony | G   |    8
-- (7 rows)

/*
0.Query
 -description

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
-- join customers, tickets, events, seats
*/

SELECT events.name, events.starts_at, sections.name, seats.row, seats.number
  FROM customers
  INNER JOIN tickets
   ON customers.id = tickets.customer_id
   INNER JOIN events
   ON tickets.event_id = events.id
   INNER JOIN seats
   ON seats.id = tickets.seat_id
   INNER JOIN sections
   ON seats.section_id = sections.id
   WHERE customers.email = 'gennaro.rath@mcdermott.co';
   ;

-- list all event names, starting hour, section name, seat row and seat number for which user with email 'gennaro.rath@mcdermott.co' bought tickets, count tickets ths user bought for each event
SELECT (customers.first_name || ' ' || customers.last_name) as name, events.name as event, events.starts_at, sections.name, string_agg(('row:' || seats.row || ' seat:' || seats.number), ', ') as row_and_seat, count(tickets.id) as quantity
  FROM customers
  JOIN tickets
   ON customers.id = tickets.customer_id
  JOIN events
   ON events.id = tickets.event_id
  JOIN seats
    ON seats.id = tickets.seat_id
  JOIN sections
    ON seats.section_id = sections.id
  WHERE customers.email = 'gennaro.rath@mcdermott.co'
  GROUP BY events.id, sections.id, customers.id;

