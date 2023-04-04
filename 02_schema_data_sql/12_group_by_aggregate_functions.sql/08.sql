/*
0.Query description
Write a SQL query that finds all films whose director has the first name John
1.Understand problem
 -input:
 --tables:
films
 --columns
title, director
 -return:
all films whose director has the first name John
 -rules:
  --explicit:
  --implicit:
2.Examples & test cases
 -raised errors:
 -examples:
3.Data type
varchar
4.Algorithm
select title where director starts with John

*/
SELECT title FROM films
WHERE director LIKE 'John%';
