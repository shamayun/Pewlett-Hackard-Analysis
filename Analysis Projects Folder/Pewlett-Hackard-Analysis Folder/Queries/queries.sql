--Determine Retirement Eligibility between 1952 and 1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

--how many employees were born in 1952
SELECT count (first_name)
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--creating a new table from existing table using INTO
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT 	retirement_info.emp_no,
    	retirement_info.first_name,
		retirement_info.last_name,
    	dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp 
ON retirement_info.emp_no = dept_emp.emp_no;

-- Joining departments and dept_manager tables using ALIAses
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

--get all retirement eligible employees that they are actually still/currently employed with PH
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');
select * from current_emp;

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO employee_retirement_bydept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;
select * from employee_retirement_bydept;

-- Employee count by department number ANOTHER METHOD that ALAN SETO taught
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce, dept_emp as de
where ce.emp_no = de.emp_no
GROUP BY de.dept_no;
