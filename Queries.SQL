--1. List for the employee number and their first and last name. Listed as will be the sex and the salary.
select s.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees as e
inner join salaries as s
on s.emp_no = e.emp_no
order by s.emp_no;


-- 2. List of first and last name of employees whom were hired in 1986
select emp_no, last_name, first_name, hire_date 
from employees 
where extract(year from hire_date) = 1986;

-- 3. List for the manager of each department as well as their department number, department name, employee numbeer as well as the first and last name of employee
select distinct on (dept_manager.dept_no) dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name,dept_manager.from_date, dept_manager.to_date
from dept_manager 
inner join departments 
on dept_manager.dept_no= departments.dept_no
inner join employees 
on dept_manager.emp_no = employees.emp_no
order by dept_manager.dept_no, dept_manager.to_date DESC;

-- 4. Department number of each employee as well as the employees number. List last name,First name and department name.
select distinct on (e.emp_no) e.emp_no, e.last_name, e.first_name,d.dept_name
from employees as e
left join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
order by e.emp_no, de.to_date DESC;



-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
select e.last_name, e.first_name
from employees as e
where (e.first_name = 'Hercules') and (lower(e.last_name) like 'b%')
order by e.last_name;


-- Create table with most current departments for each employee to use for #6 and #7 below:
select distinct on (emp_no) *
into current_dept_emp
from dept_emp
order by emp_no, to_date DESC;

-- 6. List for each employee in the sales department. Include the employee number and the last name and first name
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join current_dept_emp as cde
on e.emp_no = cde.emp_no
inner join departments as d
on cde.dept_no = d.dept_no
where lower(d.dept_name) = 'sales';

-- 7. List each employee in the Sales and Development departments, Include the employee number, last name, first name and department names.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join current_dept_emp as cde
on e.emp_no = cde.emp_no
inner join departments as d
on cde.dept_no = d.dept_no
where (lower(d.dept_name) = 'sales') or (lower(d.dept_name) = 'development');

-- 8. List the frequency counts, in descending order. This is of all the employees last names. This gives us how many employees share each last name.
select last_name,count(last_name) as Frequency 
from employees 
group by last_name
order by frequency desc;
