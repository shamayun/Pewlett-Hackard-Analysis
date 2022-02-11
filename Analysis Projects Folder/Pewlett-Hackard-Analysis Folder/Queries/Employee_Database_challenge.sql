--steps 1 to 7
select 	e.emp_no, e.first_name, e.last_name,
		t.title, t.from_date, t.to_date
into	retirement_titles
from 	employees e, titles t
where	e.emp_no = t.emp_no
and 	e.birth_date between '1952-01-01' and '1955-12-31'
Order by emp_no;

--drop table retirement_titles
select * from retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows (steps 8-15 )
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;
select * from unique_titles;
--drop table unique_titles;

--steps 16-21, # of employee/title by department retiring soon
select count (emp_no), title
into retiring_titles
from unique_titles 
group by title
order by count desc;
select * from retiring_titles;

-deliverable #2 
select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, d.from_date, d.to_date, t.title
into mentorship_eligibility
from employees e, dept_emp d, titles t
where e.emp_no = d.emp_no
and e.emp_no = t.emp_no
and d.to_date = '9999-01-01'
and e.birth_date between '1965-01-01' and '1965-12-31'
order by emp_no;

select * from mentorship_eligibility;
select count(emp_no) from mentorship_eligibility
--mentorship availablity by department
select dept_name, count (m.emp_no) as available_mentors
from mentorship_eligibility m, dept_emp d, departments de
where m.emp_no = d.emp_no
and	d.dept_no = de.dept_no
group by dept_name
order by available_mentors

--linking department information to retiring employees

select u.emp_no, u.first_name, u.title, de.dept_name
into emp_by_dept
from unique_titles u, dept_emp d, departments de
where u.emp_no = d.emp_no
and d.dept_no = de.dept_no;

--No of employees retiring by departments
select dept_name, count (emp_no)as "Number of Employees"
from emp_by_dept
group by dept_name
order by "Number of Employees" DESC;
select * from emp_by_dept;


--categorizing employees who are close to retirment & eligible for mentorship using CASE
select distinct
	count(e.emp_no)as Number_of_Employees, 
	case
		when (e.birth_date between '1965-01-01' and '1965-12-31') then 'Potential Mentors'
		when (e.birth_date between '1952-01-01' and '1955-12-31') then 'Retiring Next'
		else 'Not Retiring Soon'
	end as Category --defining columns
from
	employees as e
	inner join
		dept_emp as d
		ON d.emp_no = e.emp_no
where d.to_date = '9999-01-01'
group by category
order by count (e.emp_no) desc;

-- A table that has all current employees with status column:

--drop table ready_status;
select distinct on (e.emp_no) e.emp_no, t.title, t.to_date as title_to_date, e.birth_date, d.to_date as work_to_date,
	case
		when (e.birth_date between '1965-01-01' and '1965-12-31') then 'Potential Mentors'
		when (e.birth_date between '1952-01-01' and '1955-12-31') then 'Retiring Next'
		else 'Not Retiring Soon'
	end category
into ready_status -- creating a table here, needs to be deleted if any update in other queries
from
	employees as e
	inner join dept_emp as d
	on d.emp_no = e.emp_no
	inner join titles as t
	on t.emp_no = e.emp_no
where d.to_date = '9999-01-01'
order by e.emp_no, t.to_date DESC;
select * from ready_status limit 15;



--Query to group employees by title and status:

select count (emp_no) as Number_of_Employees, title, category
from ready_status
group by title, category 
order by title, Number_of_Employees;
