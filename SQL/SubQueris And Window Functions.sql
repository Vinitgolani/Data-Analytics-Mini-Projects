-- Sub Queries
SELECT * FROM employee_demographics
WHERE employee_id IN
					(SELECT employee_id FROM employee_salary
                     WHERE dept_id=1);
                     

-- Window Fuctions => OVER(PARTITION BY <col name>)
# It is used in place of GROUP BY when you need to show all the information but need to calculate something by grouping by some col's value or category such as gender
# The difference will be shown in the bellow code

SELECT dem.first_name, dem.last_name, sal.occupation,dem.gender, sal.salary, AVG(salary) OVER(PARTITION BY gender) AS avg_salary_by_gender
FROM employee_demographics AS dem
JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id; ##THIs is Windows Function

SELECT dem.first_name, dem.last_name, dem.gender, sal.occupation, sal.salary, AVG(salary)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name, dem.last_name, sal.occupation,dem.gender, sal.salary; ## This is done using GROUP BY. GO check the out put and you will understand

SELECT dem.first_name, dem.last_name, sal.dept_id, dem.gender, sal.salary, AVG(salary) OVER(PARTITION BY dept_id) AS avg_salary_by_dept_id
FROM employee_demographics AS dem
JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id; ##THIs is Windows Function

##findiang sum of salary like finonacci series but partitioned by gender
## Also known as ROLLING STONE
SELECT dem.first_name, dem.last_name, gender, salary, 
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS sum_salary_by_gender
FROM employee_demographics AS dem
JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id
