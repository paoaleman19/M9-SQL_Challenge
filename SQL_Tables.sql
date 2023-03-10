CREATE TABLE departments (
	dept_no VARCHAR (4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR (40) NOT NULL
);

SELECT * FROM departments;


CREATE TABLE titles (
	title_id VARCHAR (5)PRIMARY KEY NOT NULL,
	title VARCHAR (50) NOT NULL
);

SELECT * FROM titles;



CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR (25),
	birth_date DATE,
	first_name VARCHAR (25),
	last_name VARCHAR (25),
	sex VARCHAR,
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

SELECT * FROM employees;



CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR (20) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp;



CREATE TABLE dept_manager (
	dept_no VARCHAR (10) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
SELECT * FROM dept_manager;


CREATE TABLE salaries (
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
SELECT * FROM salaries;


