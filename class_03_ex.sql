-- 의존성 참조 관계

use shopdb_1;

drop table userTbl;

create table userTbl(
	userName char(3) not null,
    birthYear int not null,
    addr char(2) not null,
    mobile char(13) not null,
    primary key(userName)
);

select * from userTbl;
desc usertbl;

create table buyTbl(
	userName char(3) not null,
    prodName char(3) not null,
    price int not null,
    amount int not null,
    foreign key(userName) references userTbl(userName)
);

select * from buytbl;
desc buytbl;

insert into userTbl values('이승기', 1987, '서울', '010-1234-1234');
insert into userTbl values('홍길동', 1911, '부산', '010-2222-1234');
insert into userTbl values('이순신', 1999, '대구', '010-3333-1234');

insert into buytbl values('이승기', '운동화', 50, 1);
insert into buytbl values('이승기', '노트북', 150, 1);
insert into buytbl values('홍길동', '책', 10, 5);
insert into buytbl values('홍길동', '모니터', 200, 2);
insert into buytbl values('이순신', '청바지', 40, 1);
insert into buytbl values('이순신', '책', 10, 3);