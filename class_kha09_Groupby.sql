# GROUP BY
use student;

# group by 1
# 전공별로 학생이 몇명인지 카운트 
select major, count(*) as '학과별 학생수'
from studenttbl
group by major;

select * from studenttbl;

# group by 2
# 전공별로 제일 고학년이 몇학년인지 
select major, max(grade) as '최고학년'
from studenttbl
group by major

# group by 3
# 학년별 21살 이상이 몇명인지
select grade, count(*) as '21살 이상 학생수'
from studenttbl
where age >= 21
group by grade;

select * from studenttbl;

# group by 4 
# grade로 그룹화하여 해당 결과에서 조건을 걸때 
# 경영학과의 학년별 학생수를 그룹화하여 카운트하고, 1명 초과인 학년 뽑기
select major, grade, count(*) as 학년별학생수
from studenttbl
where major = '경영'
group by grade
having 학년별학생수 > 1;