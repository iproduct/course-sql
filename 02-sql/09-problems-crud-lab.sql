SELECT `id`, `first_name`, `last_name`, `job_title` FROM `employees` 
ORDER BY `id`;

SELECT `id`, concat_ws(' ', `first_name`, `last_name`) AS `full_name`, 
`job_title` AS `Job Title`, `salary` FROM `employees` AS e
WHERE e.`salary` > 1000;

SELECT DISTINCT `last_name`, `department_id` FROM `employees`;

SELECT DISTINCT `last_name`, `salary` FROM `employees`
WHERE `salary` <= 1500;

SELECT * FROM `employees`
WHERE `department_id` IN (1, 4) AND `salary` BETWEEN 900 AND 1600;

ALTER TABLE `employees` ADD COLUMN `manager_id` INT;

UPDATE `employees`
SET `manager_id` = 1
WHERE `id` != 1;

SELECT id, `first_name`, `last_name`, `manager_id`, `salary` 
FROM `employees`
WHERE `manager_id` IS NOT NULL
ORDER BY `salary` ASC;

ALTER VIEW `employees_name_salary` AS 
SELECT `id`, concat_ws(' ', `first_name`, `last_name`) AS `full_name`, 
`salary` FROM `employees` 
ORDER BY `department_id`;

SELECT * FROM `employees_name_salary`;

CREATE VIEW `v_top_paid_employee` AS
SELECT * FROM `employees` 
ORDER BY `salary` DESC
LIMIT 1;

SELECT * FROM `v_top_paid_employee`;

CREATE TABLE `employees_salary` AS
SELECT `id`, concat_ws(' ', `first_name`, `last_name`) AS `full_name`, `salary`
FROM `employees` ORDER BY `salary` DESC;

SHOW CREATE TABLE `employees`;

CREATE TABLE `projects` (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`start_date` DATE,
    `manager_id` INT NOT NULL,
  CONSTRAINT `fk_manager_id` 
  FOREIGN KEY (`manager_id`) REFERENCES `employees` (`id`)
);

INSERT INTO `projects` (name, `start_date`, `manager_id`)
SELECT CONCAT(`name`, ' Restructuring'), NOW(), 1 FROM `departments`;

SHOW CREATE TABLE `projects`;

UPDATE `employees`
SET `salary` = `salary` + 100
WHERE `job_title` = 'Manager';

SELECT `salary` FROM `employees` ORDER BY `salary` DESC;

DELETE FROM `employees` 
WHERE `department_id` IN (1, 2);

CREATE VIEW `employees_departments` AS
SELECT e.`id` AS `employee_id`, e.`first_name`, e.`last_name`, 
d.`id` AS `department_id`, d.`name`
FROM `employees` AS e JOIN `departments` AS d ON e.`department_id` =  d.`id`;

SELECT * FROM `employees_departments`;

SHOW VARIABLES LIKE "secure_file_priv";

SELECT JSON_ARRAYAGG(JSON_OBJECT('id', `id`, 'fName', `first_name`,'lName', `last_name`))
FROM `employees` INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/employees.json';

