SELECT @@session.sql_mode;
SET SESSION sql_mode = sys.list_add(@@session.sql_mode, 'ONLY_FULL_GROUP_BY');
SET SESSION sql_mode = sys.list_drop(@@session.sql_mode, 'ONLY_FULL_GROUP_BY');
SET @@sql_mode = sys.list_drop(@@sql_mode, 'ONLY_FULL_GROUP_BY');
SELECT @@sql_mode;

SELECT `department_id`, COUNT(`department_id`) as `Number of employees` FROM `employees`
GROUP BY `department_id` ORDER BY `department_id`;

SELECT `department_id`, ROUND(AVG(`salary`), 2) as `Salary` FROM `employees`
GROUP BY `department_id` ORDER BY `department_id`;

SELECT `department_id`, ROUND(MIN(`salary`), 2) as `Salary` FROM `employees`
GROUP BY `department_id` HAVING `Salary` > 800
ORDER BY `department_id`;

SELECT COUNT(`category_id`) as `count` FROM `products`
WHERE `category_id` = 2 ;

SELECT `category_id`, 
		AVG(`price`) as `Average Price`,
		MIN(`price`) as `Cheapest Product`,
		MAX(`price`) as `Most Expensive Product`
	FROM `products`
	GROUP BY `category_id`;

