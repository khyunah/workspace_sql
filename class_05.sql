-- mysql String function
select ascii('b');
select char_length('MY SQL TEST') as 문자길이; -- 필드명 별칭 변경 가능
select char_length('홍길동') as 이름;
select concat('boot', 'class', '100%') as class_name;
select concat_ws('->', 'boot', 'class', '100%') as class_name; -- 문자열 사이사이 첫번째 문자열을 추가하는 것
select find_in_set('s', 's,q,l'); -- 첫번째 문자열이 두번째 문자열에 몇번째 인덱스에 존재하는지 인덱스 번호 리턴 

-- 숫자 형식은 "#.##.##.##" ( 소수점 두자리 반올림 ) 으로 지정 한다.
select format(250500.5634, 0);

select lcase('HELLO JAVA'); -- 대문자를 소문자로 변환
select ucase('hello java'); -- 소문자를 대문자로 변환

select trim('        M Y S Q L            '); -- 앞과 뒤의 공백 제거
select replace('       aaa   11     ', ' ', ''); -- 문자열에서 한칸공백을 공백없는것으로 처리


-- inner join 2 
select a.userName, a.addr, a.mobile, b.prodName, b.price, b.amount, char_length(a.userName)
from usertbl as a -- as 별칭을 뜻함 ( 코드구문 안에서만 )
inner join buytbl as b
on a.userName = b.userName;

-- '누가 구매한 상품명' 으로 리스트를 만들고, 가격과 수량 조회하기
select concat_ws('가 구매한 ', u.userName, b.prodName) as 'list', b.amount, b.price
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

-- 누가, 무엇을 , 몇개를, 가격 조회하기. 단, 가격에 원을 붙여서 조회
select u.userName, b.prodName, b.amount, concat(b.price, '만원') as 'price'
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

-- 반학생들이 만든 문제 풀기
-- 1. mobile에서 -빼고 조회
select u.userName, replace(u.mobile, '-', '') as mobile, b.prodName, b.price, b.amount 
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

-- 2. 주소에있는 문자열 글자수 확인하기,
-- amount ascii 값 확인하기. as(별칭)
select u.userName, u.addr, char_length(u.addr) as '주소글자수', b.prodName, b.price, ascii(b.amount) as '암호화된 수량'
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

-- 3. usertbl 기준으로 buytbl과 공통되는 userName 출력하고, 글자수 반환하기
select u.userName, char_length(u.userName) as '이름 글자수'
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

-- 4. userName이 홍길동이면 1출력 아니면 0
select *, find_in_set('홍길동', u.userName)
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

-- 5. usertbl의 이름과 번호, buytbl의 가격과 수량 데이터를 가져오고, 번호의 문자길이 조회하기
select u.userName, u.mobile, b.price, b.amount, char_length(u.mobile) as '번호 길이'
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;
