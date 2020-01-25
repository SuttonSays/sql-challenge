--Once you have a complete database, do the following:

--List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees e
inner join salaries s on s.emp_no = e.emp_no
order by 1;

--List employees who were hired in 1986.
select emp_no, last_name, first_name
from employees where hire_date between '1986-01-01' and '1986-12-31'

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, e.hire_date, dm.to_date
from dept_manager dm
join departments d on d.dept_no = dm.dept_no
join employees e on e.emp_no = dm.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
left join departments d on d.dept_no = de.dept_no 
order by 1;

--List all employees whose first name is "Hercules" and last names begin with "B."
select emp_no, last_name, first_name from employees 
where first_name='Hercules'
and last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name 
from employees e
inner join dept_emp de on e.emp_no = de.emp_no
inner join departments d on de.dept_no = d.dept_no
where d.dept_name ='Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e 
inner join dept_emp de on e.emp_no = de.emp_no
inner join departments d on de.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "Name Count" 
from employees
group by last_name
order by 2 desc;

--Bonus (Optional)
--As you examine the data, you are overcome with a creeping suspicion that the dataset is fake. You surmise that your boss handed you spurious data in order to test the data engineering skills of a new employee. To confirm your hunch, you decide to take the following steps to generate a visualization of the data, with which you will confront your boss:

--Import the SQL database into Pandas. (Yes, you could read the CSVs directly in Pandas, but you are, after all, trying to prove your technical mettle.) This step may require some research. Feel free to use the code below to get started. Be sure to make any necessary modifications for your username, password, host, port, and database name:

--from sqlalchemy import create_engine
--engine = create_engine('postgresql://localhost:5432/<your_db_name>')
--connection = engine.connect()
--Consult SQLAlchemy documentation for more information.

--If using a password, do not upload your password to your GitHub repository. See https://www.youtube.com/watch?v=2uaTPmNvH0I and https://martin-thoma.com/configuration-files-in-python/ for more information.

--Create a histogram to visualize the most common salary ranges for employees.

--Create a bar chart of average salary by title.