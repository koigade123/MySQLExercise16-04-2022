 -- 9.Find the salary range of employees
  select min(salary) min_sal, 
 max(salary) max_sal,
 avg(salary) avg_sal1,
 round(avg(salary)) avg_sal2
 from employees;

-- 10. Write a query to divide people into three groups based on their salaries
 select 
 concat(first_name,' ',last_name) employee,
 salary,
 case
 when salary >=2000 and salary < 5000 then "low" 
 when salary >=5000 and salary < 10000 then "mid"
 else
 "high"
 end as salary_level
 from employees;
 -- order by 1;
 
 
  -- . 11.Select the employees whose first_name contains “an”
select
	first_name,
	last_name,
	job_id,
	salary
from employees
where first_name like '%an%';

 -- 12. Select employee first name and the corresponding phone number in the format (_ _ _)-(_ _ _)-(_ _ _ _)
 SELECT 
concat(first_name, ' ', last_name) employee,
replace(phone_number,'.','-') phone_number
 from employees;

-- 13.Find the employees who joined in August, 1994.
select 
first_name, 
last_name ,
 hire_date
 from employees
 where year(hire_date) = '1994'
 and month(hire_date) = '08';

-- 14.Write an SQL query to display employees who earn more than the average salary in that company
select avg(salary)
FROM employees;
select 
* 
from employees
where salary > (select avg(salary) from employees);

select 
 concat(emp.first_name,last_name),
 emp.employee_id, 
 dept.department_name,
 dept.department_id,
 emp.salary
 from departments dept
 JOIN employees emp 
-- on dept.department_id = emp.department_id
USING(DEPARTMENT_ID)
 where emp.salary > (select avg(salary) from employees)
 order by dept.department_id;
 
-- 15. Find the maximum salary from each department.

select 
 dept.department_id,
 dept.department_name,  -- department,
 max(emp.salary)      --  maximum_salary
 from departments dept
 join employees emp 
-- on dept.department_id = emp.department_id
 using(department_id)
group by dept.department_name,
       dept.department_id
 order by dept.department_id ;
