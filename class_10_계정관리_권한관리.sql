-- My Sql 계정 생성 및 권한 관리 

-- 사용자 계정 확인
show databases;

use mysql;

select host, user from user;
-- host에 localhost는 다른계정에서 접근할수없다

-- MySql 8에서 생성하는 방법 ( 계정 생성후 모든 권한을 할당 )

-- 1. 하나의 DB에서 권한 할당하는 방법, localhost만 접근 허용
-- 현재 계정에서만 사용하도록 사용자 추가
create user tester1@localhost identified by 'asd123';
-- 권한 셋팅 grant
grant select, insert, update, delete on shop_db.* to 'tester1'@'localhost';

-- 2. 모든 DB에 권한 할당하는 방법, localhost만 접근 허용
create user tester2@localhost identified by 'asd123';
grant all privileges on *.* to tester2@localhost with grant option;
flush privileges; -- 권한이 안들어갔을수도 있어서 강제로 밀어 넣어 주기

-- 3. 모든 DB에 권한 할당하는 방법, 외부 접속 허용 계정 만들기 
create user tester3@'%' identified by 'asd123';
grant all privileges on *.* to tester3@'%' with grant option;

-- 4. 계정 삭제 방법
drop user 'tester3'@'%';
drop user 'tester2'@'localhost';

-- DB에 만들어진 모든 테이블 확인
use shopdb;
show full tables;

-- 뷰생성
create view usertbl_view as select userName, birthYear, addr from usertbl;
select * from usertbl_view;

--
use mysql;
select * from user;

-- 유저 생성
create user tencoding@'%' identified by 'asd123';
grant select on shopdb.usertbl_view to 'tencoding'@'%';
-- 홈으로가서 계정 추가 해보기
