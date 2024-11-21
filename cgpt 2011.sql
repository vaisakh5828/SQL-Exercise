create database chatgpt_2011;
use chatgpt_2011;
CREATE TABLE employees (
employee_id int,
first_name VARCHAR(20),
last_name VARCHAR(20),
department_id int,	
salary	INT,
manager_id int);
SELECT * from employees;
CREATE TABLE departments(
department_id int,
department_name VARCHAR(20));
SELECT * from departments;

CREATE TABLE projects(
project_id	INT,
project_name varchar(20),	
department_id int,	
budget int);

select * from projects;

INSERT INTO employees
VALUES
(1,'Alice','Johnson',101,60000,4),
(2,	'Bob',	'Smith',	102,	55000,	4),
(3,	'Carol',	'Davis',	103,	70000, NULL),
(4,	'David',	'Brown',	101,	80000,	NULL),
(5,	'Emma',	'Taylor',	102,	95000,	4),
(6,	'Frank',	'White',	104,	50000,	3);
 
 INSERT INTO departments
 values
 (101,	'HR'),
(102,	'Finance'),
(103,	'IT'),
(104,	'Marketing'),
(105,	'Operations');
select * from departments;

insert INTO projects
VALUES
(1,	'Recruitment Drive',	101,	100000),
(2,	'System Upgrade',	103	,200000),
(3,	'Market Research'	,104,	150000),
(4,	'New Product Launch',	102,300000),
(5,	'Employee Training'	,105,	50000);
select * from projects;
SELECT * FROM employees;
SELECT * FROM departments;

## Questions

#1.List each employee’s first and last name along with the department name they belong to.
SELECT e.first_name , e.last_name , d.department_name
from employees e
left join departments d
on e.department_id = d.department_id;

#2.Display all departments and the employees working in those departments. Include departments even if no employees are currently assigned to them.
SELECT e.first_name,d.department_name
from departments d
left join employees e
on d.department_id = e.department_id;

#3.Find the projects along with the employees working in departments associated with those projects.

SELECT p.project_name,e.first_name
from projects p
left join employees e
on p.department_id = e.department_id;

#4.Retrieve the names of employees along with their manager's first and last name.
select * from projects;
SELECT * FROM employees;
SELECT * FROM departments;

SELECT e.first_name as employee_name, m.first_name as manager_firstname, m.last_name as manager_lastname
FROM employees e
left join employees m
on e.manager_id = m.employee_id;

SELECT e.first_name as employee_name, m.first_name as manager_firstname, m.last_name as manager_lastname
FROM employees e
left join employees m
on  m.employee_id =e.manager_id ;
#5.List all employees and their associated project names, if any. Include employees even if they are not working on any project.
SELECT concat(e.first_name ,' ',e.last_name) as employee_name ,p.project_name
FROM employees e
left JOIN projects p
on e.department_id = p.department_id;
#6.Show the total budget allocated for projects in each department. Include departments even if they do not have projects.
SELECT p.project_name, p.budget , d.department_name
FROM departments d
LEFT JOIN projects p
on d.department_id = p.department_id;

#7. For each department, list the highest-paid employee's first and last name along with their salary and department name.

select * from projects;
SELECT * FROM employees;
SELECT * FROM departments;

SELECT concat(e.first_name,' ',e.last_name) as employee_name , e.salary, d.department_name
from departments d 
 join employees e 
on e.department_id = d.department_id
ORDER BY e.salary DESC;

SELECT 
    e.first_name, 
    e.last_name, 
    e.salary, 
    d.department_name
FROM employees e
JOIN departments d 
ON e.department_id = d.department_id
WHERE e.salary = (
    SELECT MAX(salary) 
    FROM employees 
    WHERE department_id = e.department_id
);

#8.Display the department name, project name, and the number of employees working in each department. Include departments even if they have no projects or employees.

select * from projects;
SELECT * FROM employees;
SELECT * FROM departments;

SELECT 
d.department_name , 
p.project_name , 
count(e.department_id) as employee_count
FROM 
departments d
LEFT JOIN 
projects p 
on p.department_id = d.department_id
left join employees e 
on e.department_id = d.department_id
GROUP BY d.department_name , p.project_name ;

SELECT 
    d.department_name, 
    p.project_name, 
    COUNT(e.employee_id) AS num_employees
FROM departments d
LEFT JOIN projects p 
    ON d.department_id = p.department_id
LEFT JOIN employees e 
    ON d.department_id = e.department_id
GROUP BY d.department_name, p.project_name;
