# PK, FK 사용해보기
# usertbl, buytbl 생성 

USE shopdb;

# usertbl
create table usertbl(
    userName char(3) not null,
    userAddr char(2) not null,
    mobile char(13),
    PRIMARY KEY(userName)
);

SELECT * from usertbl;

# buytbl
create table buytbl(
	userName char(3) not null,
    prodName char(5) not null,
    price int not null,
    amount int not null,
    foreign key(userName) references usertbl(userName)
);

SELECT * from buytbl;

# 데이터 추가하기
insert into usertbl VALUES('유재석', '부산', '010-0000-0000');
insert into usertbl VALUES('강호동', '서울', '010-1111-2222');
insert into usertbl VALUES('주현영', '전주', '010-3333-3333');
insert into usertbl VALUES('권혁수', '홍천', '010-2222-3333');
insert into usertbl VALUES('이용진', '대구', '010-0000-1111');
insert into usertbl VALUES('장원영', '포항', '010-5555-6666');

insert into buytbl VALUES('유재석', '냉장고', 200, 2);
insert into buytbl VALUES('유재석', 'TV', 200, 1);
insert into buytbl VALUES('강호동', '냉장고', 150, 2);
insert into buytbl VALUES('강호동', '세탁기', 50, 3);
insert into buytbl VALUES('주현영', '휴대폰', 120, 1);
insert into buytbl VALUES('주현영', 'TV', 200, 2);
insert into buytbl VALUES('권혁수', '세탁기', 100, 1);
insert into buytbl VALUES('권혁수', '휴대폰', 150, 1);

# 오류구문 --> FK인 userName이 참조하는 테이블인 usertbl에 존재하지 않기 때문
insert into buytbl VALUES('이미주', '휴대폰', 120, 1);

