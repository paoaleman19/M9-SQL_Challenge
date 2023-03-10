--DATA ANALYSIS

-- List the employee number, last name, first name, sex, and salary of each employee.
--From the employee table get the following info: employee number, last name, firstname, sex
--From salaries table get the following information: salary
SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM employees e
	INNER JOIN salaries s
	ON e.emp_no = s.emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
    first_name,
    last_name,
	hire_date
FROM 
	employees 
WHERE EXTRACT ('year'FROM hire_date) = 1986;



-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
--From the department manager table get the following info: department number, employee number
--From the employees table get: the employee last name and first name
SELECT 
	dm.dept_no, 
	d.dept_name, 
	dm.emp_no, 
	e.last_name, 
	e.first_name
FROM dept_manager dm
	INNER JOIN departments d
	ON dm.dept_no = d.dept_no
	
	INNER JOIN employees e
	ON dm.emp_no = e.emp_no;
	


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
--From the employee table: emp number, last name and first name
-- from the department table: department name
--from dept_emp table: department number

SELECT 
	de.dept_no,
	e.emp_no,
	e.last_name, 
	e.first_name, 
	d.dept_name
	
FROM employees e
	INNER JOIN dept_emp de
	ON de.emp_no = e.emp_no
	INNER JOIN departments d
	ON d.dept_no = de.dept_no;


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	first_name,
    last_name,
	sex
FROM
	employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	de.dept_no
FROM dept_emp de
INNER JOIN employees e
ON de.emp_no = e.emp_no
WHERE dept_no = 'd007'


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON de.emp_no = e.emp_no
INNER JOIN departments d
ON d.dept_no = de.dept_no
WHERE (dept_name = 'Sales') OR (dept_name ='Development') 


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) as f
FROM employees
Group BY last_name 
ORDER BY f desc



