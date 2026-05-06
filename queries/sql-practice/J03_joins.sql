SELECT e.first_name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

SELECT e.first_name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

SELECT e.first_name, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;

SELECT e.first_name, d.department_name
FROM employees e
FULL OUTER JOIN departments d
ON e.department_id = d.department_id;

SELECT a.first_name AS employee,
       b.first_name AS manager
FROM employees a
JOIN employees b
ON a.manager_id = b.employee_id;