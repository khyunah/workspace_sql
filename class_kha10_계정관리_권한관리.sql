# 계정 관리와 권한 관리 
# 1. 기본적으로 만들어져 있는 데이터베이스 mysql이 있다. 
show databases;

use mysql;
show tables;

select host, user from user;

# 계정 생성
# 데이터베이스 1개를 내부ip에서만 접근
create user hong11@localhost identified by 'abcd1234';

# 접근 권한 부여
grant select, insert on student.* to hong11@localhost;

# 계정 생성
# 모든 데이터베이스를 내부ip에서만 접근 
create user kim11@localhost identified by 'abcd1234';

# 접근 권한 부여
grant all privileges on *.* to kim11@localhost;

# 계정 생성
# 모든 데이터베이스를 외부ip에서도 접근
create user park11@'%' identified by 'abcd1234';

# 접근 권한 부여
grant all privileges on *.* to park11@'%';

# 계정 삭제 
drop user hong11@localhost;
drop user kim11@localhost;
drop user park11@'%';