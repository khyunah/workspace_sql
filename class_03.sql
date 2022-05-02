-- userTbl, buy Tbl 만들기

-- 고객 테이블 생성
create table userTbl(
	userName char(3) not null,
    birthYear int not null,
    addr char(2) not null,
    mobile char(12),
    primary key(userName)
);

-- 필드 수정 
alter table usertbl modify mobile char(13);

-- 구매 테이블 생성 
-- FK 
create table buyTbl(
	userName char(3) not null,
    prodName char(3) not null,
    price int not null,
    amount int not null,
    foreign key(userName) references userTbl(userName) 
);

desc buytbl;

-- userTbl 데이터 입력 하기
insert into userTbl values('이승기', 1987, '서울', '010-1234-1234');
insert into userTbl values('홍길동', 1911, '부산', '010-2222-1234');
insert into userTbl values('이순신', 1999, '대구', '010-3333-1234');

select * from usertbl;
select * from buytbl;
desc buytbl;

-- 구매 테이블 데이터 입력 하기
-- 오류 구문
-- insert into buytbl values('이승기2', '운동화', 50, 1);
-- fk가 존재하기 때문에 원본에 있던 이름이 없는 이름은 생성이 안됨.

insert into buytbl values('이승기', '운동화', 50, 1);
insert into buytbl values('이승기', '노트북', 150, 1);
insert into buytbl values('홍길동', '책', 10, 5);
insert into buytbl values('홍길동', '모니터', 200, 2);
insert into buytbl values('이순신', '청바지', 40, 1);
insert into buytbl values('이순신', '책', 10, 3);

--
select * from buytbl;
