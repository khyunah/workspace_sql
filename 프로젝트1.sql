DROP DATABASE shop;
CREATE DATABASE shop;
USE shop;

SELECT * FROM user;
SELECT * FROM basket;
SELECT * FROM item;
SELECT * FROM communityBoard;
SELECT * FROM communityLike;
SELECT * FROM reply;
DESC reply;
DESC communityBoard;
DESC user;
DESC communityLike;
UPDATE communityBoard SET likeCount = 23 WHERE id = 19;
UPDATE user SET username = "abc" WHERE id = 8;
UPDATE user SET role = "ADMIN" WHERE id = 1;
UPDATE user SET createDate = TIMESTAMP('20220731', '16:00:00') WHERE id = 3;
DELETE FROM item WHERE id = 1;

SELECT DATE(a.createDate) AS joinDate,COUNT(createDate) AS joinCount
FROM user AS a
WHERE DAYOFYEAR(createDate) BETWEEN DAYOFYEAR(NOW()) -7 AND DAYOFYEAR(NOW())
GROUP BY DAYOFYEAR(createDate)
ORDER BY joinDate;

ALTER TABLE item DROP color;

SELECT * FROM basket WHERE userid = 10;
-- 쿼리문으로 데이터 입력할때 자동으로 시간 들어갈 수 있게 
ALTER TABLE communityBoard MODIFY createDate DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE user MODIFY createDate DATETIME DEFAULT CURRENT_TIMESTAMP;

-- communityBoard
INSERT INTO communityBoard (content, imageUrl, itemLink, originImageTitle, reaction, likeCount, title, userId)
VALUES('본문9', '이미지주소', '아이템주소', '이미지 원본 이름', 0, 0, '제목9', 1);
INSERT INTO communityBoard (content, imageUrl, itemLink, originImageTitle, reaction, likeCount, title, userId)
VALUES('본문10', '이미지주소2', '아이템주소2', '이미지 원본 이름2', 0, 0, '제목10', 1);

DROP TABLE item;

INSERT INTO item VALUES(1,1,'SHIRTS', '2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F06%2Fmilan-fashion-week-mens-spring-summer-2023-street-style-2.jpg?q=75&w=750&cbr=1&fit=max','PRADA SHIRTS',2300,'L'); 
INSERT INTO item VALUES(2,1,'PANTS', '2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F06%2FAMBUSH%C2%AE-Resort-SpringSummer-2023-Collection-5.jpg?q=90&w=1400&cbr=1&fit=max','DoCkho PANTS',2100,'M'); 
INSERT INTO item VALUES(3,1,'ACCESSORY', '2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F06%2Flondon-fashion-week-2023-spring-summer-street-style-snaps-8.jpg?q=90&w=1400&cbr=1&fit=max','GUCCI ADIDAS CAP',3500,'M'); 
INSERT INTO item VALUES(4,1,'SHOES', '2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F06%2Flondon-fashion-week-2023-spring-summer-street-style-snaps-20.jpg?q=90&w=1400&cbr=1&fit=max','Milano Shoes',4500,'270'); 
INSERT INTO item VALUES(5,1,'OUTER', '2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F06%2Fmilan-fashion-week-mens-spring-summer-2023-street-style-19.jpg?q=90&w=1400&cbr=1&fit=max','SHANEL Green ',5100,'L'); 
INSERT INTO item VALUES(6,1,'SHIRTS', '2020 S/S Season Limited adition','WOMAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F06%2Fmilan-fashion-week-mens-spring-summer-2023-street-style-26.jpg?q=90&w=1400&cbr=1&fit=max','Orange PRADA',2300,'S'); 
INSERT INTO item VALUES(7,1,'PANTS', '2020 S/S Season Limited adition','WOMAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fmilan-fashion-week-fall-winter-2022-street-style-snaps-6.jpg?q=90&w=1400&cbr=1&fit=max','Brown DIrt',2600,'M'); 
INSERT INTO item VALUES(8,1,'ACCESSORY', '2020 S/S Season Limited adition','WOMAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fmilan-fashion-week-fall-winter-2022-street-style-snaps-19.jpg?q=90&w=1400&cbr=1&fit=max','PRADA Beanie',3200,'M'); 
INSERT INTO item VALUES(9,1,'SHOES', '2020 S/S Season Limited adition','WOMAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fmilan-fashion-week-fall-winter-2022-street-style-snaps-7.jpg?q=90&w=1400&cbr=1&fit=max','GUCCI AglyShoes',2400,'230'); 
INSERT INTO item VALUES(10,1,'OUTER', '2020 S/S Season Limited adition','WOMAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fmilan-fashion-week-fall-winter-2022-street-style-snaps-9.jpg?q=90&w=1400&cbr=1&fit=max','RED BACK',2360,'L'); 
INSERT INTO item VALUES(11,1,'SKIRT', '2020 S/S Season Limited adition','WOMAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F02%2Fnew-york-fashion-week-fall-winter-2022-street-style-snaps-35.jpg?q=90&w=1400&cbr=1&fit=max','Moth Skirt',2900,'M'); 
INSERT INTO item VALUES(12,1,'ONEPIECE', '2020 S/S Season Limited adition','WOMAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fparis-fashion-week-fall-winter-2022-street-style-looks-07.jpg?q=90&w=1400&cbr=1&fit=max','ONEPIECE',2000,'M'); 
INSERT INTO item VALUES(13,1,'ACCESSORY','2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fmilan-fashion-week-fall-winter-2022-street-style-snaps-1.jpg?q=90&w=1400&cbr=1&fit=max','GUCCI BACK',8100,'M');
INSERT INTO item VALUES(14,1,'SHIRTS','2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fmilan-fashion-week-fall-winter-2022-street-style-snaps-2.jpg?q=90&w=1400&cbr=1&fit=max','Dirty SHIrys',5230,'M');
INSERT INTO item VALUES(15,1,'OUTER','2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fmilan-fashion-week-fall-winter-2022-street-style-snaps-21.jpg?q=90&w=1400&cbr=1&fit=max','PRADA COtE',1200,'M');
INSERT INTO item VALUES(16,1,'OUTER','2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fparis-fashion-week-fall-winter-2022-street-style-looks-12.jpg?q=90&w=1400&cbr=1&fit=max','Worr COtE',3800,'L');
INSERT INTO item VALUES(17,1,'OUTER','2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fparis-fashion-week-fall-winter-2022-street-style-looks-11.jpg?q=90&w=1400&cbr=1&fit=max','Deep BROWN',4700,'XL');
INSERT INTO item VALUES(18,1,'OUTER','2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fparis-fashion-week-fall-winter-2022-street-style-looks-22.jpg?q=90&w=1400&cbr=1&fit=max','Malcha Latte',4800,'M');
INSERT INTO item VALUES(19,1,'OUTER','2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fparis-fashion-week-fall-winter-2022-street-style-looks-23.jpg?q=90&w=1400&cbr=1&fit=max','Indian coTe',7800,'L');
INSERT INTO item VALUES(20,1,'OUTER','2020 S/S Season Limited adition','MAN','https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2022%2F03%2Fparis-fashion-week-fall-winter-2022-street-style-looks-26.jpg?q=90&w=1400&cbr=1&fit=max','LeOn coTe',3400,'L');
