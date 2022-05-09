# String Function

# 문자열의 길이
select char_length('안녕하세요');

# 아스키 코드
select ascii('A');

# 문자열 연결
select concat('안녕', '하세요');

# 문자열 사이에 문자열 추가하며 연결
select concat_ws('-->', '부산', '대구', '서울');

# 문자열의 인덱스를 반환
select find_in_set('차', '자,동,차');

# 대문자를 소문자로 변환 
select lcase('Hello MYSQL');

# 소문자를 대문자로 변환
select ucase('hello');

# 문자열 앞뒤 공백 제거
select trim('       안 녕       하세요         ');

# 특정 문자열을 대체 문자열로 변환
select replace('       안 녕       하세요         ', ' ', '');