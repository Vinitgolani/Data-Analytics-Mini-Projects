-- CTEs 
## It creates a temp table which you can use only one time(for one query) and it wont be shown in the schema 

WITH CTEs_Example As(
SELECT gender, AVG(salary) avgSal, Max(salary) maxSal, Min(salary) minSal, Count(salary) countSal
FROM  employee_demographics dem 
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT * 
FROM CTEs_Example;


WITH CTEs_Example As(
SELECT gender, AVG(salary) avgSal, Max(salary) maxSal, Min(salary) minSal, Count(salary) countSal
FROM  employee_demographics dem 
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(avgSal) 
FROM CTEs_Example;

-- Temporary Table :
## Creates a temporary table that will last for one session. One session means till I restart the MYSQL workbench again. 
## This table won't get stored in the schema but it will get stored in memory but only for one session after quitting 
## the session the table will get erased from the memory

CREATE TEMPORARY TABLE tempTable(
FirstName varchar (25),
LastName varchar (25),
FavMovie varchar (25)
);

INSERT INTO tempTable(FirstName, LastName, Favmovie)
VALUES
('Vinti', 'Golani', 'Fight Club'),
('Nishi', 'Agrawal', 'Hum Apke H Kaun'),
('Prakalp', 'Awasty', 'Ready');

SELECT * FROM tempTable;


