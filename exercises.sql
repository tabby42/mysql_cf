USE employees;
 -- How many rows do we have in each table in employees database? -> 9
 SELECT COUNT(*)
 FROM departments;
 
 -- 300024
SELECT COUNT(*)
FROM employees;

SELECT COUNT(*)
FROM salaries;

--  How many employees with the first name "Mark" do we have in our company? -> 230
SELECT COUNT(*)
FROM employees 
WHERE first_name = 'Mark';

-- How many employees with the first name "Eric" and that the last name begins with "A" do we have in our company? -> 13
SELECT COUNT(*)
FROM employees 
WHERE first_name = 'Eric' AND last_name LIKE 'A%';

--  How many employees do we have that work for us from 1985 and who they are? -> 35316
SELECT first_name, last_name, hire_date, COUNT(first_name)
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = '1985'
GROUP BY hire_date;

#SELECT EXTRACT(YEAR FROM birth_date) 
#FROM employees;

-- How many employees got hired from 1990 until 1997 and who they are? -> 129545
SELECT first_name, last_name, hire_date, COUNT(first_name)
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) BETWEEN '1990' AND '1997'
GROUP BY hire_date;
 
 -- How many employees have salaries bigger than 70000 and who they are? -> 131335
 SELECT DISTINCT first_name, last_name
 FROM employees
 JOIN salaries ON employees.emp_no = salaries.emp_no
 WHERE salary > 70000;
 
 SELECT COUNT(*) FROM
 (SELECT DISTINCT first_name, last_name
 FROM employees
 JOIN salaries ON employees.emp_no = salaries.emp_no
 WHERE salary > 70000) AS emp;
 
  -- How many employees do we have in department Research who work for us from 1992 and who they are? -> 1434
  SELECT  first_name, last_name
  -- COUNT(hire_date) 
  FROM employees
  INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
  INNER JOIN departments ON   departments.dept_no = dept_emp.dept_no
  WHERE departments.dept_name = 'Research' AND EXTRACT(YEAR FROM employees.hire_date) = '1992';
  
  -- How many employees do we have in department Finance who work for us from 1985 until now and who
  -- have salaries bigger than 75000 - who they are? -> 1369
  SELECT DISTINCT first_name, last_name
  FROM employees
  INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
  INNER JOIN departments ON   departments.dept_no = dept_emp.dept_no
  JOIN salaries ON employees.emp_no = salaries.emp_no
  WHERE departments.dept_name = 'Finance' 
  AND EXTRACT(YEAR FROM employees.hire_date) = '1985'
  AND salaries.salary > 75000;
  
  SELECT COUNT(*)
  FROM (SELECT DISTINCT first_name, last_name
			  FROM employees
			  INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
			  INNER JOIN departments ON   departments.dept_no = dept_emp.dept_no
			  JOIN salaries ON employees.emp_no = salaries.emp_no
			  WHERE departments.dept_name = 'Finance' 
			  AND EXTRACT(YEAR FROM employees.hire_date) = '1985'
			  AND salaries.salary > 75000
  ) AS emp2;
  
  --  We need a table with employees: first and last name, birth of date,
  -- gender, hire_date, title and salary, who are working for us in this moment.
  SELECT DISTINCT first_name, last_name, birth_date, gender, hire_date, salary, title
  FROM employees
  JOIN salaries ON employees.emp_no = salaries.emp_no
  JOIN titles ON employees.emp_no = titles.emp_no
  WHERE EXTRACT(YEAR FROM salaries.to_date) = '9999'
  ORDER BY last_name, first_name;
  
  --  We need a table with managers: first and last name, birth of date, gender, hire_date, title, department name and salary, 
  -- who are working for us in this moment.
  SELECT  DISTINCT first_name, last_name, birth_date, gender, hire_date,  title, dept_name, salary
  FROM employees
  JOIN salaries ON employees.emp_no = salaries.emp_no
  JOIN titles ON employees.emp_no = titles.emp_no
  JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
  JOIN departments ON departments.dept_no = dept_manager.dept_no
  WHERE EXTRACT(YEAR FROM salaries.to_date) = '9999'
  AND titles.title = 'Manager'
  ORDER BY last_name, first_name;
  
  --   Create a query which will join all tables and show all data from all tables.
  SELECT DISTINCT  employees.emp_no, first_name, last_name, hire_date, gender, dept_name, salary, title 
  FROM employees
  JOIN salaries ON employees.emp_no = salaries.emp_no
  JOIN titles ON employees.emp_no = titles.emp_no
  JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
  JOIN departments ON   departments.dept_no = dept_emp.dept_no;
  
  