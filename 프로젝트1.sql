drop database shop;
create database shop;
use shop;

select * from user;
select * from basket;
select * from item;
select * from communityBoard;
select * from communityLike;
select * from reply;
desc reply;
desc communityBoard;
desc user;
desc basket;

-- 쿼리문으로 데이터 입력할때 자동으로 시간 들어갈 수 있게 
alter table communityBoard modify createDate datetime default CURRENT_TIMESTAMP;
alter table user modify createDate datetime default CURRENT_TIMESTAMP;

-- communityBoard
insert into communityBoard (content, imageUrl, itemLink, originImageTitle, reaction, likeCount, title, userId)
values('본문9', '이미지주소', '아이템주소', '이미지 원본 이름', 0, 0, '제목9', 1);
insert into communityBoard (content, imageUrl, itemLink, originImageTitle, reaction, likeCount, title, userId)
values('본문10', '이미지주소2', '아이템주소2', '이미지 원본 이름2', 0, 0, '제목10', 1);

