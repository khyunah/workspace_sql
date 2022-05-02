-- C R U D 개념이 데이터베이스의 핵심 

-- 데이터를 생성 ㅡ> insert 구문
desc memberTbl;

-- 쌍따옴표, 홑따옴표 둘다 사용가능
insert into memberTbl values("Dang", "탕탕이", "경기도 부천시");
insert into memberTbl values("Han", "한주연", "부산시 해운대구");
insert into memberTbl(memberAddress, memberName, memberId) values('서울시 상암동', '지운이', 'jee');
-- 오류 발생 ㅡ> memberTbl에 null을 허용하지 않는 필드명이 존재하기 때문.
insert into memberTbl(memberId) values('jee22');
insert into memberTbl(memberId, memberName) values('kee2', '홍길삼');

-- 테이블에 대한 전체 조회
select * from membertbl;

-- 한건에 대한 데이터 조회 ( where절 이라고 함 ) ㅡ> 조건절
select * from membertbl where memberId = 'jee';

-- 이렇게 예약어를 세로로 먼저 써놓고 값 쓰는 식으로 연습하기 
select memberName
from memberTbl
where memberId = 'jee';

-- 한건에 대한 데이터 삭제
delete from memberTbl where memberId = 'kee2';

-- 전체에 대한 데이터 삭제 
delete from membertbl;

-- 전체에 대한 데이터 삭제 
truncate membertbl;

-- 한건에 대한 데이터 수정
update memberTbl set memberName = '홍길동' where memberId = 'jee';

-- 전체 데이터에 대한 데이터 수정
update membertbl set memberAddress = '';
-- -----------------------------------------------------------------------

desc productTbl;

-- 불 필요한 컬럼 삭제하는 방법 
alter table productTbl drop makeDate;

-- 문제 1. productTbl에 데이터를 3건 입력 해주세요.
insert into producttbl values(1, '세탁기', 100000,'LG', 10);
insert into producttbl values(2, '냉장고', 1000000,'삼성', 100);
insert into producttbl values(3, '티비', 2000000,'LG', 200);

-- 문제 2. 검색
select * from productTbl;
select cost from producttbl where productName = '냉장고';
-- 셀렉트 구문에서 조건 여러개 가능 
select productName, cost, company from producttbl where productId = 1;

-- 문제 3. 수정
update producttbl set cost = 1500000 where productName = '냉장고';


-- 문제 4. 삭제
delete from producttbl where company = '삼성';
