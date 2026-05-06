SELECT employee_id,
       salary,
       SUM(salary) OVER(
           ORDER BY employee_id
       ) AS running_total
FROM employees;

SELECT employee_id,
       salary,
       AVG(salary) OVER(
           ORDER BY employee_id
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_average
FROM employees;