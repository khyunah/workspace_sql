# index 생성
create index idx_studName
on studenttbl (studName);

# index 조회
show index from studenttbl;

# index 삭제
alter table studenttbl drop index idx_studName;
show index from studenttbl;
