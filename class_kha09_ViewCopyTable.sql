# 가상테이블 view
select * from studenttbl;

# 생성
create view view_student as 
select * from studenttbl;

select * from view_student;

# 삭제 
drop view view_student;

# 테이블 복사하기
create table student2_tbl select * from studenttbl;
select * from student2_tbl;