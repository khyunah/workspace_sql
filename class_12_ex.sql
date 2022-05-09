-- ch03 ~ 05
use shopdb;
select * from membertbl;
SELECT * FROM membertbl WHERE memberId IN('jsa', 'Dang');

use shopdb;
SELECT * 
FROM usertbl AS u 
INNER JOIN buytbl AS b 
ON u.userName = b.userName;

select * from usertbl;

select * from buytbl;
SELECT * 
FROM usertbl AS u 
LEFT JOIN buytbl AS b 
ON u.userName = b.userName 
WHERE b.userName is null;

SELECT * 
FROM buytbl AS b 
LEFT JOIN usertbl AS u 
ON b.userName = u.userName;

desc usertbl;
desc buytbl;

SELECT * 
FROM usertbl AS u
inner join buytbl as b
on u.userName = b.userName
where b.userName = '이순신';

select * 
from usertbl as u
inner join buytbl as b
on u.userName = b.userName
where b.prodName = '책';

SELECT * 
FROM usertbl AS u
INNER JOIN buytbl AS b
ON u.userName = b.userName
WHERE price >= 50;

-- -----------------------------------------
-- ch04
use employees;
select * from departments;
select * from employees;
select * from dept_emp;
select * from titles;

-- 직급별 직원 조회하기 
-- join 
select *
from employees as e
inner join titles as t
on e.emp_no = t.emp_no
where t.title = 'Staff';

select *
from employees as e
where e.emp_no in(select emp_no
					from titles
                    where title = 'Senior Engineer'
                    and to_date = '9999-01-01');