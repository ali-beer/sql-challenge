CREATE TABLE titles (
	title_id VARCHAR(30) PRIMARY KEY,
	title VARCHAR(30)
);

CREATE TABLE departments (
	dept_no VARCHAR(30) PRIMARY KEY,
	dept_name VARCHAR(30)
);

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(30),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(30),
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);
	
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(30),
	birth_date DATE,	
	first_name VARCHAR(30),
	last_name VARCHAR(30),	
	sex VARCHAR(30),	
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id) 
);
	
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no) 
);

