# 쿼리 연습

# 데이터 베이스 생성 
create database test;
use test;

# 데이터 베이스 삭제 
drop database test;

# 데이터 베이스 목록보기 
show databases;

# 테이블 생성
create table personTest(
	id int primary key,
	name varchar(10) not null,
    age int,
    address varchar(50),
    phoneNumber int
);

# 테이블 삭제
drop table person;

# 테이블 조회
select * from personTest;
desc personTest;

# 테이블명 수정하기
alter table personTest rename person;
rename table person to personTest;

# 테이블 컬럼 추가하기 
alter table personTest add age int;

# 테이블 필드 삭제 
alter table personTest drop age;

# 테이블 컬럼명 수정하기
alter table personTest rename column name to personName;

# 테이블 컬럼 속성 수정하기 
alter table personTest modify name varchar(30);

-- -----------------------------------------------------

# INSERT
# 전체 컬럼을 전부 입력할때 
insert into personTest values('홍길동','부산시 진구', 01000001111, 10);

# 선택적으로 컬럼 입력할때 
insert into personTest(personName, age) values('홍길동2', 12);
insert into person(personName, address) values('홍길동3', '부산');

# SELECT
# 전부 조회 
select * from person;
# 원하는 조건으로만 모든 필드 조회
select * from person where address = '부산';
# 원하는 필드 조회
select personName, address from person;
select personName, age from person where address = '부산';

# UPDATE
update person set personName = '김현아' where age = 10;

# DELETE
delete from person where personName = '홍길동2';

-- -----------------------------------------------------------

# FK 적용하기 
create table cart (
	id int not null,
	itemName varchar(20) not null,
    price int,
    foreign key(id) references person(id)
);
desc cart;

-- -------------------------------------------------------------
use employees;
# 현재 데이터 베이스 목록 조회
show tables;
select * from test11;
select * from employees;
select * from dept_emp;
drop table test11;
drop table movie;

# JOIN 
# INNER JOIN 
# 모든 컬럼을 조회 
select * from employees as a
inner join dept_emp as b
on a.emp_no = b.emp_no;

# 선택 컬럼만 조회 
select a.emp_no, a.last_name, b.dept_no from employees as a
inner join dept_emp as b
on a.emp_no = b.emp_no;

-- --------------------------------------------------------

# 서브쿼리 : SELECT 만 가능 

# 중첩 서브쿼리

# 결과값이 하나일때
select * 
from salaries
where salary = (select max(salary)
				from salaries);
                
# 결과값이 여러개일때
select * 
from salaries as a
where salary > ( select round(avg(salary))
					from salaries as b)
group by emp_no;
