SELECT first_name,
       department,
       salary,
       ROW_NUMBER() OVER(
           PARTITION BY department
           ORDER BY salary DESC
       ) AS row_num
FROM employees;