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
desc board;
desc user;
desc basket;


SELECT * FROM user WHERE username = "aa";

insert into communityBoard (content, imageUrl, itemLink, originImageTitle, reaction, likeCount, title, userId)
values('본문내용 1', '이미지주소', '아이템주소', '이미지 원본 이름', 0, 0, '제목9', 1);
insert into communityBoard (content, imageUrl, itemLink, originImageTitle, reaction, likeCount, title, userId)
values('본문내용 2', '이미지주소2', '아이템주소2', '이미지 원본 이름2', 0, 0, '제목10', 1);