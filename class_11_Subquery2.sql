-- 서브쿼리 2
use employees;

-- 1 : N 관계
select * from dept_emp;
select * from employees;

-- 1 : N 관계
select * from departments order by dept_no;
select * from dept_emp;

select * from dept_manager;
select * from titles;

select *, dept_no as '뽑아야 되는 값'
from departments as a
where a.dept_name = 'development';

-- 문제 1. 중첩 서브쿼리 이용 
-- dept_emp 테이블에서 development인 emp_no와 dept_no를 출력하세요 
desc dept_manager;

select emp_no, dept_no
from dept_emp as d
where dept_no in (select dept_no 
					from departments
                    where dept_no = 'd005');
                    
-- 문제 2. 중첩 서브쿼리 이용 
-- employees 테이블에서 현재 development 매니저인 직원만 출력하시오 
select *
from employees
where emp_no in (select emp_no 
					from dept_manager
                    where to_date = '9999-01-01'
                    and dept_no = 'd005');
-- 단일행 결과집합이 나와서 외부쿼리인 emp_no조건식으로 처리된다. 

-- d005를 문자열로 보기 쉽게 변경해서 출력하기 
select *
from employees
where emp_no in (select emp_no 
					from dept_manager
                    where to_date = '9999-01-01'
                    and dept_no = (select dept_no 
									from departments
                                    where dept_name = 'development'));
                                    
/*
	다중행 서브쿼리 
    결과값이 두건 이상 출력되는 것을 말한다. 다중행 서브쿼리는 쿼리의 결과가 여러건 출력되기 때문에 
    단일행 연산자를 사용할 수 없다. in을 사용해줘야 함.
*/


-- join 
select a.emp_no, a.first_name, b.title
from employees as a
inner join titles as b
on a.emp_no = b.emp_no;

-- inline 뷰로 결과를 출력해주세요
select a.emp_no, a.first_name, b.title
from employees as a, (select * from titles) as b
where a.emp_no = b.emp_no;

-- 직원 테이블에서 부서 팀장만 출력하시오 ( join사용, 현재 근무 중인 사람만 출력 )
select * from dept_manager;

select a.emp_no, a.last_name, a.gender, d.to_date
from employees as a
inner join dept_manager as d
on a.emp_no = d.emp_no
where a.emp_no in (select emp_no
					from dept_manager
                    where to_date = '9999-01-01');

-- 인라인 뷰로 출력 하기 
select a.emp_no, a.last_name, a.gender
from employees as a, (select *
						from dept_manager
                        where to_date = '9999-01-01') as b
where a.emp_no = b.emp_no;

-- 스칼라 서브쿼리 ( select 절에 사용하는 서브쿼리 ) 
-- select절에 서브쿼리를 사용하여 하나의 컬럼처럼 사용하기 위한 목적
-- join의 대체 표현식으로 자주 사용하지만 성능면에서 좋은편이 아니다. 

select *, (select dept_name 
			from departments as b 
            where a.dept_no = b.dept_no) as '부서명'
from dept_manager as a 
where to_date = '9999-01-01';

-- 문제 employees테이블에서 emp_no, first_name, title명 출력하기 
-- 스칼라 서브쿼리 사용해서 결과 뽑기 

select * from titles;
select * from employees;

-- 단일행으로 변경해야 한다. (title)
select e.emp_no, e.first_name, (select t.title
								from titles as t
								where e.emp_no = t.emp_no
                                group by emp_no) as '직급'
from employees as e;

select * from salaries;
select * from titles;

-- 문제 만들기 
-- 중첩 
-- 직급이 Senior Engineer 인 직원의 정보만 출력하기
select *
from employees
where emp_no in (select emp_no
					from titles
                    where title = 'Senior Engineer');

-- 인라인뷰
-- 연봉이 80_000이상인 사람의 정보만 출력하시오 ( employees 테이블 사용하기 )
select e.emp_no, e.last_name, e.gender, s.salary
from employees as e, (select *
						from salaries
						where salary >= 80000
                        and to_date = '9999-01-01'
                        group by emp_no) as s
where e.emp_no = s.emp_no;


-- 스칼라 
-- 직원의 사번과 last_name, 연봉을 출력하라 
select e.emp_no, e.last_name, (select s.salary
								from salaries as s
                                where e.emp_no = s.emp_no
                                and to_date = '9999-01-01'
                                group by emp_no) as '연봉'
from employees as e;

-- -----------------------------------------------------------
use employees;

-- 반학생 문제
select * from employees;
select * from dept_manager; -- 매니저의 입사 퇴사 날짜 직원번호, 부서번호 
select * from dept_emp; -- 입사 퇴사 부서번호
select * from departments; -- 부서번호 부서 이름 
select * from titles;

-- 1. 
-- 1-1. 중첩 서브쿼리
-- 개발팀 manager 중 2000년 1월 1일 이전 퇴사자
select *
from employees 
where emp_no in (select emp_no
					from dept_manager
					where dept_no = 'd005' 
                    and to_date < '2000-01-01');
                    
-- 1-2. 인라인 뷰
-- 직원 테이블에서 2000년 1월 1일 이전 퇴사한 부서 팀장만 출력
select *
from employees as e, (select * 
						from dept_manager
                        where to_date < '2000-01-01') as d
where e.emp_no = d.emp_no;

-- 1-3. 스칼라 서브쿼리
-- 직원 테이블에서 emp_no, first_name 출력하고 알맞은 부서번호 dept_emp 테이블에서 출력
select emp_no, first_name, (select dept_no
								from dept_emp as d
                                where e.emp_no = d.emp_no
                                group by emp_no) as '부서 번호'
from employees as e;

-- 2.
-- 2-1. 중첩 서브쿼리
-- 직함이 Senior Enginner인 직원 정보 출력
select *
from employees
where emp_no in (select emp_no
					from titles
                    where title = 'Senior Engineer');

-- 2-2. 인라인 뷰
-- d001 부서의 역대 매니저 출력
