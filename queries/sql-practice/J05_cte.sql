WITH high_salary_employees AS (
    SELECT *
    FROM employees
    WHERE salary > 80000
)
SELECT *
FROM high_salary_employees;

WITH department_avg AS (
    SELECT department_id,
           AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT *
FROM department_avg;