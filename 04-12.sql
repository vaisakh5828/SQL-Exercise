USE chatgpt_2011;
#1.Find the names of employees who work in the "Finance" department.
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM projects;

SELECT concat(e.first_name ," ", e.last_name) as Full_Name, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE department_name = "Finance";

#2.Find the distinct departments where employees earn more than 70,000, sorted in alphabetical order.

SELECT DISTINCT d.department_name , e.salary
FROM departments d
JOIN employees e
ON e.department_id = d.department_id
WHERE e.salary > 70000
ORDER BY d.department_name ASC;

SELECT  d.department_name , e.salary
FROM departments d
JOIN employees e
ON e.department_id = d.department_id
WHERE e.salary > 70000
ORDER BY d.department_name ASC;


