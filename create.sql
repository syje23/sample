CREATE TABLE TEST(
    ID NUMBER(4),
    NAME VARCHAR2(3));
DESC TEST;
ROLLBACK;

-- 한글은 글자 당 2byte / 영어는 글자 당 1byte
INSERT INTO test VALUES (1000, '홍길동');

-- 언어마다 서로 다른 byte 처리 보완위해 nchar, nvarchar2 있음
DROP TABLE test2;

-- NCHAR, NVARCHAR2 차이 : 고정된 길이를 항상 가지고 있냐 아니냐 차이
-- NCHAR 는 글자가 1개만 입력 되도 4자리를 항상 유지 (메모리 따지면 NVARCHAR가 나음)
CREATE TABLE TEST2(
    ID nCHAR(4),
    NAME NVARCHAR2(3));

INSERT INTO test2 VALUES ('황보강성', '홍길동');

CREATE TABLE TEST3(
    ID NVARCHAR2(4),
    NAME NVARCHAR2(4),
    REG_DATE date);
    
INSERT INTO test3 VALUES ('황보강성', '홍길동', SYSDATE);
INSERT INTO test3 VALUES ('황보강성', '홍길동', '2020-11-09');

-- 테이블 생성하기
-- CREATE TABLE 테이블 명 ( 열이름 타입, ....);
-- CREATE TABLE 테이블 명 AS SELECT * FROM EMP;
-- CREATE TABLE 테이블 명 AS SELECT * FROM EMP WHERE DEPTNO = 20;
-- CREATE TABLE 테이블 명 AS SELECT * FROM EMP WHERE 1<>1;

DESC EMP;

CREATE TABLE EMP_DDL (
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2), -- 전체 자리수 7자리(소수점 2자리 포함)
    COMM NUMBER(7,2), -- 12345.78 형식으로
    DEPTNO NUMBER(2));
    
-- ALTER : 테이블 변경

-- 컬럼 추가
ALTER TABLE emp_ddl ADD hp VARCHAR2(20);

-- 기존 컬럼명 변경
ALTER TABLE emp_ddl RENAME COLUMN HP TO TEL;

-- 기존 타입 변경
ALTER TABLE emp_ddl MODIFY EMPNO NUMBER(5);

-- 기존 컬럼 삭제
ALTER TABLE emp_ddl DROP COLUMN TEL;

-- 테이블 명 변경
RENAME emp_ddl TO EMP_RENAME;

DESC EMP_RENAME;

-- 실습1 MEMBER 테이블
CREATE TABLE member (
    id NCHAR(8),
    name NVARCHAR2(10),
    addr NVARCHAR2(50),
    nation NCHAR(4),
    email VARCHAR2(50),
    age NUMBER(7,2));
    
ALTER TABLE member ADD bigo VARCHAR(20);
ALTER TABLE member MODIFY BIGO VARCHAR(30);
ALTER TABLE member RENAME COLUMN BIGO TO REMARK; 

DESC MEMBER;