SELECT first_name,
       salary,
       CASE
           WHEN salary > 100000 THEN 'High'
           WHEN salary BETWEEN 70000 AND 100000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_category
FROM employees;

SELECT department,
       SUM(
           CASE
               WHEN salary > 80000 THEN 1
               ELSE 0
           END
       ) AS high_paid_employees
FROM employees
GROUP BY department;