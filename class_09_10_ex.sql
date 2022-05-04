-- 문제 만들기
select * from usertbl;
-- shopdb의 usertbl을 복사해서, 1900년대생 몇명인지 나타내기
create table usertbl_view2 select * from usertbl;

select count(*) as '1900년대생인원수'
from usertbl_view2
where birthYear < 2000;

-- buytbl의 사용자별 총 구매액 
select userName, sum(price) as '구매 총액'
from buytbl
group by userName;

-- 현재 계정에 사용자를 추가하여 shopdb의 buytbl테이블의 검색 권한만 부여하기
create user test1@localhost identified by 'asd123';
grant select on shopdb.* to test1@localhost;

-- 반 학생들이 낸 문제 
-- 1. shop_db product 테이블에서 회사이름으로 묶고 제조일이 2020년 12월 12일 이후인 것만 출력 
use shop_db;
select * from product;
select *
from product 
where created > '2020-12-12'
group by company;

-- 2. buytbl에서 제품별 판매량 구하기
use shopdb;
select * from buytbl;
select prodName, sum(amount) as '제품별 판매량'
from buytbl
group by prodName;

-- 3. usertbl에서 2000년생 이후 출생자 이름과 출생년도만 출력해서 usertbl_view3으로 정의
select * from usertbl;
create table usertbl_view3 select * from usertbl;
select userName, birthYear
from usertbl_view3
where birthYear >= 2000;

-- 3번 정답
create view usertbl_view3 as select userName, birthYear from usertbl where birthYear >= 2000;
select * from usertbl_view3;

-- 4. shopdb에서 usertbl이랑 buytbl이랑 left join후
-- 일정 price이상 구매 고객에 대한 개인 정보 + 구매 정보 출력할 거임.
-- username으로 group하고
-- view로 생성해서
-- employee1에게 권한주기 (외부접근 가능)
create view shoptbl 
as select u.userName, b.prodName, b.price, b.amount
from usertbl as u
left join buytbl as b
on u.userName = b.userName
group by userName;

select * from shoptbl;