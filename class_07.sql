-- MY SQL Date function

-- 현재 날짜 ( 년 월 일 )
select curdate();
select current_date();

-- 현재 시간 ( 시 분 초 )
select curtime();
select current_time();

-- 일자를 반환하는 함수
select day("2017-06-15");
select day(curdate());

-- 올해부터 카운트해서 주 를 반환하는 함수
select week("2017-06-15");
select week(curdate());

-- 월 0, 화 1, 수 2, 목 3, 금 4, 토 5, 일 6
select weekday("2017-06-15");
select weekday(curdate());

-- 년월일 시분초
select now();
select sysdate();

-- 문자열을 date타입으로 
-- 인수에 따라 datetime값을 반환한다.
select timestamp("2019-06-15", "13:10:11");

-- 시간차 
select timediff("13:10:11", "13:10:10");
select timediff("2022-05-03 13:10:11", "2022-01-03 13:10:10");
select timediff(now(), "2022-05-03 09:10:10");

-- 날짜 빼기
select subdate(now(), interval 10 day);

-- 날짜 더하기
select date_add(sysdate(), interval 10 day);

-- 부가적인 기능
select system_user();
select session_user();
select current_user();
select version();

-- null값이라면 Hello로 표시할것이다.
select nullif("Hello", null);
select nullif("x", null);

-- date function으로 문제 만들기
-- 기념일 언제인지 출력해보기 ( 100일, 200일, 1000일 등)
select date_add("2022-05-03", interval 100 day);
-- 현재 날짜와 시간 각각 함수를 사용해서 출력하기
select curdate(), curtime();

-- 반 학생들이 낸 문제 
-- 1. 오늘 부트캠프 몇 주차인가
select week(now()) - week("2022-03-21") as 부트캠프몇주;

-- 2. 학원에 있었던 시간 구하기
select timediff(curtime(), "09:00:00");

-- 3. 부트캠프 종강일의 요일 조회 (종강일 8월 8일)
select weekday("2022-08-08");

-- 4. 수업이 끝나는 시간까지 남은 시간 계산
select timediff(curtime(), "17:50:00");

-- 5. 현재부터 어린이날까지 남은 시간 구하기
select timediff(now(), "2022-05-05 00:00:00");

-- 6. 어린이날까지 남은 날짜 계산하기
select day(now()) - day("2022-05-05") as 'd-day';

-- 7. timestamp로 주문날짜 정하고 date_add로 5일 추가해서 도착날짜 정하기
select timestamp("2022-05-03", "00:00:00") as 주문날짜, date_add(주문날짜, interval 5 day);
-- 테이블이 없으면 별칭을 써도 한 구문내에서 사용불가하다. 

select b.userName, b.prodName, b.price, b.amount,timestamp("2022-05-01" , "13:21:16") as 주문날짜, 
        (select date_add(주문날짜 , interval 5 day)) as 도착날짜 
from buytbl as b
where b.userName = '이순신';