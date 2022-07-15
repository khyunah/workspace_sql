# 서브 쿼리 

# 서브쿼리 종류 
/*
	1. 중첩 서브쿼리 : WHERE 절에 사용하는 쿼리 
    2. 인라인 뷰 : FROM 절에 사용하는 쿼리
    3. 스칼라 : SELECT 절에 사용하는 쿼리 ( 부화가 심해서 속도가 느릴수 있다. )
    
    * 보더 테이블과 연관된 댓글에 정보를 가지고 오기 위해서는 어떤 서브쿼리??
*/

USE blog;
SELECT * FROM reply;

# 서브쿼리 사용하는 이유
/*
	서브쿼리를 사용하면 다음과 같은 장점을 얻을 수 있다. 
    1. 서브쿼리는 쿼리를 구조화 시키므로, 쿼리에 각 부분을 명확히 구분할 수 있게 해준다. 
    2. 서브쿼리는 복잡한 JOIN 이나 UNION 과 같은 동작을 수행할때 또 다른 방법을 제공해준다. 
    3. 서브쿼리는 복잡한 JOIN 이나 UNION 보다 가독성이 높다. 
*/

# 스프링에서는 JPA 가지고 올수 있는 데이터 타입 ( 영속성 컨텍스트가 관리하는 녀석 = 기본데이터 타입 + RESPOSICTORY의 <해당테이블> 

SELECT *, COUNT(*) AS 'abc' FROM board;

-- join 1
SELECT * FROM board AS a
INNER JOIN reply AS b
ON a.id = b.id
WHERE a.id = 1
ORDER BY b.boardId DESC;

-- board에 있는 댓글 갯수를 표시해주세요.
-- board에 대한 정보 모두 + 댓글 개수 
select a.*, (select count(*) 
				from reply as b 
                where a.id = b.boardId) as '댓글 개수' 
from board as a;
