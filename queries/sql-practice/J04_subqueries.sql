SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

SELECT first_name, salary
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Toronto'
);

SELECT *
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM departments d
    WHERE e.department_id = d.department_id
);