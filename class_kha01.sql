# 데이터 베이스 
# 데이터 베이스 생성하기
CREATE DATABASE employeedb;

# 생성한 데이터 베이스 확인하기
SHOW DATABASES;

# 데이터 베이스 삭제하기 
DROP DATABASE employeedb;

# 테이블 
# 테이블 생성하기
USE employeedb;
CREATE TABLE employeetbl(
	emplId int not null AUTO_INCREMENT,
	emplName char(3) not null,
    deptNum int,
    PRIMARY KEY(emplId)
);

# 테이블 필드 조회하기 
DESC employeetbl;

# 테이블 데이터 조회하기 
SELECT * FROM employeetbl;

# 테이블 필드 삭제하기
ALTER TABLE employeetbl DROP deptNum;

# 테이블 필드 수정하기 
ALTER TABLE employeetbl MODIFY emplName char(5);

# 테이블 삭제하기 
DROP TABLE employeetbl;

# Create
INSERT INTO employeetbl VALUES(1, '홍길동', 60);
INSERT INTO employeetbl(emplName, deptNum) VALUES('박철수', 61);
INSERT INTO employeetbl(emplName, deptNum) VALUES('김주미', 60);
INSERT INTO employeetbl(emplName, deptNum) VALUES('정정민', 62);
INSERT INTO employeetbl(emplName, deptNum) VALUES('최진비', 61);

# Read
SELECT * FROM employeetbl;
SELECT * FROM employeetbl WHERE deptNum = 60;
SELECT emplId, emplName FROM employeetbl WHERE deptNum = 61;

# Update
UPDATE employeetbl set emplName = '홍길둥' where emplId = 1;

# Delete
DELETE FROM employeetbl;
DELETE FROM employeetbl where emplId = 1;