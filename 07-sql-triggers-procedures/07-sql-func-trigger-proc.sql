-- Functions
DROP FUNCTION IF EXISTS ufn_count_employees_by_town;
DELIMITER //
CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(40))
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE emp_count INT;
    SET emp_count := (SELECT COUNT(*) FROM employees 
		JOIN addresses USING(address_id)
        JOIN towns t USING(town_id)
        WHERE t.`name` = town_name);
	RETURN emp_count;
END//
DELIMITER ;
SELECT ufn_count_employees_by_town('Sofia');
SELECT first_name, last_name, t.`name` FROM employees 
		JOIN addresses USING(address_id)
        JOIN towns t USING(town_id)
        WHERE t.`name` = 'Sofia';
  
-- Procedures
DROP PROCEDURE IF EXISTS usp_select_employees_by_seniority;
DELIMITER //
SET @years_experience := 1;
CREATE PROCEDURE usp_select_employees_by_seniority(IN years_experience INT) 
BEGIN
  SELECT first_name, last_name, hire_date,
    ROUND(DATEDIFF(NOW(),DATE(hire_date)) / 365.25,0) AS 'years'
  FROM employees
  WHERE ROUND((DATEDIFF(NOW(), hire_date) / 365.25)) < years_experience;
  SET years_experience := years_experience + 1;
END //
DELIMITER ;
CALL usp_select_employees_by_seniority(15);
SELECT @years_experience;

-- Params
DROP PROCEDURE IF EXISTS usp_add_numbers;
DELIMITER //
CREATE PROCEDURE usp_add_numbers
(first_number INT,
second_number INT,
   OUT result INT)
BEGIN
   SET result := first_number + second_number;
END //
DELIMITER ;
SET @answer=0;
CALL usp_add_numbers(35, 7,@answer);
SELECT @answer;

-- Exercise 2 - Rise salaries
DROP PROCEDURE IF EXISTS usp_raise_salaries;
DELIMITER //
CREATE PROCEDURE usp_raise_salaries(department_name varchar(40), percentage INT)
BEGIN
	UPDATE employees JOIN departments d USING(department_id)
		SET salary = salary * (1 + (percentage / 100))
        WHERE d.`name` = department_name;
END//
DELIMITER ;
SET @answer=0;
CALL usp_raise_salaries('Sales', 5);
SELECT employee_id, first_name, last_name, salary FROM employees JOIN departments d USING(department_id)
	WHERE d.`name` = 'Sales';

-- Transactions
SELECT salary*1.05 FROM employees AS e 
WHERE e.employee_id = 178

DELIMITER //
CREATE PROCEDURE usp_raise_salary_by_id(id INT)
BEGIN
	START TRANSACTION;
    IF((SELECT COUNT(*) FROM employees AS e WHERE e.employee_id = id) = 0) 
    THEN ROLLBACK;
    ELSE
		UPDATE employees AS e SET salary = salary * 1.05
        WHERE e.employees_id = id;
    END IF;
    COMMIT;
END //  
DELIMITER ;  

-- Triggers
CREATE TABLE deleted_employees(
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	middle_name VARCHAR(20),
	job_title VARCHAR(50),
	department_id INT,
	salary DOUBLE 
);
DELIMITER //
CREATE TRIGGER tr_deleted_employees
AFTER DELETE
ON employees
FOR EACH ROW
BEGIN
	INSERT INTO deleted_employees     (first_name,last_name,middle_name,job_title,department_id,salary)
	VALUES(OLD.first_name,OLD.last_name,OLD.middle_name,OLD.job_title,OLD.department_id,OLD.salary);
END//
DELIMITER ; 

DELETE FROM employees WHERE employee_id = 3;deleted_employees



