-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
ORDER BY _____, _____ DESC;

/* STARTER CODE ABOVE */
/* CHALLENGE WORK BELOW */

/* DELIVERABLE 1 */

/*1.  Retrieve the emp_no, first_name, and last_name columns from the Employees table. */
select
	emp_no,
	first_name,
	last_name
from employees
--Successfully run. Total query runtime: 181 msec. 300024 rows affected.

/*2. Retrieve the title, from_date, and to_date columns from the Titles table. */
select
	title,
	from_date,
	to_date
from titles
--Successfully run. Total query runtime: 256 msec. 443308 rows affected.

/* retirement_titles table */
select
	e.emp_no, 
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
/*3.  Create a new table using the INTO clause. */
into retirement_titles
from employees e
/*4.  Join both tables on the primary key */
inner join titles t on e.emp_no = t.emp_no
where 
/*5. Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. */
	e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
/*5. Then, order by the employee number. */
order by
	e.emp_no
--Successfully run. Total query runtime: 673 msec. 443308 rows affected.

--confirm new table
select * from retirement_titles order by emp_no
--Successfully run. Total query runtime: 179 msec. 133776 rows affected.


/*9. Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.*/
/*10. Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.*/
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
/*11. Create a Unique Titles table using the INTO clause.*/
INTO unique_titles
FROM retirement_titles rt
/*12. Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e. to_date) of the most recent title.*/
ORDER BY rt.emp_no, rt.to_date DESC;
--SELECT 90398 Query returned successfully in 184 msec.

--confirm new table
select * from unique_titles
--Successfully run. Total query runtime: 96 msec. 90398 rows affected.

/*15. Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.*/
/*16. First, retrieve the number of titles from the Unique Titles table.*/
select
	count(ut.title),
	ut.title
/*17. Then, create a Retiring Titles table to hold the required information.*/
into retiring_titles
from unique_titles ut
/*18. Group the table by title, then sort the count column in descending order.*/
group by
	ut.title
order by 
	count(ut.title) desc
--SELECT 7 Query returned successfully in 53 msec.

--confirm new table
select * from retiring_titles
--Successfully run. Total query runtime: 49 msec. 7 rows affected. 

/* DELIVERABLE 2 */

select
/*4. Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.*/
distinct on (e.emp_no)
/*1. Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.*/
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
/*2. Retrieve the from_date and to_date columns from the Department Employee table.*/
	de.from_date,
	de.to_date,
/*3. Retrieve the title column from the Titles table. */
	t.title
/*5. Create a new table using the INTO clause.*/
into mentorship_eligibilty
from employees e
/*6. Join the Employees and the Department Employee tables on the primary key.*/
/*7. Join the Employees and the Titles tables on the primary key.*/
inner join dept_emp de on e.emp_no = de.emp_no
inner join titles t on e.emp_no = t.emp_no
/*8. Filter the data on the to_date column to get current employees whose birth dates are between January 1, 1965 and December 31, 1965.*/
where 	
	e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
/*9. Order the table by the employee number.*/
order by
	e.emp_no
--SELECT 1940 Query returned successfully in 175 msec.

--confirm new table
select * from mentorship_eligibilty
--Successfully run. Total query runtime: 61 msec. 1940 rows affected.

