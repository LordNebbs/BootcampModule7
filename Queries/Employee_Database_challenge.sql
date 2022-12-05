-- ****Deliverable 1****


-- create retirement_titles table
Select 	e.emp_no,
		e.first_name,
		e.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
INTO retirement_titles
from employees as e
join titles as ti
on e.emp_no = ti.emp_no
where e.birth_date between '1952-01-01' AND '1955-12-31'
order by e.emp_no;

-- export table
Select * from retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no)
		rt.emp_no,
		rt.first_name,
		rt.last_name,
		rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no,rt.to_date DESC;

--export
select * from unique_titles;

--retrieve the number of employees by their most recent job title who are about to retir
select count(emp_no), title
into retiring_titles
from unique_titles
group by title
order by count(emp_no) desc;

-- Export retiring_titles table
select * from retiring_titles;
