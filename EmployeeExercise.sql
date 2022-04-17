-- 1.Select employees first name, last name, job_id and salary whose first name starts with alphabet S.
select
	first_name,
	last_name,
	job_id,
	salary
from employees
where first_name like 'S%';

-- 2.Write a query to select employee with the highest salary
select
  first_name,
  last_name,
  salary
 from employees
 order by salary desc;
 
 select employee_id,
        first_name,
        last_name,
        job_id,
        salary
 from employees
 where salary = (select max(salary) from employees);
 
select
first_name,
 max(salary) 
 from employees; 
 
 -- 3.Select employee with the second highest salary
select max(salary) 
 from employees 
where salary <(select MAX(salary)from employees);

-- 8.Get the count of employees hired year wise
 select 
 year(hire_date) hired_year, 
 count(*) employees_hired_count
 from employees
 group by year(hire_date)
 order by 2 desc;


