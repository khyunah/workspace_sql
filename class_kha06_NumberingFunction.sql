# Numbering Function

create database buydb;

use buydb;

create table buytbl(
	userName char(3) not null,
	prodName char(5) not null,
    price int not null,
    amount int not null
);

insert into buytbl values('홍길동', '청바지', 3, 1);
insert into buytbl values('김민정', '원피스', 5, 2);
insert into buytbl values('안성현', '운동화', 10, 1);
insert into buytbl values('박정찬', '티셔츠', 2, 4);
insert into buytbl values('홍길동', '티셔츠', 1, 5);
insert into buytbl values('정주미', '치마', 4, 1);
insert into buytbl values('윤은비', '치마', 5, 2);
insert into buytbl values('안성현', '운동복', 6, 3);
insert into buytbl values('김민정', '치마', 4, 2);
insert into buytbl values('박정찬', '운동화', 5, 4);

# 개수
select count(*) as 구매건수
from buytbl;

# 합계 
select sum(amount) as '총 판매 수량', sum(price) as '총 판매 금액'
from buytbl;

# 평균 
select avg(price) as '한사람당 구매 평균 금액'
from buytbl;

# 소수 올림
select ceil(avg(price)) as '한사람당 구매 평균 금액'
from buytbl;

# 소수 반올림
select round(2.62);

# 소수 내림
select floor(avg(price)) as '한사람당 구매 평균 금액'
from buytbl;

# max값 구하기
select userName, max(price * amount) as '가장 많이 구매한 사람의 금액'
from buytbl;

# min값 구하기
select userName, min(price * amount) as '가장 적게 구매한 사람의 금액'
from buytbl;

# 서브쿼리
select b.*, (select sum(price * amount) from buytbl where userName = b.userName and prodName = b.prodName) as '해당 로우 총금액'
from buytbl as b;

select * from buytbl;
delete from buytbl where userName = '홍길동' and prodName = '청바지';