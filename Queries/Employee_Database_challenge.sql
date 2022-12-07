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


-- ****Deliverable 2****

-- A query is written and executed to create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965.

select distinct on (e.emp_no)
		e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		ti.title
into mentorship_eligibility
from employees as e
	join dept_employees as de
	on e.emp_no = de.emp_no
	join titles as ti
	on e.emp_no = ti.emp_no
where (e.birth_date between '1965-01-01' and '1965-12-31')
	and de.to_date = '9999-01-01'
order by e.emp_no;

-- export mentorship table
select * from mentorship_eligibility

-- deliverable 2.5 bonus. join retiring_titles to mentorship_eligibility to clearly show how many of each title is elegible for mentorship

select count(emp_no), title
into mentorship_detail_count
from mentorship_eligibility
group by title
order by count(emp_no) desc;


-- table that completes 2.5 goal
select  rt.title,
		rt.count,
		md.count2,
into silver_exit
from retiring_titles as rt
inner join mentorship_detail as md
on rt.title = md.title
order by (rt.count) desc;

select 
	(se.count2/se.count::float) * 100.0 as percentage
into exit_percentage
from silver_exit as se
order by se.count desc;

select *
-- into final_data
from silver_exit as se
inner join exit_percentage; 

