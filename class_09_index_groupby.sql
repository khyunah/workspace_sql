-- index 개념 , 가상테이블
create database shop_db;

use shop_db;

-- 사용할 테이블의 데이터베이스를 앞에 써주는것 = use 데이터베이스; 하는것과 똑같음
-- 매번 써주기 번거롭기 때문에 use 데이터베이스; 해주는 것, 이렇게도 사용가능하다 정도만 알기 
create table shop_db.product(
	id tinyint not null,
    p_name varchar(30) not null,
    created date,
    company varchar(30)
);

select * from product;

-- index : create index(UNIQUE INDEX)
-- 모든 데이터를 하나하나 검색하기에는 시간이 많이 걸리는데 
-- PK를 지정하여 검색시간을 줄일 수 있다. 
create index idx_product_name
on product (p_name);

-- index 조회 
show index from product;

-- index 수정 

-- index 삭제
alter table product
drop index idx_product_name;

insert into product values(1, '세탁기', '2020-12-12', '삼성');
insert into product values(2, '냉장고', now(), '엘지'); -- now() 초록색아니고 노란세모경고 뜸
insert into product values(3, '모니터', curdate(), '삼성');
insert into product values(4, '컴퓨터', curdate(), '삼성');

desc product;

-- 컬럼 추가하기 복습 
alter table product add input_time timestamp;

-- 가상 테이블 ( 뷰 테이블 ) 생성하기
-- 실제 테이블이 아니라 참조해서 필요한 부분만 보여주는 개념
create view product_view -- 3. 뷰를 만들겠다.
as select p_name, created, company -- 2. 이러한 필드를 검색해서  
from product; -- 1.  테이블 product에서

select * from product_view;

-- 가상 테이블 데이터 지우기
-- 참조하기 때문에 원본에 영향이 간다.
delete from product_view where p_name = '컴퓨터';
-- 영향을 주지 않으려면 삭제권한을 주지 않으면 된다. 방법 알아보기

-- 데이터 베이스 삭제 복습
-- drop database shop_db;

show databases;

-- 테이블 복사하기
select * from product;

create table product_2 select * from product;

select * from product_2;

-- group by
use shopdb;

select * from buytbl;

-- userName으로 그룹화 시키기
select userName
from buytbl
group by userName;

-- price로 그룹화 시키기
select *
from buytbl
group by price;

-- amount로 그룹화 시키기
select * 
from buytbl
group by amount;

-- userName으로 그룹화 하고, amount가 3보다 큰사람들을 출력하라
select *
from buytbl
where amount >= 3
group by userName;

-- 집계 함수
select count(*) as 판매횟수 -- 로우에 대한 카운트, 넘버링펑션에 추가해서 블로그정리하기 
from buytbl;

select userName, sum(price) as '구매 금액'
from buytbl;

-- 집계 함수와 group by
select userName, sum(price) as '구매 금액'
from buytbl
group by userName;