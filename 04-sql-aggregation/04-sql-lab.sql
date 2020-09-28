USE `soft_uni`;

SELECT `department_id`, ROUND(SUM(`salary`), 2) 
AS `Salary Sum` FROM `employees`
GROUP BY `department_id`
ORDER BY `department_id`;