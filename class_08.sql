-- AND OR
select *
from membertbl;

insert into membertbl values('jsa', '김주한', '부산시 진구');

-- 이름 홍길동, 주소가 부산시 진구
select *
from membertbl
where memberName = '홍길동'
and memberAddress = '부산시';

-- 주소가 부산시 진구 or 경기도 부천시
select *
from membertbl
where memberAddress = '부산시 진구'
or memberAddress = '경기도 부천시';

-- 주소가 (부산시 진구 or 경기도 부천시) and 이름이 김주한 
select *
from membertbl
where (memberAddress = '부산시 진구'
or memberAddress = '경기도 부천시')
and memberName = '김주한';

-- 샘플 테이블 생성
create table memberCart(
	id int not null auto_increment, -- 자동으로 1씩 증가 시켜준다
    name varchar(30) not null,
    amount int not null,
    primary key(id)
);

desc memberCart;
select * from memberCart;

-- 테이블 생성후 컬럼 추가하기
alter table memberCart add productName varchar(30) not null;

-- 테이블의 필드명(컬럼명) 수정
alter table memberCart rename column name to name2;

-- 테이블의 필드명(컬럼명) 삭제
alter table memberCart drop column name2;

-- 테이블 이름 수정
rename table memberCart to myCart;
select * from myCart;
alter table myCart rename shopCart;
select * from shopCart;

-- 데이터 입력
insert into shopCart values(1, 2, '청바지');
insert into shopCart(amount, productName) values(2, '운동화');
insert into shopCart(amount, productName) values(12, '잠바');
insert into shopCart(amount, productName) values(3, '핸드폰');
insert into shopCart(amount, productName) values(5, '지갑');

-- between
select *
from shopCart
where amount between 2 and 5;
