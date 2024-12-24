SELECT * FROM employee_demographics WHERE age > 35;

SELECT first_name FROM employee_demographics WHERE age>35;

SELECT first_name, age FROM employee_demographics WHERE age > 35 AND gender = 'Male';

SELECT first_name, age, gender FROM employee_demographics WHERE age > 40 OR gender = 'Male';

SELECT * FROM employee_demographics WHERE (age > 35 AND gender = 'Male') OR employee_id > 5;

SELECT * FROM employee_demographics WHERE age > 40 AND NOT gender = 'Male';

SELECT first_name, age, gender FROM employee_demographics WHERE first_name LIKE '%er%';

SELECT first_name, age, gender FROM employee_demographics WHERE first_name LIKE 'A%';

SELECT first_name, age, gender FROM employee_demographics WHERE first_name LIKE 'A__%';

SELECT gender FROM employee_demographics GROUP BY gender;

SELECT age FROM employee_demographics GROUP BY gender;	-- gives error becasue non aggregated variable

SELECT AVG(age) FROM employee_demographics GROUP BY gender; -- now age is aggregated 

SELECT gender,AVG(age) FROM employee_demographics GROUP BY gender; 

 SELECT * FROM employee_demographics ORDER BY age ASC;  

 SELECT * FROM employee_demographics ORDER BY age DESC;
 
  SELECT AVG(age) AS avg_age,gender FROM employee_demographics GROUP BY gender HAVING AVG(age) > 40 ;

-- INNER JOIN
SELECT * FROM employee_demographics 
INNER JOIN employee_salary 
	ON employee_demographics.employee_id = employee_salary.employee_id;

SELECT dem.first_name,dem.last_name FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.first_name = sal.first_name;
    
-- LEFT JOIN
SELECT * FROM employee_demographics 
LEFT JOIN employee_salary 
	ON employee_demographics.employee_id = employee_salary.employee_id;
    
-- RIGHT JOIN
SELECT * FROM employee_demographics 
RIGHT JOIN employee_salary 
	ON employee_demographics.employee_id = employee_salary.employee_id;
    
-- UNION (DIstinct by default)
SELECT first_name, last_name FROM employee_demographics
UNION
SELECT first_name, last_name FROM employee_salary;

SELECT first_name, last_name FROM employee_demographics
UNION ALL
SELECT first_name, last_name FROM employee_salary;

 