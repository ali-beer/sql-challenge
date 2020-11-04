-- 1. Employee details
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries as s ON
e.emp_no = s.emp_no;

-- 2. Employees hired in 1986
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE EXTRACT(YEAR FROM e.hire_date)=1986; 

-- 3. Manager of each department
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name 
FROM dept_manager as m
INNER JOIN departments AS d ON
m.dept_no = d.dept_no
INNER JOIN employees AS e ON
m.emp_no = e.emp_no;

-- 4. Department of each employee 
SELECT d.dept_name, de.emp_no, e.first_name, e.last_name
FROM departments AS d
INNER JOIN dept_emp AS de ON
d.dept_no = de.dept_no
INNER JOIN employees AS e ON
de.emp_no = e.emp_no;

SELECT e.emp_no, e.first_name, e.last_named, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no;

-- 5. Employees whose first name is Hercules and last names begin with 'B'
SELECT e.first_name, e.last_name, e.sex
FROM employees as e
WHERE e.first_name = 'Hercules' 
AND e.last_name LIKE 'B%'; 

-- 6. Employees in the Sales department
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e 
INNER JOIN dept_emp as de ON
e.emp_no = de.emp_no
INNER JOIN departments as d ON
de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. Employees in the Sales and Development departments
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e 
INNER JOIN dept_emp as de ON
e.emp_no = de.emp_no
INNER JOIN departments as d ON
de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR
	d.dept_name = 'Development';

-- 8. Number of employees with the same last name
SELECT e.last_name, COUNT(e.last_name) AS "Number of employees with last name"
FROM employees AS e
GROUP BY e.last_name
ORDER BY COUNT(e.last_name) DESC;
