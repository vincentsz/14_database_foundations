
/*
===========================
LS 180/181 Topics:

- JOINs
- SQL sublanguages
- SQL DDL Statements
- SQL DML Statements
- GROUP BY, ORDER BY, WHERE, HAVING
- Constraints
- Subqueries

- Primary Keys vs. Foreign Keys
- Surrogate Keys vs. Natural Keys

- Levels of Schema
- Cardinality and Modality
- ERD and Crow's Foot Notation
==================================
*/
-- https://launchschool.com/lessons/a1779fd2/assignments/f4b7a9dc
-- Rows are collected into a virtual derived TABLE
    -- This includes tables that are used in `JOIN` clauses
-- Rows are filtered using `WHERE` condition
-- Rows are divided into GROUPS
-- Groups are filtered using `HAVING` conditions
-- Compute values to return using select list
-- Sort Results
-- Limit Results

-- FROM employees
--  JOIN

-- WHERE salary > something
--   - all rows that meet the above criterion
--   - filters raw data (i.e. data from FROM/JOIN)

-- SELECT first_name, id

-- ORDER BY first_name


-- SELECT e.first_name, id FROM employees AS e
-- WHERE salary > something
-- ORDER BY first_name;

/*
CoderPad provides a basic SQL sandbox with the following schema.
You can also use commands like '\dt;' and '\d employees;'

employees                             projects
+---------------+---------+           +---------------+---------+
| id            | int     |<----+  +->| id            | int     |
| first_name    | varchar |     |  |  | title         | varchar |
| last_name     | varchar |     |  |  | start_date    | date    |
| salary        | int     |     |  |  | end_date      | date    |
| department_id | int     |--+  |  |  | budget        | int     |
+---------------+---------+  |  |  |  +---------------+---------+
                             |  |  |
departments                  |  |  |  employees_projects
+---------------+---------+  |  |  |  +---------------+---------+
| id            | int     |<-+  |  +--| project_id    | int     |
| name          | varchar |     +-----| employee_id   | int     |
+---------------+---------+           +---------------+---------+
*/

/*
GROUP BY 

key words and terms 

group by 
aggregate functions 
columns 
row or a set of rows 

one to many relationship 

Input
employees 
- department_id (fk)
departments 
 - id (pk) 

 Entity relationships (cardinality):
 one-to-one (1----1)
 one-to-many  (1---- M)
   (one deparment can have one or more employees)
   (one employee can belong to only one department)
 many-to-many (M-----N) (needs a cross-reference join table)

Output 

department (column)
full_name (rows)

*/ 


-- SELECT departments.id, departments.name AS "Department", string_agg(concat(employees.first_name, ' ', employees.last_name), ', ') AS "Full name"
-- FROM departments 
-- INNER JOIN employees ON employees.department_id = departments.id
-- GROUP BY departments.id, departments.name; 

SELECT departments.id, departments.name AS "Department", string_agg(concat(employees.first_name, ' ', employees.last_name), ', ') AS "Full name"
FROM departments 
NATURAL JOIN employees USING department_id
GROUP BY departments.id, departments.name; 

/*
https://www.postgresql.org/docs/current/queries-table-expressions.html
*/

-- SELECT departments.id, departments.name --functionally dependent on the GROUP BY criterion
-- FROM departments
-- GROUP BY departments.id;  -- primary key

/* Functional Dependency
 id |Department  |    Full name        
-------------+-------------------------
 2  Engineering | Ian Peterson, Mike Peterson, Cailin Ninson
 1 Reporting   | John Smith
 3 Marketing   | John Mills
 5 Silly Walks | Ava Muffinson


*/