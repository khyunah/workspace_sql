# Date Function
# 현재 날짜 
select curdate();
select current_date();

# 현재 시간
select curtime();
select current_time();

# 현재 날짜, 시간
select now();
select sysdate();
select current_timestamp();

# 일자를 반환
select day('2022-05-05');
select day(now());
select dayofmonth(curdate());

# 해당 년초부터 일수를 반환
select dayofyear('2022-05-05');
select dayofyear(now());

# 해당 년초부터 주수를 반환
select week('2022-05-05');
select week(now());
select weekofyear(curdate());

# 요일을 숫자로 반환
select weekday('2022-05-05');
select weekday(now());

# 요일을 문자열로 반환
select dayname('2022-05-05');
select dayname(now());

# 시간 빼기
select timediff('22:00:00', '20:00:00');
select timediff('2022-05-05 22:00:00', '2022-05-05 09:00:00');
-- 최대차가 838:59:59 이다.
select timediff('2022-05-05 22:00:00', '2021-05-05 22:00:00');

# 날짜 빼기
select subdate('2022-05-05', interval 10 day);
select subdate(now(), interval 5 hour);
select subdate(now(), interval 2 month);
select subdate(now(), interval 1 year);
select subdate(now(), interval 2 week);
select subdate(now(), interval 10 minute);
select date_sub(curdate(), interval 1 day);

# 날짜 더하기
select adddate('2022-05-05', interval 10 day);
select adddate(now(), interval 5 hour);
select date_add(now(), interval 3 year);