-- Case Statments

# WHEN BETWEEN THEN
SELECT first_name, last_name, age,
CASE
	WHEN age <= 35 THEN 'Young'
    WHEN age BETWEEN 36 AND 40 THEN 'ADULT'
    WHEN age BETWEEN 41 AND 50 THEN 'Old'
    WHEN age > 51 THEN 'On Death Bed'
END AS AgeClass
FROM employee_demographics;

-- Pay increase And Bonus
# salary < 50000 = 5% Bonus
# salary > 50000 = 7% Bonus
# occupation = Finance = 10% Bonus

SELECT first_name, last_name, occupation, salary,
CASE
	WHEN dept_id = 6 THEN (salary *.1)
	WHEN salary <= 50000 THEN (salary*0.05)
    WHEN salary > 50000 THEN (salary*0.07)
END AS Bonus
FROM employee_salary;






