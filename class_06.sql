-- MY SQL Numbering Function
select * from buytbl;

-- 절대값
select abs(-252.2) as 절댓값;

-- 합계 
select *, sum(price) as 합계
from buytbl;

select sum(price) as 합계
from buytbl;

-- 서브쿼리 ( 쿼리에 쿼리를 두는것 )
select *, (select sum(price) from buytbl) as 총합계
from buytbl;

-- 평균 값
select *, avg(price) as 평균값
from buytbl;

select *, (select avg(price) from buytbl) as 평균값
from buytbl;

-- 올림
select ceil(25.12);

-- 반올림
select round(135.523);
-- 소수점 1번째 자리까지 출력
select round(135.523, 1);

-- 내림
select floor(25.21);

select ceil(round(10 - 5.5) + 5);

-- max 값
select max(price)
from buytbl;

-- min 값
select min(price)
from buytbl;

-- usertbl, buytbl 문제 1개씩 만들기
select * from usertbl;
select * from buytbl;

-- usertbl에서 최대 출생년도와 최저 출생년도 뽑아내기
select max(birthYear) as maxYear, min(birthYear) as minYear
from usertbl;

-- buytbl에서 구매한 상품의 평균값 구하기
-- 한개에 대한 함수를 사용할 때에는 where 조건절이 필요하다.
select b.*, (select avg((price * amount) / amount) from buytbl where prodName = b.prodName)as 1개당평균가 
from buytbl as b;

-- 반 학생들이 낸 문제 
-- 1. '이승기' 고객이 구매한 제품가격의 평균 출력하기 (buytbl 사용)
select avg(price * amount) as 평균구매가
from buytbl
where userName = '이승기';

-- 2. 가격의 평균을 구하고 반올림하기
select avg(round(price * amount)) as 평균가격
from buytbl;

-- 3. buytbl에서 가장 비싼 값과 가장 저렴한 값을 조회, 가격의 평균값을 반올림하기
select max(price) as 최고가, min(price) as 최저가, avg(round(price * amount))
from buytbl;

-- 4. usertbl 기준으로 서브 쿼리를 이용해서 price의 합계,max값 구하기
select *, (select sum(price) from buytbl) as 매출합계, (select max(price) from buytbl) as 최고가
from usertbl;

-- 5. 홍길동의 총구매금액
select userName, sum(price) as 총구매금액
from buytbl
where userName = '홍길동';


-- 6. 판매실적
select sum(price * amount) as 판매실적
from buytbl;

-- 7. buytbl에서 총 매출과 전체 평균을 구하세요 평균은 1의 자리에서 반올림 해주세요
select sum(price * amount) as 총매출, avg(round(price * amount)) as 전체평균 
from buytbl;
