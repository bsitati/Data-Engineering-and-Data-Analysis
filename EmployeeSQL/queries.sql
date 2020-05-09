select * from dept_manager;
select * from titles;
select * from dept_emp;
select * from salaries;
select * from department;
select * from employees;

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no,e.last_name, e.first_name, e.sex, s.salary 
from employees e INNER JOIN salaries s
ON e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name,hire_date 
	from employees 
	where EXTRACT(Year FROM hire_date) = 1986; 


-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select 	e.emp_no, 
		e.last_name, 
		e.first_name,
		d.dept_no,d.dept_name
from employees e
left join dept_manager as j on j.emp_no = e.emp_no
left join department as d on j.dept_no = d.dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
-- select  e.emp_no, e.last_name, e.first_name
-- from employees e, 

select 	e.emp_no, 
		e.last_name, 
		e.first_name,
		d.dept_name
from employees e
left join dept_emp as j on j.emp_no = e.emp_no
left join department as d on j.dept_no = d.dept_no;

--OR
select 	e.emp_no, 
		e.last_name, 
		e.first_name,
		dj.dept_name
from employees e left join
	(select *
      from dept_emp j join
	 	department d
           on d.dept_no = j.dept_no) dj
     on dj.emp_no = e.emp_no;


-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select 	e.first_name, 
		e.last_name, 
		e.sex
from employees e
where e.first_name ='Hercules'
AND e.last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select 	e.emp_no, 
		e.last_name, 
		e.first_name,
		d.dept_name
from employees e
left join dept_emp as j on j.emp_no = e.emp_no
left join department as d on j.dept_no = d.dept_no
where d.dept_name = 'Sales';

--or

select 	e.emp_no, 
		e.last_name, 
		e.first_name,
		d.dept_name
from employees e left join
	(select * from dept_emp
	where emp_no IN (select emp_no from department d)) dj
	where dj.emp_no = e.emp_no;



-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select 	e.emp_no, 
		e.last_name, 
		e.first_name,
		d.dept_name
from employees e
left join dept_emp as j on j.emp_no = e.emp_no
left join department as d on j.dept_no = d.dept_no
where d.dept_name = 'Sales'
OR d.dept_name = 'Development'; 

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name , count (last_name)
from employees
group by last_name
ORDER BY count DESC;

----------search employee no - 499942

select * from employees where emp_no = 499942;
--April Foolsday :-()


