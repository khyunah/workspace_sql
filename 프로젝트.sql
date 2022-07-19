drop database shop;
create database shop;
use shop;

select * from user;
select * from basket;
select * from item;
select * from board;
select * from communityLike;
select * from reply;
desc reply;
desc board;
desc user;
desc basket;


SELECT * FROM user WHERE username = "aa";

insert into board(itemLink, reaction, replyCount, title, userId) values('aa', 0, 0,'title1', 1);
insert into board(itemLink, reaction, replyCount, title, userId) values('bb', 0, 0,'title1', 1);
insert into board(itemLink, reaction, replyCount, title, userId) values('cc', 0, 0,'title1', 1);
insert into board(itemLink, reaction, replyCount, title, userId) values('dd', 0, 0,'title1', 1);
insert into board(itemLink, reaction, replyCount, title, userId) values('ee', 0, 0,'title1', 1);