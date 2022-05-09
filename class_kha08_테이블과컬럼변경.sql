# 테이블 생성후에 수정하기
# 테이블 생성
create table testtbl(
	userName char(3),
    address char(20),
    mobile int
);

desc testtbl;

# 테이블명 수정하기
alter table testtbl rename test_1tbl;
show tables;
rename table test_1tbl to testtbl;
show tables;

# 필드 추가하기
alter table testtbl add gender char(1) not null;
desc testtbl;

# 필드명 수정하기
alter table testtbl rename column address to userAddr;
desc testtbl;

# 필드속성 수정하기
alter table testtbl modify userName char(3) not null primary key;
desc testtbl;

# 필드 삭제하기 
alter table testtbl drop column gender;
desc testtbl;