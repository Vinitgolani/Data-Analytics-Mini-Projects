-- TRIGGERS & EVENTS :
## Triggers and events works together. Whenever a defined condition is triggered the event defined takes places

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics(employee_id, first_name, last_name)
    VALUES(NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

## Now we have defined the trigger and the even to take place when the condition triggers
## The condition at which it triggers the evnt is whenever a new value is inserted into employee_salary table
## the value's first name, last name and employee id should also be inserted into the table employee_demographics.
## lets Check the trigger and event with an example

INSERT INTO employee_salary 
VALUES(13, 'Vinit', 'Golani', 'Unemployed', 0, NULL);

## The above query has been performed succesfully now go and check the table employee_salary and employee_demographics
