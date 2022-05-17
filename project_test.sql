DELETE FROM usertbl WHERE userName = '이승기';
DELETE FROM buytbl WHERE userName = '이승기';

-- 제약키 쓰는 이유 생각해보기 
-- 자식테이블 정보는 삭제가능, 부모테이블 정보는 삭제가 안된다.

USE employees;

CREATE TABLE test11(
	name VARCHAR(10) NOT NULL,
    age INT,
    address VARCHAR(10)
);

ALTER TABLE test11 ADD gender ENUM('M','F');
ALTER TABLE test11 ADD birth_year INT;

SELECT * FROM test11;
DESC test11;

UPDATE test11 SET name = '홍길동', age = 22 WHERE name = '김김김';
DELETE FROM test11 WHERE name = '홍길동';

select * from test11 where name = '김현아' and age = 5;

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
