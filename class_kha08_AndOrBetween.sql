# AND OR BETWEEN
# 테이블 생성
create database student;
use student;

create table studenttbl(
	studName char(5) not null primary key,
    age int,
    grade int,
    major char(10)
);

desc studenttbl;

insert into studenttbl values('김영준', 20, 1, '경영');
insert into studenttbl values('박찬우', 23, 2, '경영');
insert into studenttbl values('홍리정', 22, 3, '디자인');
insert into studenttbl values('임민수', 20, 1, '디자인');
insert into studenttbl values('최백인', 21, 2, '건축');
insert into studenttbl values('장준빈', 22, 3, '건축');
insert into studenttbl values('노지혜', 20, 1, '디자인');
insert into studenttbl values('정준익', 21, 2, '경영');
insert into studenttbl values('백무진', 23, 4, '경영');
insert into studenttbl values('오민지', 23, 4, '건축');

select * from studenttbl;

# AND
select *
from studenttbl
where major = '경영'
and grade = 2
and age = 23;

# OR
select *
from studenttbl
where grade = 2
or grade = 1
or grade = 3;

# BETWEEN
select *
from studenttbl
where age between 20 and 22;