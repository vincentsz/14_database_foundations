-- Let's say a business keeps some of a business's employee data in a table called employees, 
-- with columns for: first name, last name,department, vacation remaining.

CREATE TABLE employees (
  first_name varchar(100),
  last_name varchar(100),
  department varchar(100),
  remaining_vacation integer
);

-- add employees

INSERT INTO employees VALUES ('Frank', 'Wiedemann', 'Techno', 12);
INSERT INTO employees VALUES ('Isa', 'Bella', 'House', 8);
INSERT INTO employees VALUES ('Tom', 'Smith', 'Italo', 10);

-- Now, let's say there is a new employee that has just been hired. We'll add them with this SQL statement:

INSERT INTO employees (first_name, last_name) VALUES ('Ben', 'Klock');

-- get list of poeple ordered by most vaction days

SELECT * FROM employees ORDER BY remaining_vacation DESC;

-- another query was run to figure out how much each employee should be paid:

SELECT *, remaining_vacation * 8 * 15.5 AS amount FROM employees ORDER BY remaining_vacation DESC;

-- delete rows that have NULL valu in remaining_vacation column

DELETE FROM employees WHERE remaining_vacation IS NULL;

-- add NOT NULL constraint to renaing_vacation column

ALTER TABLE employees ALTER COLUMN remaining_vacation SET NOT NULL;

-- insert w missing values not possible:

INSERT INTO employees (first_name, last_name) VALUES ('Haiden', 'Smith');

-- better way is to set default value

ALTER TABLE employees ALTER COLUMN remaining_vacation SET DEFAULT 0;