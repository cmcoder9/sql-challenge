-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: Link to schema: https://app.quickdatabasediagrams.com/#/d/2WoygX

--DATA ENGINEERING
--Drop Departments table if table exists
DROP TABLE Departments;

--Create the Departments table
CREATE TABLE Departments(
    dept_no varchar PRIMARY KEY NOT NULL,
    dept_name varchar NOT NULL
);
--Insert data into Departments table

--Check data import/View the Deparments table data
SELECT * FROM Departments

--Drop table if table exists
DROP TABLE Department_Employees;

--Create the Department Employees table
CREATE TABLE Department_Employees(
    emp_no int NOT NULL,
    dept_no varchar NOT NULL
);

--Insert data into Department_Employees table

--Check data import/View the Department_Employees table data
SELECT * FROM Department_Employees

--Drop Department_Managers table if table exists
DROP TABLE Department_Managers;

--Create the Department_Managers table
CREATE TABLE Department_Managers(
    dept_no varchar NOT NULL,
    emp_no int NOT NULL
);

--Insert data into Department_Managers table

--Check data import/View the Department_Managers table data
SELECT * FROM Department_Managers

--Drop  Employees table if table exists
DROP TABLE Employees;

--Create the Employees table
CREATE TABLE Employees(
    emp_no int PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(50) NOT NULL,
    birth_date date  NOT NULL,
    first_name VARCHAR(30)  NOT NULL,
    last_name VARCHAR(30)  NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date date NOT NULL
);

--Insert data into Employees table

--Check data import/View the Employees table data
SELECT * FROM Employees

--Drop table if table exists
DROP TABLE Salaries;

--Create the Salaries table
CREATE TABLE Salaries(
    emp_no int NOT NULL,
    salary int NOT NULL
);
--Check data import/View the Salaries table data
SELECT * FROM Salaries

--Drop table if table exists
DROP TABLE Title;

--Create the Title table
CREATE TABLE Title(
    title_id  VARCHAR(50) PRIMARY KEY NOT NULL,
    title VARCHAR(50) NOT NULL
);

--Insert data into Title table

--Check data import/View the Title table data
SELECT * FROM Title

--DATA ANALYSIS

--List the following details of each employee: employee number, last name, first name, sex, and salary.
--Perform Inner Join on Employees and Salaries tables
SELECT e.emp_no, e.last_name , e.first_name, e.sex, s.salary
FROM Employees AS e
INNER JOIN Salaries AS s
ON e.emp_no = s.emp_no;


--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM Employees 
WHERE hire_date LIKE '1986%';


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

--Perform Inner Join on Departments, Department Managers,and Employees tables
SELECT d.dept_no, d.dept_name,dm.emp_no, e.last_name , e.first_name
FROM Departments AS d
INNER JOIN Department_Managers AS dm
ON d.dept_no = dm.dept_no
INNER JOIN Employees AS e
ON dm.emp_no = e.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.


--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."


--List all employees in the Sales department, including their employee number, last name, first name, and department name.


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
