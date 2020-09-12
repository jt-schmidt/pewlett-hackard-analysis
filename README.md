# pewlett-hackard-analysis
Module 7 for UT Austin Data Visualization Bootcamp -- SQL project

<!---
There is a title, and there are multiple sections. (2 pt)
Each section has a heading and subheading. (2 pt)
Links to images are working and displayed correctly. (2 pt)
--->

<!---
The purpose of the new analysis is well defined. (3 pt)
--->
## Overview

<!---
There is a bulleted list with four major points from the two analysis deliverables. (6 pt)
--->
## Results

- bullet1
- bullet2
- bullet3
- bullet4
![EmployeeDB](/EmployeeDB.png)

```SQL
/* RETIREMENT_TITLES */
select
	e.emp_no, 
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
into retirement_titles
from employees e
inner join titles t on e.emp_no = t.emp_no
where 
	e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
order by
	e.emp_no
```

```SQL
/* UNIQUE_TITLES */
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles rt
ORDER BY rt.emp_no, rt.to_date DESC;
```

```SQL
/* RETIRING TITLES */
select
	count(ut.title),
	ut.title
into retiring_titles
from unique_titles ut
group by
	ut.title
order by 
	count(ut.title) desc
```

```SQL
/* MENTORSHIP_ELIGIBILITY */
select distinct on (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
into mentorship_eligibilty
from employees e
inner join dept_emp de on e.emp_no = de.emp_no
inner join titles t on e.emp_no = t.emp_no
where 	
	e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
order by
	e.emp_no
```
<!---
The summary addresses the two questions and contains two additional queries or tables that may provide more insight. (5 pt)
--->
## Summary

*Question 1:  How many roles will need to be filled as the "silver tsunami" begins to make an impact?*

*Question 2: Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?*
