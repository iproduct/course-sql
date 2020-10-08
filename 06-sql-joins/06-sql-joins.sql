SELECT employee_id id, CONCAT(first_name, ' ', last_name) AS full_name, e.department_id, d.name AS department_name 
FROM `departments` d LEFT JOIN employees e ON d.manager_id = e.employee_id
ORDER BY employee_id;

SELECT COUNT(e.employee_id) AS 'count' FROM employees AS e
WHERE e.salary > (SELECT AVG(salary) AS 'average_salary' FROM employees);
