-- 문제 1. shopdb_1 데이터베이스 생성
create database shopdb_1;
-- 문제 2. memberTbl 테이블 생성
create table memberTbl(
	memberId char(8) not null,
    memberName char(5) not null,
    memberAddress char(20),
    primary key(memberId)
);
-- 문제 3. productTbl 테이블 생성
create table productTbl(
	productId int not null,
    productName char(4) not null,
    cost int not null,
    makeDate date,
    amount int,
    primary key(productId)
);
-- 문제 4. 간단한 테이블 생성 ( 필드 2개 이상 )
create table saleProductTbl(
	productId int not null,
    productName char(4) not null,
    cost int not null
);
-- 문제 5. 간단한 테이블 생성 ( 필드 3개 이상, primary key 생성 )
create table soldoutProductTbl(
	productId int not null,
    productName char(4) not null,
    soldoustDate date,
    primary key(productId)
);

select * from soldoutProductTbl;
desc saleproducttbl;