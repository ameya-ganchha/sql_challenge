-- problem 1 
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary 
from "Employees" as e INNER JOIN "Salaries" as s 
on e.emp_no = s.emp_no ;

--problem 2 
/*
2. List employees who were hired in 1986.
*/
--select emp_no, first_name, last_name
select *
from "Employees"
where hire_date like '1986%';

/*
3. List the manager of each department with the following information:
department number, department name, the manager's employee number,
last name, first name, and start and end employment dates.
*/
select d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name, dm.from_date, dm.to_date
from "Departments" as d inner join  "Dept_Manager" as dm on dm.dept_no= d.dept_no 
inner join "Employees" as e on dm.emp_no = e.emp_no ;


/*
4. List the department of each employee with the following information:
employee number, last name, first name, and department name.
*/
select e.emp_no, e.first_name, e.last_name, d.dept_name
from "Departments" as d inner join  "Dept_Emp" as de on de.dept_no= d.dept_no 
inner join "Employees" as e on de.emp_no = e.emp_no ;

/*
5. List all employees whose first name is "Hercules" and last names begin with "B."
*/
select * 
from "Employees" as e 
where e.first_name = 'Hercules' and e.last_name like 'B%';

/*
6. List all employees in the Sales department, 
including their employee number, last name, first name, and department name.
*/
select e.emp_no, e.first_name, e.last_name, d.dept_name
from "Departments" as d inner join  "Dept_Emp" as de on de.dept_no= d.dept_no 
inner join "Employees" as e on de.emp_no = e.emp_no 
where d.dept_name='Sales' ;

/*
7. List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name.
*/
select e.emp_no, e.first_name, e.last_name, d.dept_name
from "Departments" as d inner join  "Dept_Emp" as de on de.dept_no= d.dept_no 
inner join "Employees" as e on de.emp_no = e.emp_no 
where d.dept_name='Sales' or d.dept_name='Development';

/*
8. In descending order, list the frequency count of employee last names, 
i.e., how many employees share each last name.
*/
select last_name , count(last_name) 
from "Employees"
group by last_name
order by count(last_name) desc ;