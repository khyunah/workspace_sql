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
SELECT * FROM menu;
SELECT * FROM subMenu;

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
alter table personTest rename column name to personName;
ALTER TABLE purchasehistory rename column count_1 to count;

UPDATE communityBoard SET likeCount = 23 WHERE id = 19;
UPDATE user SET username = "aaaaaa@nate.coma_2317239864" WHERE id = 3;
UPDATE user SET role = "ADMIN" WHERE id = 1;
UPDATE user SET createDate = TIMESTAMP('20220720', '16:00:00') WHERE id = 3;
UPDATE item SET amount = 20;
DELETE FROM user WHERE id = 11;
DROP TABLE purchasehistory;

# 히스토리 아이디가 제일 높은순으로 들고 와서 날짜 뽑기 
SELECT *
FROM purchasehistory
WHERE userId = 1 
ORDER BY id DESC
LIMIT 1;

# 재고 확인 
SELECT amount FROM item WHERE id = 1;

# 장바구니 아이템별 갯수
SELECT item_id, count FROM basket WHERE userId = 1;

# 해당 보드의 댓글 갯수
SELECT a.boardId AS id, COUNT(a.boardId) AS count
FROM reply AS a
GROUP BY boardId;

# 좋아요 리스트
SELECT b.imageUrl, b.username, b.name, b.id
FROM communityLike AS a
INNER JOIN user AS b
ON a.userId = b.id
WHERE a.boardId = 16;

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
SELECT DAY(createDate) AS date, COUNT(createDate) AS count
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

# 좋아요 샘플 데이터 
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 1);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 2);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 3);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 4);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 5);

INSERT into communityLike(isLike, boardId, userId) values(1, 1, 6);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 7);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 8);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 9);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 10);

INSERT into communityLike(isLike, boardId, userId) values(1, 1, 11);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 12);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 13);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 14);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 15);

INSERT into communityLike(isLike, boardId, userId) values(1, 1, 16);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 17);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 18);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 19);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 20);

INSERT into communityLike(isLike, boardId, userId) values(1, 1, 21);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 22);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 23);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 24);
INSERT into communityLike(isLike, boardId, userId) values(1, 1, 25);

# 커뮤니티 보드 샘플데이터 26개
insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('“Fashion is not something that exists in dresses only. Fashion is in the sky, in the street, fashion has to do with ideas, the way we live, what is happening.', 
TIMESTAMP('20220731', '16:00:00'), 'a79a46c9-f0dc-403a-8b82-a5617f06e267.jpg', '1.jpg', '서울 패션 위크', 2);

insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('“패션은 드레스에만 존재하는 것이 아니다 패션은 하늘에도 거리에도 있고 아이디어 우리가 사는 방식 일어나는 일 패션 관련이 있다.', 
TIMESTAMP('20220801', '16:00:00'), 'a927e701-b5be-4db0-af3b-613e7c7b2786.jpg', '2.jpg', '코코언니 명언과 함께1', 3);
insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('“패션은 드레스에만 존재하는 것이 아니다 패션은 하늘에도 거리에도 있고 아이디어 우리가 사는 방식 일어나는 일 패션 관련이 있다.', 
TIMESTAMP('20220801', '16:00:00'), '8a1dfc38-6700-45e7-becf-509631d07e7a.jpg', '3.jpg', '코코언니 명언과 함께2', 3);

insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('I love women. Im trying to do beautiful things with them. Im not trying to insult them. My life is not about that.', 
TIMESTAMP('20220802', '16:00:00'), '58e4060b-367e-403d-8487-d4700b8c7f51.jpg', '4.jpg', '캘빈', 4);
insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('나는 그들과 함께 아름다운 것을 하려고 노력하고 있어', 
TIMESTAMP('20220802', '16:00:00'), 'dcab797b-633a-48e4-a848-6fecdaba084d.jpg', '5.jpg', '내 인생은', 5);
insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('당신은 패션을 알고 있거나 그렇지 않다.', 
TIMESTAMP('20220803', '16:00:00'), 'e8939024-e503-4648-8fa8-e7ece19c4177.jpg', '6.jpg', 'You either know fashion or you don’t.', 6);

insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('당신은 패션을 알고 있거나 그렇지 않다.', 
TIMESTAMP('20220804', '16:00:00'), '8af39f00-bc2e-4253-ae70-43bd19f949a2.jpg', '7.jpg', 'You either know fashion or you don’t.', 6);
insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('신발 선택에 대해 지나치게 신경을 쓴다는 것은 있을 수 없다. 너무 많은 여성들이 중요하지 않다고 생각하지만 우아한 여성에 대한 진정한 증거는 발끝에 있다.', 
TIMESTAMP('20220804', '16:00:00'), '80a2ad0c-b12e-448e-94ab-1efbb1153134.jpg', '8.jpg', 'Christian Dior', 7);

insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('나는 모든 것에 아름다움이 있다고 생각한다. "정상적인" 사람들이 추악한 것을 생각할 때 나는 보통 그것에 아름다움의 일부를 볼 수 있다.', 
TIMESTAMP('20220805', '16:00:00'), 'a9ffdf0c-3b02-4a82-a107-93c742e0c887.jpg', '9.jpg', '알렉산드라 ', 3);
insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('I think there is beauty in everything. What ‘normal’ people would perceive as ugly, I can usually see something of beauty in it.', 
TIMESTAMP('20220805', '16:00:00'), 'a9ffdf0c-3b02-4a82-a107-93c742e0c887.jpg', '10.jpg', 'Alexander McQueen', 4);
insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('모든 것에 아름다움이', 
TIMESTAMP('20220805', '16:00:00'), 'db35b013-ca90-4fc9-af60-87765f895ba7.jpg', '11.jpg', '아름다움', 5);

insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('I think there is beauty in everything. What ‘normal’ people would perceive as ugly, I can usually see something of beauty in it.', 
TIMESTAMP('20220806', '16:00:00'), 'a116602d-bc86-4de5-b785-0a771627a14b.jpg', '12.jpg', 'McQueen', 8);
insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('나는 내가 바로 볼 수 있는 곳에 내 돈이 있는 것이 좋다. 바로 내 옷장에 걸려 있을 때.', 
TIMESTAMP('20220806', '16:00:00'), 'd95496fb-46b8-4548-a0ad-33e44236c921.jpg', '13.jpg', 'Carrie', 5);
insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('좋다. 바로 내 옷장', 
TIMESTAMP('20220806', '16:00:00'), 'd95496fb-46b8-4548-a0ad-33e44236c921.jpg', '14.jpg', 'good', 5);
insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES(' “Fashion is not necessarily about labels. It’s not about brands. It’s about something else that comes from within you.”', 
TIMESTAMP('20220806', '16:00:00'), 'f9f6ff76-f8e2-4a98-a9ba-39876d05bd14.jpg', '15.jpg', 'Ralph Lauren', 4);

insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('패션은 라벨 브랜드 필요한 것이 아니다. 그것은 당신 안에서 오는 다른 것에  있는 것이다.', 
TIMESTAMP('20220807', '16:00:00'), '257ae66a-3f31-4873-9d49-7dc2d37412fc.jpg', '16.jpg', '안에서', 9);
insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('“Style is very important. It has nothing to do with fashion. Fashion is over quickly. Style lasts forever.”', 
TIMESTAMP('20220807', '16:00:00'), '3939a852-7bc2-4b7d-907e-adaacfff02ee.jpg', '17.jpg', 'Ralph', 8);
insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('스타일은 매우 중요하다. 패션과는 아무런 관련이 없다. 패션은 빨리 지나가고 스타일은 영원하다.', 
TIMESTAMP('20220807', '16:00:00'), 'f4b8f6d2-23e8-4f79-bdf0-d4b7061d1436.jpg', '18.jpg', '랄프로렌', 5);

insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('수년 동안 나는 옷에서 중요한 것은 그 옷을 입는 여성이 누구인가라는 것을 배웠다.', 
TIMESTAMP('20220808', '16:00:00'), '28d7b8a1-d9fc-4a68-9000-8f876c7e8eef.jpg', '19.jpg', '쎄인트', 4);
insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('계단샷', 
TIMESTAMP('20220808', '16:00:00'), '44997dcb-bdc6-48fc-ba18-d6f412c1a801.jpg', '20.jpg', '애들이랑', 2);

insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('Clothes mean nothing until someone lives in them', 
TIMESTAMP('20220809', '16:00:00'), '4659bc01-b394-42e2-961b-08006661c4ce.jpg', '21.jpg', 'Marc', 10);
insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('옷은 누군가가 그들 안에 살 때까지 아무 의미가 없다', 
TIMESTAMP('20220809', '16:00:00'), '91ac6a29-cf11-4620-963f-74721e3958da.jpg', '22.jpg', 'Jacobs', 11);

insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('Whoever said that money can’t buy happiness, simply didn’t know where to go shopping', 
TIMESTAMP('20220810', '16:00:00'), '488484ba-f749-4514-bdae-16f7ae7e2c11.jpg', '23.jpg', '콥스 명언과 함께', 12);
insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('Clothes are like a good meal, a good movie, great pieces of music', 
TIMESTAMP('20220810', '16:00:00'), 'b1d98ff8-20ab-4340-b708-a36513f19be1.jpg', '24.jpg', 'Michael', 9);
insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('돈이 행복을 살 수 없다고 말 한 사람이라면 어디에서 쇼핑을 해야 하는지 모르는 것이다.', 
TIMESTAMP('20220810', '16:00:00'), 'd58cc797-cedd-442c-9046-95a8e8eb81e9.jpg', '25.jpg', 'Kors', 7);
insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('패션은 일 년에 4번 디자이너가 제공하고 스타일은 당신이 선택하는 것이다.', 
TIMESTAMP('20220810', '16:00:00'), 'f19c2ec3-701e-44fe-85db-df5146ded398.jpg', '26.jpg', 'Jacobs', 11);

insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('허름한 옷을 입으면 사람들은 옷을 기억하고 흠잡을데 없이 옷을 입으면 사람들은 그 여자를 기억한다', 
TIMESTAMP('20220811', '16:00:00'), 'a6d7e269-6e9a-4721-9993-4064d671d970.jpg', '27.jpg', '_', 14);
insert into communityBoard(content, createDate, imageUrl, originImageTitle, title, userId) 
VALUES('단순함은 우아함의 진정한 핵심이다', 
TIMESTAMP('20220811', '16:00:00'), '6baa39d0-1d88-4c03-b135-90866cef2ad0.jpg', '28.jpg', '코코언니 명언', 15);

# 구매내역 샘플 데이터 아이템 1- 20 / 유저 2 - 15 / 220731 - 220811
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('부산시 진구', 1, TIMESTAMP('20220731', '16:00:00'), DATE('20220731'), '구매1', 'MONEY', '1', 4500, 1, 1);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('부산시 진구', 2, TIMESTAMP('20220731', '16:00:00'), DATE('20220731'), '구매1', 'MONEY', '1', 4500, 2, 1);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시 금천구', 2, TIMESTAMP('20220731', '16:00:00'), DATE('20220731'), '구매2', 'MONEY', '2', 12000, 2, 2);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시 금천구', 2, TIMESTAMP('20220731', '16:00:00'), DATE('20220731'), '구매2', 'MONEY', '2', 10500, 3, 2);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 5, TIMESTAMP('20220731', '16:00:00'), DATE('20220731'), '구매3', 'MONEY', '3', 51200, 4, 3);

INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220801', '16:00:00'), DATE('20220801'), '구매4', 'MONEY', '4', 8000, 3, 4);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220801', '16:00:00'), DATE('20220801'), '구매5', 'MONEY', '5', 8000, 3, 5);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 2, TIMESTAMP('20220801', '16:00:00'), DATE('20220801'), '구매6', 'MONEY', '6', 8000, 3, 6);

INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220802', '16:00:00'), DATE('20220802'), '구매7', 'MONEY', '7', 8000, 5, 7);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 2, TIMESTAMP('20220802', '16:00:00'), DATE('20220802'), '구매7', 'MONEY', '7', 32000, 6, 7);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 3, TIMESTAMP('20220802', '16:00:00'), DATE('20220802'), '구매7', 'MONEY', '7', 46000, 7, 7);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 2, TIMESTAMP('20220802', '16:00:00'), DATE('20220802'), '구매7', 'MONEY', '7', 12000, 8, 7);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 3, TIMESTAMP('20220802', '16:00:00'), DATE('20220802'), '구매7', 'MONEY', '7', 74000, 9, 7);

INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220803', '16:00:00'), DATE('20220803'), '구매8', 'MONEY', '8', 9200, 7, 8);

INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220804', '16:00:00'), DATE('20220804'), '구매9', 'MONEY', '9', 11400, 10, 9);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 2, TIMESTAMP('20220804', '16:00:00'), DATE('20220804'), '구매10', 'MONEY', '10', 20000, 11, 9);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220804', '16:00:00'), DATE('20220804'), '구매11', 'MONEY', '11', 10000, 8, 10);

INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 5, TIMESTAMP('20220805', '16:00:00'), DATE('20220805'), '구매12', 'MONEY', '12', 54000, 12, 11);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220805', '16:00:00'), DATE('20220805'), '구매12', 'MONEY', '12', 7500, 12, 11);

INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 2, TIMESTAMP('20220806', '16:00:00'), DATE('20220806'), '구매13', 'MONEY', '13', 8500, 13, 12);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220806', '16:00:00'), DATE('20220806'), '구매13', 'MONEY', '13', 10000, 14, 12);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220806', '16:00:00'), DATE('20220806'), '구매14', 'MONEY', '14', 8000, 15, 13);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 2, TIMESTAMP('20220806', '16:00:00'), DATE('20220806'), '구매14', 'MONEY', '14', 10000, 8, 13);

INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220807', '16:00:00'), DATE('20220807'), '구매15', 'MONEY', '15', 8900, 15, 14);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220807', '16:00:00'), DATE('20220807'), '구매16', 'MONEY', '16', 12500, 16, 14);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 2, TIMESTAMP('20220807', '16:00:00'), DATE('20220807'), '구매16', 'MONEY', '16', 22000, 17, 14);

INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220808', '16:00:00'), DATE('20220808'), '구매17', 'MONEY', '17', 30000, 18, 5);

INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 2, TIMESTAMP('20220809', '16:00:00'), DATE('20220809'), '구매18', 'MONEY', '18', 22000, 18, 7);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220809', '16:00:00'), DATE('20220809'), '구매19', 'MONEY', '19', 12000, 18, 8);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220809', '16:00:00'), DATE('20220809'), '구매20', 'MONEY', '20', 5900, 18, 9);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220809', '16:00:00'), DATE('20220809'), '구매21', 'MONEY', '21', 4500, 18, 12);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220809', '16:00:00'), DATE('20220809'), '구매22', 'MONEY', '22', 8800, 18, 3);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220809', '16:00:00'), DATE('20220809'), '구매23', 'MONEY', '23', 5600, 18, 5);

INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220810', '16:00:00'), DATE('20220810'), '구매24', 'MONEY', '24', 14700, 19, 11);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 2, TIMESTAMP('20220810', '16:00:00'), DATE('20220810'), '구매25', 'MONEY', '25', 27800, 19, 15);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220810', '16:00:00'), DATE('20220810'), '구매26', 'MONEY', '26', 16500, 19, 4);

INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220811', '16:00:00'), DATE('20220811'), '구매26', 'MONEY', '26', 14700, 20, 15);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 2, TIMESTAMP('20220811', '16:00:00'), DATE('20220811'), '구매27', 'MONEY', '27', 9900, 20, 8);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220811', '16:00:00'), DATE('20220811'), '구매27', 'MONEY', '27', 14700, 5, 8);
INSERT INTO purchasehistory(address, count, createDate, createdAt, itemName, paymentMethodType, tid, total, itemId, userId) 
VALUES('서울시', 1, TIMESTAMP('20220811', '16:00:00'), DATE('20220811'), '구매27', 'MONEY', '27', 10000, 6, 8);

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
