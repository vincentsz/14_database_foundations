-- Rewrite the query for the last question as a sub-query

SELECT first_name, last_name
FROM singers
WHERE id NOT IN(
  SELECT singer_id FROM albums);
