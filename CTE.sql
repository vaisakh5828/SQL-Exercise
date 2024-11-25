use chatgpt_2011;
#CTE:
# A CTE (Common Table Expression) is like creating a temporary table or view for the duration of a query. 
# It makes your SQL queries cleaner and easier to read, especially for complex ones.

select * from projects;
SELECT * FROM employees;
SELECT * FROM departments;
WITH HighEarners AS (
    SELECT first_name, last_name, salary
    FROM employees
    WHERE salary > 70000
)
SELECT first_name, last_name
FROM HighEarners;

SELECT concat(first_name, ' ' , last_name) AS Full_name, salary 
FROM employees
WHERE salary > 70000;

# Select project name where budget is gthan 150000 using cte.

WITH Top_Projects AS (
    SELECT project_name , budget
    FROM projects
    WHERE budget > 150000
)
SELECT * FROM Top_Projects;

#1.Retrieve all employees earning more than 60,000 using a CTE.
select * from projects;
SELECT * FROM employees;
SELECT * FROM departments;

WITH high_earn AS (
SELECT first_name , last_name , salary
from employees
WHERE salary > 60000 
)
SELECT * FROM high_earn;

#2.List employees along with their department names using a CTE to link employees to departments.

WITH emp_dep AS (
SELECT e.first_name , e.last_name , e.department_id , d.department_name 
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id
)
SELECT * FROM emp_dep;

#3.Find the total salary paid to employees in each department using a CTE.

WITH ttl_sal AS (
SELECT e.department_id , d.department_name , SUM(e.salary) as Total_salary 
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY e.department_id,d.department_name
)
SELECT * FROM ttl_sal;

#cg
WITH DepartmentSalaries AS (
    SELECT e.department_id, SUM(e.salary) AS total_salary
    FROM employees e
    GROUP BY e.department_id
)
SELECT d.department_name, ds.total_salary
FROM DepartmentSalaries ds
JOIN departments d
ON ds.department_id = d.department_id;

 SELECT e.department_id, SUM(e.salary) AS total_salary
    FROM employees e
    GROUP BY e.department_id;
    
#4.Create a CTE to find employees whose salary is above the average salary of all employees.

select * from projects;
SELECT * FROM employees;
SELECT * FROM departments;

WITH avg_sal AS (
    SELECT  AVG(salary) AS avg_salr
    from employees 
)
SELECT e.first_name , e.salary
FROM employees e
CROSS JOIN avg_sal a
#ON e.department_id = a.department_id
WHERE e.salary > a.avg_salr;

WITH avg_sal AS (
    SELECT avg(salary) AS a_sal
    FROM employees
),
above_avgsal AS (
    select first_name , last_name , salary
    FROM employees,avg_sal
    where salary>a_sal
)
SELECT * 
FROM above_avgsal;
    