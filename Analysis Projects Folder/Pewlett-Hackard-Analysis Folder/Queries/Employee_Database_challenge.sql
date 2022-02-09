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

--steps 16-21, # of employee/title 
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

--select * from mentorship_eligibility;

