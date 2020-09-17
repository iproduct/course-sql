SELECT id, first_name, last_name, job_title FROM `employees` 
ORDER BY id;

SELECT `id`, concat(`first_name`, ' ', `last_name`) AS `full_name`, `job_title`, `salary`
FROM `employees` 
WHERE `salary` > 1000
ORDER BY id ASC;

SET SQL_SAFE_UPDATES = 0;

UPDATE `employees`
SET `salary` = `salary` + 100
WHERE `job_title` = 'MANAGER';

SELECT `salary` FROM `employees`
ORDER BY `id` ASC;

SELECT * FROM `employees`
ORDER BY `salary` DESC
LIMIT 1;

SELECT * FROM `employees`
WHERE `department_id` = 4 AND `salary` >= 1000;

UPDATE `employees`
SET `salary` = `salary` + 100
WHERE `job_title` = 'Manager';
