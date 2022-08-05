DROP DATABASE shop;
CREATE DATABASE shop;
USE shop;

SELECT * FROM user;
SELECT * FROM basket;
SELECT * FROM item;
SELECT * FROM communityBoard;
SELECT * FROM communityLike;
SELECT * FROM reply;
SELECT * FROM purchasehistory;

DESC user;
DESC basket;
DESC item;
DESC communityBoard;
DESC communityLike;
DESC reply;
DESC purchasehistory;

-- 쿼리문으로 데이터 입력할때 자동으로 시간 들어갈 수 있게 
ALTER TABLE communityBoard MODIFY createDate DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE user MODIFY createDate DATETIME DEFAULT CURRENT_TIMESTAMP;

UPDATE communityBoard SET likeCount = 23 WHERE id = 19;
UPDATE user SET username = "aaaaaa@nate.coma_2317239864" WHERE id = 3;
UPDATE user SET role = "ADMIN" WHERE id = 1;
UPDATE user SET createDate = TIMESTAMP('20220720', '16:00:00') WHERE id = 3;
DELETE FROM user WHERE id = 11;
DROP TABLE purchasehistory;

# 이번주 좋아요 top5
SELECT b.id, b.title, c.username, COUNT(a.boardId) AS likeCount
FROM communityLike AS a
INNER JOIN communityBoard AS b
ON a.boardId = b.id
INNER JOIN user AS c
ON b.userId = c.id
GROUP BY a.boardId
ORDER BY likeCount DESC
LIMIT 5;

# 이번주 댓글 top5
SELECT b.id, b.title, c.username, COUNT(a.boardId) AS count
FROM reply AS a
INNER JOIN communityBoard AS b
ON a.boardId = b.id
INNER JOIN user AS c
ON b.userId = c.id
GROUP BY a.boardId
ORDER BY count DESC
LIMIT 5;

# 한달 게시글 수
SELECT day(createDate) AS date, COUNT(createDate) AS count
FROM communityBoard
WHERE MONTH(createDate) = MONTH(NOW())
GROUP BY DAYOFYEAR(createDate);

# 총 게시글 수
SELECT DATE(createDate) AS date, COUNT(*) AS count
FROM communityBoard;

# 오늘 게시글 수 
SELECT DATE(createDate) AS date, COUNT(*) AS count
FROM communityBoard
WHERE DAY(createDate) = DAY(NOW());

# 이번주 게시글 수
SELECT DATE(createDate) AS date, COUNT(*) AS count
FROM communityBoard
WHERE WEEK(createDate) = WEEK(NOW());

# 금주 판매 금액, 판매량
SELECT DATE(a.createDate) AS salesDate, SUM(b.price) AS totalIncome, SUM(a.count) AS totalCount
FROM purchasehistory AS a
INNER JOIN item AS b
ON a.itemId = b.id
WHERE DAYOFYEAR(a.createDate) BETWEEN DAYOFYEAR(NOW()) -6 AND DAYOFYEAR(NOW())
GROUP BY DATE(a.createDate)
ORDER BY salesDate;

# 총 판매 금액, 판매량
SELECT DATE(a.createDate) AS salesDate, SUM(b.price) AS totalIncome, SUM(a.count) AS totalCount
FROM purchasehistory AS a
INNER JOIN item AS b
ON a.itemId = b.id;

# 금주 아이템별 판매 수량
SELECT b.name, SUM(b.price) AS totalIncome, SUM(a.count) AS totalCount
FROM purchasehistory AS a
INNER JOIN item AS b
ON a.itemId = b.id
WHERE DAYOFYEAR(a.createDate) BETWEEN DAYOFYEAR(NOW()) -6 AND DAYOFYEAR(NOW())
GROUP BY b.name
ORDER BY totalIncome DESC
LIMIT 5;

# 이번달 많이 구매한 top5 유저 
SELECT c.username, SUM(b.price) AS totalIncome, SUM(a.count) AS totalCount
FROM purchasehistory AS a
INNER JOIN item AS b
ON a.itemId = b.id
INNER JOIN user AS c
ON a.userId = c.id
WHERE MONTH(a.createDate) = MONTH(NOW())
GROUP BY a.userId
ORDER BY totalIncome DESC
LIMIT 5;

# 이번달 카테고리별 판매 금액, 판매 건수 
SELECT b.category, SUM(b.price) AS totalIncome, SUM(a.count) AS totalCount
FROM purchasehistory AS a
INNER JOIN item AS b
ON a.itemId = b.id
WHERE MONTH(a.createDate) = MONTH(NOW())
GROUP BY b.category
ORDER BY totalIncome DESC;

# 오늘 가입한 유저 정보
SELECT *
FROM user
WHERE DAYOFYEAR(createDate) = DAYOFYEAR(NOW());

