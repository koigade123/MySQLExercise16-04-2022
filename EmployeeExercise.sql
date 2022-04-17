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
 employee_id,
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

-- 4. Fetch employees with 2nd or 3rd highest salary

 set @input:=3;
 -- set @input:=4;
 select employee_id, 
        first_name,
        last_name,
        job_id,
        salary 
 from employees e 
 where @input =(select COUNT(DISTINCT Salary) 
from employees p 
where e.Salary<=p.Salary);


-- 5. Write a query to select employees and their corresponding managers and their salaries

select 
        concat(emp.first_name,' ',emp.last_name) as employee,
        emp.salary as emp_sal,
        concat(mgr.first_name,' ',mgr.last_name) as manager,
        mgr.salary as mgr_sal
 from employees emp
 join employees mgr 
 on emp.manager_id = mgr.employee_id;

-- 6. Write a query to show count of employees under each manager in descending order
 select 
     sup.employee_id,
     concat(sup.first_name,' ', sup.last_name)  manager_name,
     count(sub.employee_id)  number_of_reportees
 from employees sub 
 join employees sup 
 on sub.manager_id = sup.employee_id
 group by sup.employee_id, 
          sup.first_name, 
          sup.last_name
 order by 3 desc;

-- 7. Find the count of employees in each department
select
 dept.department_name,
 count(emp.employee_id) emp_count
 from employees emp
 join departments dept
 -- on emp.department_id = dept.department_id
 using(department_id)
 group by 
 dept.department_name
 order by 2 desc;

-- 8.Get the count of employees hired year wise
 select 
 year(hire_date) hired_year, 
 count(*) employees_hired_count
 from employees
 group by year(hire_date)
 order by 2 desc;


