select * from 곡;
select * from 앨범;

-- 문제 1. '해변의 여인'이라는 노래를 담고 있는 타이틀과 아티스트를 검색하라.
-- ansi sql
select a.타이틀, a.아티스트, b.곡명
from 앨범 as a
inner join 곡 as b
on a.앨범번호 = b.앨범번호
where b.곡명 = '해변의 여인';

-- mysql
select a.타이틀, a.아티스트, b.곡명
from 앨범 as a, 곡 as b
where a.앨범번호 = b.앨범번호
and b.곡명 = '해변의 여인';

-- 문제 2. '그대내품에'라는 노래를 부른 아티스트를 검색하라.
-- ansi sql
select a.아티스트, b.곡명
from 앨범 as a
inner join 곡 as b
on a.앨범번호 = b.앨범번호 
where b.곡명 = '그대 내 품에';

-- mysql
select a.아티스트, b.곡명 
from 앨범 as a, 곡 as b
where a.앨범번호 = b.앨범번호
and b.곡명 = '그대 내 품에';

-- 문제 3. 'Break Up 2 Make Up'이라는 이름을 가지고 있는 앨범에 수록된 노래를 모두 검색하라.
-- ansi sql
select a.*, b.타이틀
from 곡 as a
inner join 앨범 as b
on a.앨범번호 = b.앨범번호 
where b.타이틀 = 'Break Up 2 Make Up';

-- mysql
select a.타이틀 , b.*
from 앨범 as a, 곡 as b
where a.앨범번호 = b.앨범번호
and a.타이틀 = 'Break Up 2 Make Up';

-- 문제 4. 각 앨범에 수록된 타이틀별 수록곡의 개수를 검색하라.
-- ansi sql
select a.타이틀, count(b.곡명) as '타이틀별 수록곡 개수'
from 앨범 as a
inner join 곡 as b
on a.앨범번호 = b.앨범번호
group by a.타이틀;

-- mysql
select a.타이틀, count(b.곡명) as '타이틀별 수록곡 개수'
from 앨범 as a, 곡 as b
where a.앨범번호 = b.앨범번호
group by 타이틀;

-- 문제 5. '사랑'이라는 단어가 포함된 곡명을 가진 앨범의 타이틀별 수록곡의 개수를 검색하라.
-- ansi sql
select a.타이틀,count(b.곡명) as '사랑 이라는 단어가 포함된 곡수'
from 앨범 as a
inner join 곡 as b
on a.앨범번호 = b.앨범번호
where b.곡명 like "%사랑%"
group by a.타이틀;

-- mysql 
select a.타이틀, count(b.곡명) as '사랑 이라는 단어가 포함된 곡수'
from 앨범 as a, 곡 as b
where a.앨범번호 = b.앨범번호
and b.곡명 like '%사랑%'
group by 타이틀;

-- 문제 6 타이틀과 곡명이 동일한 앨범의 노래 이름을 검색하라.
-- ansi sql
select a.타이틀, b.곡명, a.아티스트
from 앨범 as a
inner join 곡 as b
on a.앨범번호 = b.앨범번호 
where a.타이틀 = b.곡명;

-- mysql
select a.아티스트, a.타이틀, b.곡명 
from 앨범 as a, 곡 as b
where a.앨범번호 = b.앨범번호 
and a.타이틀 = b.곡명;

-- 문제 7 예를 들어 그룹 'Blur'가 'Blur'라는 이름의 앨범을 발매할 수 있다.
-- 이와 같이 아티스트와 타이틀이 동일한 앨범의 타이틀을 검색하라.
select 아티스트, 타이틀
from 앨범 
where 아티스트 = 타이틀;

-- 문제 8 동일한 곡명이 2개 이상 앨범에 존재하는 경우,
-- 앨범 별 해당 곡명과 수록 곡의 개수를 검색하라.
-- ansi sql
select a.앨범번호, a.타이틀, count(b.곡명) as '동일 곡명 2개 이상 수록곡 개수'
from 앨범 as a
inner join 곡 as b
on a.앨범번호 = b.앨범번호 
group by b.곡명
having 1 < count(b.곡명);

-- mysql
select a.타이틀, a.아티스트, b.곡명, count(b.곡명) as '동일 곡명 2개 이상 수록곡 개수'
from 앨범 as a, 곡 as b
where a.앨범번호 = b.앨범번호
group by b.곡명
having 1 < count(b.곡명);