# 이번주 가입자 수
SELECT DATE(a.createDate) AS joinDate,COUNT(createDate) AS joinCount
FROM user AS a
WHERE DAYOFYEAR(createDate) BETWEEN DAYOFYEAR(NOW()) -6 AND DAYOFYEAR(NOW())
GROUP BY DAYOFYEAR(createDate)
ORDER BY joinDate;

# 오늘 가입자 수 
SELECT DATE(a.createDate) AS joinDate,COUNT(createDate) AS joinCount
FROM user AS a
WHERE DAYOFYEAR(createDate) = DAYOFYEAR(NOW())
GROUP BY DAYOFYEAR(createDate);

# 총 가입자 수 
SELECT DATE(a.createDate) AS joinDate, COUNT(createDate) AS joinCount
FROM user AS a;

# 이번주 총 가입자 수
SELECT DATE(a.createDate) AS joinDate,COUNT(createDate) AS joinCount
FROM user AS a
WHERE DAYOFYEAR(createDate) BETWEEN DAYOFYEAR(NOW()) -6 AND DAYOFYEAR(NOW());

# oauth 별 총 가입자 수 
SELECT oauth, COUNT(*) AS count
FROM user
GROUP BY oauth;

# oauth 별 오늘 가입자 수 
SELECT oauth, COUNT(*) AS count
FROM user
WHERE DAYOFYEAR(createDate) = DAYOFYEAR(NOW())
GROUP BY oauth;

# 구매내역 샘플 데이터 
INSERT INTO purchasehistory VALUES(1, 1, NOW(), 2, 2);
INSERT INTO purchasehistory VALUES(2, 1, TIMESTAMP('20220802', '16:00:00'), 24, 3);
INSERT INTO purchasehistory VALUES(3, 1, TIMESTAMP('20220803', '16:00:00'), 2, 2);
INSERT INTO purchasehistory VALUES(4, 1, TIMESTAMP('20220804', '12:00:00'), 2, 12);
INSERT INTO purchasehistory VALUES(5, 1, TIMESTAMP('20220731', '16:00:00'), 2, 6);
INSERT INTO purchasehistory VALUES(6, 1, TIMESTAMP('20220802', '16:00:00'), 2, 7);
INSERT INTO purchasehistory VALUES(7, 1, TIMESTAMP('20220801', '16:00:00'), 3, 3);
INSERT INTO purchasehistory VALUES(8, 1, TIMESTAMP('20220801', '16:00:00'), 4, 12);
INSERT INTO purchasehistory VALUES(9, 1, TIMESTAMP('20220729', '16:00:00'), 4, 6);
INSERT INTO purchasehistory VALUES(10, 1, TIMESTAMP('20220803', '16:00:00'), 5, 7);
INSERT INTO purchasehistory VALUES(11, 1, TIMESTAMP('20220728', '16:00:00'), 5, 3);
INSERT INTO purchasehistory VALUES(12, 1, TIMESTAMP('20220804', '16:00:00'), 6, 9);
INSERT INTO purchasehistory VALUES(13, 1, TIMESTAMP('20220804', '16:00:00'), 6, 9);
INSERT INTO purchasehistory VALUES(14, 1, TIMESTAMP('20220801', '16:00:00'), 7, 2);
INSERT INTO purchasehistory VALUES(15, 1, TIMESTAMP('20220801', '16:00:00'), 7, 12);
INSERT INTO purchasehistory VALUES(16, 1, TIMESTAMP('20220730', '16:00:00'), 7, 6);
INSERT INTO purchasehistory VALUES(17, 1, TIMESTAMP('20220730', '16:00:00'), 7, 12);
INSERT INTO purchasehistory VALUES(18, 1, TIMESTAMP('20220730', '16:00:00'), 8, 2);
INSERT INTO purchasehistory VALUES(19, 1, TIMESTAMP('20220731', '16:00:00'), 8, 7);
INSERT INTO purchasehistory VALUES(20, 1, TIMESTAMP('20220803', '16:00:00'), 9, 3);
INSERT INTO purchasehistory VALUES(21, 1, NOW(), 9, 3);
INSERT INTO purchasehistory VALUES(22, 1, NOW(), 9, 3);
INSERT INTO purchasehistory VALUES(23, 1, NOW(), 24, 3);
INSERT INTO purchasehistory VALUES(24, 1, NOW(), 8, 3);
INSERT INTO purchasehistory VALUES(25, 1, NOW(), 7, 3);
INSERT INTO purchasehistory VALUES(26, 1, NOW(), 6, 3);
INSERT INTO purchasehistory VALUES(27, 1, NOW(), 5, 3);
INSERT INTO purchasehistory VALUES(28, 1, NOW(), 12, 3);
INSERT INTO purchasehistory VALUES(29, 1, NOW(), 13, 3);


# 상품 샘플 데이터
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
