use employees;

-- employees 사원 정보 ( 사원번호PK, 생일, 이름, 성별, 입사일 )
select * from employees limit 10;
desc employees;

-- departments 부서 정보 ( 부서 번호PK, 이름UNI )
select * from departments;
desc departments;

-- dept_emp 입사를 했던 모든 직원에 대한 입사, 퇴사일정보 ( 사원번호PK, 부서번호PK, 입사일, 퇴사일 )
select * from dept_emp;
desc dept_emp;

-- 역대 매니저의 정보
select * from dept_manager;

-- 연봉
select * from salaries;

-- 직급
select * from titles;
-- --------------------------------------------------------------------------

-- 그룹 함수, 그룹 바이, having절
-- group by절 
-- 그룹바이절은 데이터들을 원하는 그룹으로 나눌수 있다. 
-- 나누고자 하는 그룹의 컬럼명을 셀렉트절과 그룹바이절 뒤에 추가하면 된다.
-- 집계함수와 함께 사용되는 상수는 그룹바이절에 추가하지 않아도 된다. ( 많이 실수하는 부분 )

-- distinct 와 group by 절
-- distinct는 주로 중복을 제거하기 위해서 사용한다.
-- 그룹바이는 데이터를 그룹핑해서 그 결과를 가져오는 경우 사용한다. 
-- 하지만 두 작업은 조금만 생각해보면 동일한 형태의 작업이라는 것을 쉽게 알 수 있고, 일부 작업의 경우 
-- distinct로 동시에 처리할수도 있다.

-- having 절
-- where 절에서는 집계함수를 사용할 수 없다.
-- having 절은 집계함수를 가지고 조건을 비교할 때 사용한다. 
-- having 절은 그룹바이 절과 함께 사용된다.

use employees;
show tables;

-- 합계 함수 
-- 문제 1. 전체 직원수 뽑기(전체직원수), 제일 먼저 입사한 일자 (최초 고용일자), 제일 마지막 입사 일자 (가장 최근 고용일자)
select * from employees;
select count(*) as '전체직원수', min(hire_date) as '최초 고용일자', max(hire_date) as '가장 최근 고용일자' 
from employees;

-- 문제 2. gender로 그룹핑 
select * from employees;
select *
from employees
group by gender;

-- 문제 3. 남성, 여성 수와 gender를 표시하세요
select gender, count(gender) as 인원수
from employees
group by gender;

-- 문제 4. 고용일자로 그룹화
select hire_date
from employees
group by hire_date;

-- 문제 5. 고용일자가 같은 직원의 명수를 표시하시오 
-- 전체표시, as 동기
select *, count(hire_date) as 동기
from employees
group by hire_date;

-- 문제 6. 위 쿼리에서 남자, 여자를 구분해서 결과값을 출력하시오 
select *, count(hire_date) as 동기
from employees
group by hire_date, gender
order by hire_date asc; -- 오름 차순 / 내림차순 desc

-- PK를 두개들고 있다면 두개 합친 값이 중복이 되면 안된다.
select * from salaries;
desc salaries;

-- 급여 테이블에서 총 건수, 총 급여, 평균 급여(소수점 2자리 표현), 최고 연봉자 금액, 최소 연봉자 금액
select emp_no, count(from_date) as '총 건수', sum(salary) as '총 급여', round(avg(salary), 2) as '평균 급여',
	max(salary) as '최고연봉자의 연봉', min(salary) as '최소연봉자의 연봉'
from salaries
group by emp_no;

-- 정답 
select count(*) as '총건수',
		round(avg(salary), 2) as '평균 급여',
        max(salary) as '최고연봉',
        min(salary) as '최소연봉'
from salaries;

-- 결과에 대한 데이터 검증 
-- 하나하나 확인해보기 
select max(salary) from salaries;
select min(salary) from salaries;

-- having절 연습
-- 연봉을 10번 이상 받은 직원을 출력
select *, count(emp_no) as '횟수'
from salaries
group by emp_no
having count(emp_no) >= 10
order by emp_no asc
limit 30;

-- 문제 
select * from titles;
select count(*) from titles;

-- 1. 10만명 이상 사용하고 있는 직함의 이름과 직원의 수를 출력하시오
select title, count(*) as 직원수
from titles
group by title
having count(title) >= 100000;

-- 2. 5만명 이상 근무하고 있는 부서의 부서번호와 부서소속 사원의 수를 출력하시오 
select dept_no, count(dept_no) as '소속 사원수'
from dept_emp
group by dept_no
having count(dept_no) >= 50000;

select * from dept_emp;
-- 3. 현재 근무중인 사람들만 출력
select *
from dept_emp
where to_date = "9999-01-01";

-- 4. 과거에 매니저의 수를 구하시오 ( 그만둔 사람 ) 같지않다 연산자  :  <>
select * from dept_manager;

select dept_no, count(*) as '과거 매니저 수'
from dept_manager
where to_date <> "9999-01-01";

-- 문제 만들기
-- 그룹함수, 그룹바이, having절 + join 문제 만들기

select * from employees;
select * from titles;

-- 1. 사원수를 기준으로 하여 사원번호, last_name, 직급, 입사일 조회하기 ( 단, 입사일이 1990년 이하인 사람만 )
select e.emp_no, e.last_name, t.title, e.hire_date
from employees as e
inner join titles as t
on e.emp_no = t.emp_no
having e.hire_date < '1990-01-01';


select * from employees;
select * from titles;
select * from salaries;

-- 2. 사원번호, 사원이름, 직급, 현재연봉, 성별, 입사일을 조회하기 ( 단, 연봉이 높은 순으로)
select e.emp_no, e.last_name, t.title, s.salary, e.gender, e.hire_date
from employees as e
left join titles as t 
on e.emp_no = t.emp_no
left join salaries as s
on e.emp_no = s.emp_no
group by e.emp_no
order by s.salary desc;

-- 3. 부서번호를 기준으로 부서별 사원이름 출력하기


-- 반 학생 문제 
-- 1. 재직자 중에서 가장 연봉이 높은 10명의 직원이름과 연봉을 출력해주세요
