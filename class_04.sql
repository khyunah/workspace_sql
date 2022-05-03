use shopdb;

select * from usertbl;
select * from buytbl;

select * from usertbl;
insert into usertbl values('야스오', 2000, '여수', '010-1234-1234');

-- inner join 1 ( 가장 기본적인 join, 교집합 )
select *
from usertbl
inner join buytbl
on usertbl.userName = buytbl.userName;

-- inner join 2 
select a.userName, a.addr, a.mobile, b.prodName, b.price, b.amount
from usertbl as a -- as 별칭을 뜻함 ( 코드구문 안에서만 )
inner join buytbl as b
on a.userName = b.userName;

/*
as ㅡ> 쿼리 구문 내에서 별칭을 사용할 수 있다.
inner join ㅡ> 교집합을 사용할 것이다.
on ㅡ> 
*/

-- inner join test
select a.userName, a.addr, b.prodName, b.amount
from usertbl as a
inner join buytbl as b
on a.userName = b.userName;

select a.userName, b.prodName, b.amount
from usertbl as a
inner join buytbl as b
on a.userName = b.userName;

-- left join 1 ( 왼쪽에 있는 데이터는 전부 들고오기 )
select *
from usertbl as u
left join buytbl as b
on u.userName = b.userName;

-- left join 2 ( 왼쪽만 있는 데이터 들고 오기 )
select *
from usertbl as u
left join buytbl as b
on u.userName = b.userName
where b.userName is not null;

-- left join test
select u.userName, u.addr, b.prodName, b.amount, b.price
from usertbl as u
left join buytbl as b
on u.userName = b.userName
where b.userName is not null;

select * from buytbl;
-- buytbl 생성할때 외래키에 대한 제약을 생성했기 때문에 usertbl에 해당 name이 없으면 insert 할수 없다.
insert into buytbl values('티모', '컴퓨터', 100, 1);
-- 하지만 buytbl을 생성할때 외래키 ( FK )를 제약하지 않았다면 insert 가능

-- left join 3 ( buytbl기준이라 야스오 안나옴 )
select *
from buytbl as b
left join usertbl as u
on u.userName = b.userName;

-- left join 4
select *
from buytbl as b
left join usertbl as u
on u.userName = b.userName
where u.userName is not null;

-- right join 1
select u.userName, b.prodName, b.price, b.amount
from usertbl as u
right join buytbl as b
on u.userName = b.userName;

-- closs join 1 ( 곱집합 )
select *
from usertbl as u
cross join buytbl as b
on u.userName = b.userName;

-- closs join 2
select * 
from usertbl
cross join buytbl
on usertbl.userName = buytbl.userName
where usertbl.userName is null
or buytbl.userName is null;