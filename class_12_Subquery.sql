-- DB생성
create database reservationdb;
use reservationdb;

-- table생성
create table reservation(
	id int auto_increment,
    name varchar(20) not null,
    reserveDate date not null,
    roomNum varchar(5) not null,
    primary key(id)
);

-- 고객정보를 저장하는 고객 테이블 
create table customer(
	id int auto_increment,
    name varchar(20) not null,
    age int not null,
    address varchar(10),
    primary key(id)
);

-- 데이터 입력
insert into reservation values(1, '홍길동', '2020-05-01 00:00:00', 1);
insert into reservation values(2, '임꺽정', '2020-05-02 00:00:00', 2);
insert into reservation values(3, '장길산', '2020-05-03 00:00:00', 3);
insert into reservation values(4, '홍길동', '2020-05-04 00:00:00', 4);

select * from reservation;

-- 데이터 수정 
-- 1번의 룸넘버를 1001번으로 변경 
update reservation set roomNum = 1001 where id = 1;
update reservation set roomNum = 1002 where id = 2;
update reservation set roomNum = 1003 where id = 3;
update reservation set roomNum = 1004 where id = 4;

select * from reservation;

insert into customer values(1, '홍길동', 20, '서울');
insert into customer values(2, '임꺽정', 30, '서울');
insert into customer values(3, '장길산', 24, '서울');
insert into customer values(4, '전우치', 33, '서울');

-- 데이터 수정 
-- 인천 서울 수원
update customer set address = '인천' where id = 2 ;
update customer set address = '수원' where id = 4;
select * from customer;

select * from customer where address in('서울');

-- 1. 중첩 서브쿼리 쓰기 - where절에서 사용
-- 주소가 서울인 고객들의 예약정보를 확인 하는 쿼리 
select id, reserveDate, roomNum, name 
from reservation
where name in(
				select name 
                from customer 
                where address = '서울'
			);

-- join문으로 변경해서 같은 결과 출력
select r.id, r.reserveDate, r.roomNum, r.name
from reservation as r
left join customer as c
on r.name = c.name
where c.address = '서울';

-- 2. 인라인 뷰 서브쿼리 쓰기 - from절에서 사용 
-- 인라인뷰에서는 서브쿼리먼저 실행된다. 
select name, reservedRoom
from (select name, reserveDate, (roomNum) as reservedRoom
		from reservation 
        where roomNum > 1001) as reservationInfo;
        
/*
	쿼리 실행 순서
    1. reservation테이블에서 roomNume을 1씩 증가 시켜서 roomNum > 1001보다 큰 레코드를 먼저 찾는다. 
	2. 해당 쿼리의 결과를 as reservationInfo로 임시 테이블을 만들어준다. ( 내부쿼리, 서브쿼리 )
    3. 외부 쿼리에서는 이렇게 만들어진 임시 테이블에서 name, reservedRoom 필드만을 선택해서 결과 집합을 보여준다.
*/

-- 서브쿼리를 사용해서 문제 만들기
-- 나이가 30살 미만인 예약자의 예약정보 출력하기
select *
from reservation 
where name in(select name 
			from customer
            where age < 30
);

-- 예약일자 2, 3일에 예약한 예약자 정보 
select *
from customer
where name in(select name 
			from reservation
            where reserveDate = '2020-05-02 00:00:00'
            or reserveDate = '2020-05-03 00:00:00'
);

-- 반학생 문제
-- 1. 고객테이블에서 실제 예약한 고객중 
-- 30살 이상인 고객 id, 이름, 나이, 주소, 예약일, 예약한 방 정보 출력
select r.id, r.name, c.age, c.address, r.reserveDate, r.roomNum
from reservation as r
inner join customer as c
on r.name = c.name 
where c.age >= 30;

-- 2. 나이가 30보다 어린 사람의 예약 정보를 확인하는 쿼리
select *
from reservation 
where name in(select name
				from customer 
                where age < 30);

-- 3. 5/2 이후에 예약한 예약자 정보 확인
select * from reservation;
select * from customer;
select *
from (select * from reservation where reserveDate > '2020-05-02') as reservetbl;

-- 4. 나이가 30대인 사람들의 예약 정보 출력
select * 
from reservation 
where name in(select name from customer where age >= 30 and age < 40);

-- 5. where절에 사용하는 서브 쿼리를 사용해서 나이가 21살 이상의 고객들만 출력
select *
from customer
where name in(select name from customer where age > 21);

-- 6. 지역이 인천과 서울인 예약고객 뽑아내기
select *
from reservation 
where name in(select name from customer where address = '서울' or address = '인천');