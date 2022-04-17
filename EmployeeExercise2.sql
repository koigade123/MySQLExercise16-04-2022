
 
-- 16.Write a SQL query to display the 5 least earning employees
select
	first_name,
	last_name,
	job_id,
	salary
    from employees
    order by salary asc limit 5; 
    
-- 17.Find the employees hired in the 80s  
select 
employee_id,
concat(first_name,' ' , last_name) employee,
hire_date
from employees
where year(hire_date) between 1980 and 1989;


--  18.Display the employees first name and the name in reverse order
select 
first_name, 
reverse(First_name) as reversed_Name 
from employees;

-- . 19.Find the employees who joined the company after 15th of the month
 select 
 employee_id,
 concat(first_name, ' ' , last_name) employee,
 hire_date
 from employees
 where day(hire_date)> 15;