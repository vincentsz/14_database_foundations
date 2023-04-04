1. find avg salary for all employees 
2. find full name of employees 
3. find name of department
4. exclude all emploryees from engineering



*/ 


SELECT concat(first_name, ' ', last_name), (SELECT name FROM departments WHERE departments.id = employees.department_id AND name != 'Engineering') 
FROM employees
WHERE salary <= (SELECT avg(salary) FROM employees);


-- SELECT name FROM departments WHERE name != 'Engineering';