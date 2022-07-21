USE employees;

SELECT * 
FROM employees
WHERE emp_no IN (SELECT emp_no
				FROM dept_emp
                WHERE dept_no = 'd007');

SELECT * 
FROM employees
WHERE emp_no IN (10016);

SELECT * 
FROM employees
WHERE emp_no > ALL (SELECT emp_no
				FROM dept_emp
                WHERE dept_no = 'd007');
                
SELECT * 
FROM salaries
WHERE salary > (SELECT ROUND(AVG(salary))
				FROM salaries);
                
SELECT * 
FROM salaries
WHERE salary = (SELECT MAX(salary)
				FROM salaries);
                
SELECT e.emp_no, e.last_name, s.salary, s.from_date 
FROM employees AS e, (SELECT *
						FROM salaries
                        WHERE to_date = '9999-01-01') AS s
WHERE e.emp_no = s.emp_no;

SELECT * , (SELECT MAX(salary)
			FROM salaries AS s) AS '최고연봉자 연봉'
FROM employees AS e;

use mysql;
show tables;
select host, user from user;

create user kim11@localhost identified by 'asd123';
grant select on employees.* to kim11@localhost;

create user hyun@localhost identified by 'asd123';
grant select on employees.* to hyun@localhost;

drop user kim11@localhost;
drop user hyun@localhost;
