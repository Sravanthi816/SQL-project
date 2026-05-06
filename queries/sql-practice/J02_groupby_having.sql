SELECT department, COUNT(*)
FROM employees
GROUP BY department;

SELECT department, AVG(salary)
FROM employees
GROUP BY department;

SELECT department, MAX(salary)
FROM employees
GROUP BY department;

SELECT department, MIN(salary)
FROM employees
GROUP BY department;

SELECT department, SUM(salary)
FROM employees
GROUP BY department;

SELECT department, COUNT(*)
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;

SELECT department, AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) > 70000;
