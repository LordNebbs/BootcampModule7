# BootcampModule7
Pewlett-Hackard-Analysis
Module 7

## Overview of the analysis.

-  We were tasked with analizing employee data to help Pewlett-Hackard prepare for a so called "Silver Exit" of employees.

-  Using the provided tables determine, identify and analyze data using SQL.

-  Create queries to filter data and answer questions using the datasets provided
   

### Results:

1- *Retirement titles table*

- By filtering the date by title and age, we are able to determine that of the 300,000 employees at PH, 24% will be eligible for retirement.

![image](https://github.com/LordNebbs/BootcampModule7/blob/97a6a739d470cff38a49649ffe2158cd9dbf701d/Tables/retiring%20titles.png)

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

2- *Unique titles*

-   Actually indicates the people that will retire. 

-   The results suggest that 30% of the pople will retire (90,398/300,024). Now the analysis becomes cleaner as it actually identifies data to be analyzed and to be taken into consideration for a closer look and action.


3- *Retiring titles*

-  Below are the titles that will retire and what should be the focus of HR team.

*count	title*

29414	    Senior Engineer

28254	    Senior Staff

14222	    Engineer

12243	    Staff

4502	    Technique Leader

1761	    Assistant Engineer

2	        Manager

-  Recruiting or training etc. should be focused on the dimensions of this positions that will be in more demand.


4- *Mentorship eligibility*

-   This data suggests that less than 2% of titles to be replaced are eligible for mentoring programs.

-   Clearly better mentoring is needed and perhaps the criteria and the mapping of the mentoring program to the titles replaced, needs to be reviewed to match the demands at Pewlett Packard


# Summary:

-   Based on the results, the two queries or tables that may provide additional insight are as below:

1- Query and table to show the people ahead of retirement time as milestone that would trigger mentorship programs so that the retirement date would match new people mentored or ready for work as per HR policies and matrixes. 

2- More titles that will retire can be eligible for mentorship. Direct quota increase or criterias that allow more retiring titles to be eligible for mentorship. 

