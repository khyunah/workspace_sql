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