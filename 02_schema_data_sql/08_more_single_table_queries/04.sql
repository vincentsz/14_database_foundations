-- Write a SQL query that lists each domain used in an email address in the people table 
-- and how many people in the database have an email address containing that domain. 
-- Domains should be listed with the most popular first.

SELECT right(substring(email, '@.*'), -1) AS domain, count(id) FROM people
GROUP BY domain
ORDER BY count DESC;

SELECT trim(substring(email, '@.*'), '@') AS domain, count(id) FROM people
GROUP BY domain
ORDER BY count DESC;


-- book

SELECT substr(email, strpos(email, '@') + 1) as domain,
         COUNT(id)
  FROM people
  GROUP BY domain
  ORDER BY count DESC;