-- String Functions
# Length
SELECT LENGTH("Skyfall");
SELECT first_name, LENGTH(first_name) AS nameLen FROM employee_demographics ORDER BY nameLen;

# UPPER
SELECT UPPER("skyfall");
SELECT UPPER("SkyFall");
SELECT UPPER(first_name), UPPER(last_name) FROM employee_demographics;

# LOWER
SELECT LOWER("skyfall");
SELECT LOWER("SkyFall");
SELECT LOWER(first_name), LOWER(last_name) FROM employee_demographics;

# TRIM
SELECT TRIM("     SKY     fall     ") t;
SELECT RTRIM("    SKY     fall     ") t;
SELECT LTRIM("    SKY     fall     ") t;

# LEFT & RIGHT
SELECT first_name, LEFT(gender,1) FROM employee_demographics; 
SELECT first_name, LEFT(first_name,3), RIGHT(first_name,3) FROM employee_demographics; 

# SUBSTRING
SELECT first_name, last_name, SUBSTRING(birth_date,1,4) AS BirthYear, SUBSTRING(birth_date,6,2) AS BirthMonth, SUBSTRING(birth_date,9,2) AS BirthDate FROM employee_demographics;  

# REPLACE
SELECT REPLACE(first_name,'Ben','Bruce') AS FirstName, REPLACE(last_name,'Wyatt', 'Wayne') AS LastName FROM employee_demographics; 

# LOCATE
SELECT employee_id, LOCATE('Cr', first_name) FROM employee_demographics;

# CONCAT
SELECT first_name,last_name, CONCAT(first_name,'  ', last_name) AS FullName FROM employee_demographics;