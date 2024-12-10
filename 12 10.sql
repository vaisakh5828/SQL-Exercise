CREATE DATABASE cgpt_1012;
USE cgpt_1012;
CREATE TABLE employees(
employee_id int,
first_name	VARCHAR(50)	,
last_name	VARCHAR(50)	,
department_id	INT	,
salary	DECIMAL(10, 2)	,
hire_date	DATE	,
manager_id	INT
);
SHOW TABLES;

CREATE TABLE departments(
department_id int,
department_name varchar(50),
location VARCHAR(50)
);

CREATE TABLE projects (
project_id	INT	,
project_name	VARCHAR(50)	,
department_id	INT	,
budget	DECIMAL(12, 2)
);

CREATE TABLE timesheets (
timesheet_id	INT,	
employee_id	INT	,
project_id	INT	,
hours_worked	DECIMAL(5, 2)
);

INSERT INTO employees (employee_id, first_name, last_name, department_id, salary, hire_date, manager_id)
VALUES 
(1, 'Alice', 'Smith', 101, 60000, '2020-01-15', 4),
(2, 'Bob', 'Johnson', 102, 50000, '2021-03-22', 4),
(3, 'Carol', 'Williams', 103, 70000, '2019-11-30', NULL),
(4, 'David', 'Brown', 101, 80000, '2018-06-10', NULL),
(5, 'Emma', 'Taylor', 102, 95000, '2022-08-05', 4);

INSERT INTO departments (department_id , department_name , location)
VALUES
(101, 'HR', 'New York'),
(102, 'Finance', 'San Francisco'),
(103, 'IT', 'Boston'),
(104, 'Marketing', 'Chicago'),
(105, 'Operations', 'Seattle');

INSERT INTO projects ( project_id , project_name , department_id , budget)
VALUES
(1,'Recruitment Drive',101,100000);

INSERT INTO projects ( project_id , project_name , department_id , budget)
VALUES
(2, 'System Upgrade', 103, 200000),
(3, 'Market Research', 104, 150000),
(4, 'New Product Launch', 102, 300000),
(5, 'Employee Training', 105, 50000);

INSERT INTO Timesheets (timesheet_id, employee_id, project_id, hours_worked)
VALUES 
(1, 1, 1, 20.5),
(2, 2, 4, 35.0),
(3, 3, 2, 50.0),
(4, 4, 3, 40.0),
(5, 5, 5, 25.0);

SELECT * FROM employees;
SELECT * FROM departments;
SELECT *FROM projects;
SELECT *FROM timesheets;