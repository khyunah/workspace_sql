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
drop table communityBoard;

SELECT * FROM user WHERE username = "aa";

insert into communityBoard(content, imageUrl, itemLink, originImageTitle, reaction, likeCount, title, userId) values('내용입니덩','이미지 주소입니당', '오리지날 주소', 'aa', 0, 0,'title1', 1);
insert into communityBoard(content, imageUrl, itemLink, originImageTitle, reaction, likeCount, title, userId) values('두번째 글','이미지 주소입!!', '오리지날 주소', 'ㅇㅇㅇㅇ', 0, 0,'제목1111', 1);
insert into communityBoard(content, imageUrl, itemLink, originImageTitle, reaction, likeCount, title, userId) values('Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
quasi aliquam eligendi, placeat qui corporis!','이미지 주소입니당', '오리지날 주소', 'aa', 0, 0,'atem quaerat non architecto ab laudantium', 1);
insert into communityBoard(content, imageUrl, itemLink, originImageTitle, reaction, likeCount, title, userId) values('ㄹㄹ라라라라라ㅏㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹ','이미지 주소입!!', '오리지날 주소', 'ㅇㅇㅇㅇ', 0, 0,'안녕~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~하세요!!!!!!!!!!!!!!!!!!!!!!!!!!!', 1);
update communityBoard set replyCount = 1;