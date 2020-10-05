SELECT e.employee_id id, e.first_name, e.last_name, d.`name` department, a.address_text address, t.`name` town
FROM `departments` d JOIN `employees` AS e ON d.department_id = e.department_id
JOIN `addresses` a ON e.address_id = a.address_id
JOIN `towns` t ON a.town_id = t.town_id
ORDER BY e.employee_id;