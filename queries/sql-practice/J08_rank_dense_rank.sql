SELECT first_name,
       department,
       salary,
       RANK() OVER(
           PARTITION BY department
           ORDER BY salary DESC
       ) AS salary_rank
FROM employees;

SELECT first_name,
       department,
       salary,
       DENSE_RANK() OVER(
           PARTITION BY department
           ORDER BY salary DESC
       ) AS dense_salary_rank
FROM employees;