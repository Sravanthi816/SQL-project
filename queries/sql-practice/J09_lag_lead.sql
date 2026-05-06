SELECT employee_id,
       salary,
       LAG(salary) OVER(
           ORDER BY employee_id
       ) AS previous_salary
FROM employees;

SELECT employee_id,
       salary,
       LEAD(salary) OVER(
           ORDER BY employee_id
       ) AS next_salary
FROM employees;