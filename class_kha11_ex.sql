use employees;
select * from employees; -- 사번, 생일, 이름, 성별, 고용일
select * from dept_emp; -- 사번, 부서번호, 입사일, 퇴사일
select * from dept_manager; -- 역대 매니저 부서번호, 사번, 입사일, 퇴사일
select * from departments; -- 부서번호, 부서이름
select * from salaries; -- 사번, 연봉, 연봉언제부터, 연봉언제까지
select * from titles; -- 사번, 직급, 입사, 퇴사
desc titles;

-- 직급별 직원 조회하기 
-- join 
select *
from employees as e
inner join titles as t
on e.emp_no = t.emp_no
where t.title = 'Staff'
and t.to_date = '9999-01-01';

-- 서브쿼리 
select e.*, t.title
from employees as e, (select * from titles where title = 'Senior Engineer'
                    and to_date = '9999-01-01') as t
where e.emp_no = t.emp_no;

-- -------------------------------------------------------------------
            
-- 사원번호로 이름과 직급, 연봉 조회하기 
-- join
select e.first_name, e.last_name, t.title, s.salary
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no
inner join titles as t
on e.emp_no = t.emp_no
where e.emp_no = 10007
and s.to_date = '9999-01-01'
group by s.emp_no;

-- 서브쿼리
select e.emp_no, e.first_name, e.last_name, t.title,
		(select salary 
        from salaries as s 
        where e.emp_no = s.emp_no
        and to_date = '9999-01-01'
        group by emp_no) as salary
from employees as e, (select * 
						from titles as t 
                        where t.emp_no = 10007 
                        and t.to_date = '9999-01-01') as t
where e.emp_no = t.emp_no;


-- -------------------------------------------------------------

-- 부서별 직원 조회하기 
-- join
select *
from employees as e
inner join dept_emp as d
on e.emp_no = d.emp_no
where d.dept_no = 'd007';

-- 서브쿼리 
select *
from employees as e, (select * 
						from dept_emp
                        where dept_no = 'd007') as d
where e.emp_no = d.emp_no;

-- ---------------------------------------------------------------

-- 입사날짜별 직원 조회하기 
-- join
select *
from employees as e
inner join dept_emp as d
on e.emp_no = d.emp_no
where d.from_date > '1995-01-01';

-- 서브쿼리 
select *
from employees as e, (select *
						from dept_emp
                        where from_date > '1985-01-01') as d
where e.emp_no = d.emp_no;

-- ----------------------------------------------------------------

-- 부서별 현재 매니저 정보 조회하기
-- join
select *
from employees as e
inner join dept_manager as d
on e.emp_no = d.emp_no
where d.dept_no = 'd005'
and d.to_date = '9999-01-01';

-- 서브쿼리
select *
from employees as e
where e.emp_no in(select emp_no
					from dept_manager 
                    where dept_no = 'd004'
                    and to_date = '9999-01-01');