DELETE FROM usertbl WHERE userName = '이승기';
DELETE FROM buytbl WHERE userName = '이승기';

-- 제약키 쓰는 이유 생각해보기 
-- 자식테이블 정보는 삭제가능, 부모테이블 정보는 삭제가 안된다.

USE employees;

create table test11(
	name varchar(10) not null,
    age int,
    address varchar(10)
);

alter table test11 add gender enum('M','F');
alter table test11 add birth_year int;

select * from test11;
desc test11;

update test11 set name = '김길동', age = 22 where name = '김현아';

-- --------------------------------------------------
SELECT * FROM employees; -- 사번, 생일, 이름, 성별, 고용일
SELECT * FROM dept_emp; -- 사번, 부서번호, 입사일, 퇴사일
SELECT * FROM dept_manager; -- 역대 매니저 부서번호, 사번, 입사일, 퇴사일
SELECT * FROM departments; -- 부서번호, 부서이름
SELECT * FROM salaries; -- 사번, 연봉, 연봉언제부터, 연봉언제까지
SELECT * FROM titles; -- 사번, 직급, 입사, 퇴사

DESC employees;
DESC dept_emp;
DESC dept_manager;
DESC departments;
DESC salaries;
DESC titles;
