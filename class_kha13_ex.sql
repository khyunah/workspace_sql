# 그룹바이 / 뷰 연습
use employees;

select * 
from employees;

select *, count(*) as '부서별 인원수'
from dept_emp
group by dept_no;

select emp_no, max(salary) as 최고연봉, min(from_date)as 입사, max(to_date) as 재직여부, count(*) as 연봉협상수
from salaries
group by emp_no
having 최고연봉 > (select avg(salary)
					from salaries);
                    
select distinct(dept_no)
from dept_emp;

create view view_employees
as select * from employees
limit 10;

select * from view_employees;

drop view view_employees;

create table employees_2
select * from employees limit 10;

select * from employees_2;

drop table employees_2;