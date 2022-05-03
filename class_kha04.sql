# JOIN 문
# Inner join
select * from usertbl;
select * from buytbl;

# inner join 1
select *
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

# inner join 2
select u.userName, b.prodName, b.price, b.amount, u.mobile
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

# Left join 1 - 왼쪽부분 전체와 오른쪽의 공통된 부분만 조회 
select *
from usertbl as u 
left join buytbl as b
on u.userName = b.userName;

# Left join 2 - 왼쪽만 존재하는 데이터 조회
select *
from usertbl as u
left join buytbl as b
on u.userName = b.userName
where b.userName is null;

# Right join 
select *
from usertbl as u
right join buytbl as b
on u.userName = b.userName;

# Cross join
select *
from usertbl as u
cross join buytbl as b
on u.userName = b.userName;

select *
from usertbl as u
cross join buytbl as b
on u.userName = b.userName
where u.userName is null
or b.userName is null;
