# BootcampModule7
Pewlett-Hackard-Analysis
Module 7

## Overview of the analysis.

-  We were tasked with analizing employee data to help Pewlett-Hackard prepare for a so called "Silver Exit" of employees.

-  Using the provided tables determine, identify and analyze data using SQL.

-  Create queries to filter data and answer questions using the datasets provided
   

### Results:

1- *Retirement titles table*

- By filtering the date by age, we are able to determine that of the 300,000 employees at PH, 133776 people will be eligible for retirement. 

```
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
```

However this initial number isnt entirely accurate as it includes people who have changed job titles multiple times. So we need to further filter the data


2- *Unique titles*
```
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
```
By filtering by title we are able to determine that 72458 people are approaching retirement age. 24% is still a signigicant amount of the workforce. While this is certainly important information, we can make this information easier to read my counting the unique titles into a single table.

3- *Retiring titles*

- ![image](https://github.com/LordNebbs/BootcampModule7/blob/97a6a739d470cff38a49649ffe2158cd9dbf701d/Tables/retiring%20titles.png)

This clearly shows that PH is going to need to hire agressively to fill the massive void of talent that is immenently coming. 

4- *Mentorship eligibility*

-  Mentorship is a great way to help get the next generation up to speed and make sure that the talent and knowledge cultivated within the company is not lost. However when using a 10 year bufffer from the current retirement cutoff dates, on average accross the 72458, 3.2% per title are eligible to mentor younger employees. Assistant Engineers are the most covered with 7.15% coverage based on those leaving where Senior Engineers have 0.65% coverage.

![image](https://github.com/LordNebbs/BootcampModule7/blob/main/Tables/Silver%20Exit.png)

-   The ammount of "Brain Drain" is staggering and a better mentoring program is needed and perhaps the criteria and the mapping of the mentoring program to the titles replaced, needs to be reviewed to match the demands at Pewlett Packard.


# Summary:

-   Based on the results, PH is facing a crisis. If something is not done to address the massive workforce loss, whoever is left to fill in their shoes will not only be potentially understaffed, but unequipped to handle problems faced as the people who pioneered the departments are no longer available.

# Suggestions
1- Retooling the milestone triggers for mentorship needs to be explored. Query and table to show the people ahead of retirement time so that the retirement date would match new people mentored or ready for work as per HR policies and goals. This way the retirement exit will not be as big.

2- More titles that will retire can be eligible for mentorship. Direct quota increase or criterias that allow more retiring titles to be eligible for mentorship. 

