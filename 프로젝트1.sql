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
update communityBoard set likeCount = 23 where id = 19;
update user set role = "ADMIN" where id = 1;
DELETE FROM basket WHERE userid = 10;
SELECT * FROM basket WHERE userid = 10;
-- 쿼리문으로 데이터 입력할때 자동으로 시간 들어갈 수 있게 
alter table communityBoard modify createDate datetime default CURRENT_TIMESTAMP;
alter table user modify createDate datetime default CURRENT_TIMESTAMP;

-- communityBoard
insert into communityBoard (content, imageUrl, itemLink, originImageTitle, reaction, likeCount, title, userId)
values('본문9', '이미지주소', '아이템주소', '이미지 원본 이름', 0, 0, '제목9', 1);
insert into communityBoard (content, imageUrl, itemLink, originImageTitle, reaction, likeCount, title, userId)
values('본문10', '이미지주소2', '아이템주소2', '이미지 원본 이름2', 0, 0, '제목10', 1);

drop table item;

insert into item values(1,1,'SHIRTS', '2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F06%2Fmilan-fashion-week-mens-spring-summer-2023-street-style-2.jpg?q=75&w=750&cbr=1&fit=max','PRADA SHIRTS',2300,'L'); 
insert into item values(2,1,'PANTS', '2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F06%2FAMBUSH%C2%AE-Resort-SpringSummer-2023-Collection-5.jpg?q=90&w=1400&cbr=1&fit=max','DoCkho PANTS',2100,'M'); 
insert into item values(3,1,'ACCESSORY', '2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F06%2Flondon-fashion-week-2023-spring-summer-street-style-snaps-8.jpg?q=90&w=1400&cbr=1&fit=max','GUCCI ADIDAS CAP',3500,'M'); 
insert into item values(4,1,'SHOES', '2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F06%2Flondon-fashion-week-2023-spring-summer-street-style-snaps-20.jpg?q=90&w=1400&cbr=1&fit=max','Milano Shoes',4500,'270'); 
insert into item values(5,1,'OUTER', '2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F06%2Fmilan-fashion-week-mens-spring-summer-2023-street-style-19.jpg?q=90&w=1400&cbr=1&fit=max','SHANEL Green ',5100,'L'); 
insert into item values(6,1,'SHIRTS', '2020 S/S Season Limited adition','WOMAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F06%2Fmilan-fashion-week-mens-spring-summer-2023-street-style-26.jpg?q=90&w=1400&cbr=1&fit=max','Orange PRADA',2300,'S'); 
insert into item values(7,1,'PANTS', '2020 S/S Season Limited adition','WOMAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fmilan-fashion-week-fall-winter-2022-street-style-snaps-6.jpg?q=90&w=1400&cbr=1&fit=max','Brown DIrt',2600,'M'); 
insert into item values(8,1,'ACCESSORY', '2020 S/S Season Limited adition','WOMAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fmilan-fashion-week-fall-winter-2022-street-style-snaps-19.jpg?q=90&w=1400&cbr=1&fit=max','PRADA Beanie',3200,'M'); 
insert into item values(9,1,'SHOES', '2020 S/S Season Limited adition','WOMAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fmilan-fashion-week-fall-winter-2022-street-style-snaps-7.jpg?q=90&w=1400&cbr=1&fit=max','GUCCI AglyShoes',2400,'230'); 
insert into item values(10,1,'OUTER', '2020 S/S Season Limited adition','WOMAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fmilan-fashion-week-fall-winter-2022-street-style-snaps-9.jpg?q=90&w=1400&cbr=1&fit=max','RED BACK',2360,'L'); 
insert into item values(11,1,'SKIRT', '2020 S/S Season Limited adition','WOMAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F02%2Fnew-york-fashion-week-fall-winter-2022-street-style-snaps-35.jpg?q=90&w=1400&cbr=1&fit=max','Moth Skirt',2900,'M'); 
insert into item values(12,1,'ONEPIECE', '2020 S/S Season Limited adition','WOMAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fparis-fashion-week-fall-winter-2022-street-style-looks-07.jpg?q=90&w=1400&cbr=1&fit=max','ONEPIECE',2000,'M'); 
insert into item values(13,1,'ACCESSORY','2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fmilan-fashion-week-fall-winter-2022-street-style-snaps-1.jpg?q=90&w=1400&cbr=1&fit=max','GUCCI BACK',8100,'M');
insert into item values(14,1,'SHIRTS','2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fmilan-fashion-week-fall-winter-2022-street-style-snaps-2.jpg?q=90&w=1400&cbr=1&fit=max','Dirty SHIrys',5230,'M');
insert into item values(15,1,'OUTER','2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fmilan-fashion-week-fall-winter-2022-street-style-snaps-21.jpg?q=90&w=1400&cbr=1&fit=max','PRADA COtE',1200,'M');
insert into item values(16,1,'OUTER','2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fparis-fashion-week-fall-winter-2022-street-style-looks-12.jpg?q=90&w=1400&cbr=1&fit=max','Worr COtE',3800,'L');
insert into item values(17,1,'OUTER','2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fparis-fashion-week-fall-winter-2022-street-style-looks-11.jpg?q=90&w=1400&cbr=1&fit=max','Deep BROWN',4700,'XL');
insert into item values(18,1,'OUTER','2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fparis-fashion-week-fall-winter-2022-street-style-looks-22.jpg?q=90&w=1400&cbr=1&fit=max','Malcha Latte',4800,'M');
insert into item values(19,1,'OUTER','2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fparis-fashion-week-fall-winter-2022-street-style-looks-23.jpg?q=90&w=1400&cbr=1&fit=max','Indian coTe',7800,'L');
insert into item values(20,1,'OUTER','2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fparis-fashion-week-fall-winter-2022-street-style-looks-26.jpg?q=90&w=1400&cbr=1&fit=max','LeOn coTe',3400,'L');
