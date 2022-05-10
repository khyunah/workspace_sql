USE employees;
SELECT * FROM employees; -- 사번, 생일, 이름, 성별, 고용일
SELECT * FROM dept_emp; -- 사번, 부서번호, 입사일, 퇴사일
SELECT * FROM dept_manager; -- 역대 매니저 부서번호, 사번, 입사일, 퇴사일
SELECT * FROM departments; -- 부서번호, 부서이름
SELECT * FROM salaries; -- 사번, 연봉, 연봉언제부터, 연봉언제까지
SELECT * FROM titles; -- 사번, 직급, 입사, 퇴사
DESC titles;

-- 직급별 직원 조회하기 
-- join 
SELECT *
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE t.title = 'Staff'
AND t.to_date = '9999-01-01';

-- 서브쿼리 
SELECT e.*, t.title
FROM employees AS e, (SELECT * FROM titles WHERE title = 'Senior Engineer'
                    AND to_date = '9999-01-01') AS t
WHERE e.emp_no = t.emp_no;

-- -------------------------------------------------------------------
            
-- 사원번호로 이름과 직급, 연봉 조회하기 
-- join
SELECT e.first_name, e.last_name, t.title, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE e.emp_no = 10007
AND s.to_date = '9999-01-01'
GROUP BY s.emp_no;

-- 서브쿼리
SELECT e.emp_no, e.first_name, e.last_name, t.title,
		(SELECT salary 
        FROM salaries AS s 
        WHERE e.emp_no = s.emp_no
        AND to_date = '9999-01-01'
        GROUP BY emp_no) AS salary
FROM employees AS e, (SELECT * 
						FROM titles AS t 
                        WHERE t.emp_no = 10007 
                        AND t.to_date = '9999-01-01') AS t
WHERE e.emp_no = t.emp_no;


-- -------------------------------------------------------------

-- 부서별 직원 조회하기 
-- join
SELECT *
FROM employees AS e
INNER JOIN dept_emp AS d
ON e.emp_no = d.emp_no
WHERE d.dept_no = 'd007';

-- 서브쿼리 
SELECT *
FROM employees AS e, (SELECT * 
						FROM dept_emp
                        WHERE dept_no = 'd007') AS d
WHERE e.emp_no = d.emp_no;

-- ---------------------------------------------------------------

-- 입사날짜별 직원 조회하기 
-- join
SELECT *
FROM employees AS e
INNER JOIN dept_emp AS d
ON e.emp_no = d.emp_no
WHERE d.from_date > '1995-01-01';

-- 서브쿼리 
SELECT *
FROM employees AS e, (SELECT *
						FROM dept_emp
                        WHERE from_date > '1985-01-01') AS d
WHERE e.emp_no = d.emp_no;

-- ----------------------------------------------------------------

-- 부서별 현재 매니저 정보 조회하기
-- join
SELECT *
FROM employees AS e
INNER JOIN dept_manager AS d
ON e.emp_no = d.emp_no
WHERE d.dept_no = 'd005'
AND d.to_date = '9999-01-01';

-- 서브쿼리
SELECT *
FROM employees AS e
WHERE e.emp_no IN(SELECT emp_no
					FROM dept_manager 
                    WHERE dept_no = 'd004'
                    AND to_date = '9999-01-01');