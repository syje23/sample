-- 회원가입, 게시글 등록, 입금 등

-- 기존의 dept 테이블 복사해서 dept_temp 테이블 생성
CREATE TABLE dept_temp AS SELECT * FROM dept;

-- 현재 테이블 조회
SELECT *
FROM DEPT_TEMP;

-- 데이터 추가하기(방법1)
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)
VALUES(50, 'DATABASE', 'SEOUL');

-- 데이터 추가하기(방법2) / **순서 무조건 지켜야함
INSERT INTO dept_temp VALUES (60, 'NETWORK', 'BUSAN');

-- NULL 삽입 / 명시적으로
INSERT INTO dept_temp(DEPTNO, DNAME, LOC) VALUES (70, 'DATABASE', NULL);
INSERT INTO dept_temp(DEPTNO, DNAME, LOC) VALUES (80, 'MOBILE', '');

-- NULL 삽입 / 묵시적으로
INSERT INTO dept_temp(DEPTNO, LOC) VALUES (70, 'INCHEON');

-- EMP테이블을 복사하여 EMP_TEMP 테이블 생성
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP;

-- 테이블 삭제
DROP TABLE EMP_TEMP;

-- 테이블 구조만 복사하기
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP WHERE 1<>1;
SELECT * FROM EMP_TEMP;

DESC EMP_TEMP;
INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (9999, '홍길동', 'PRESIDENT', NULL, '2020-11-09', 4000, NULL, 10);
INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (8888, '성춘향', 'MANAGER', NULL, '2020-10-08', 3000, NULL, 10);

-- 최종 반영
COMMIT;

INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (7777, '유승호', 'MANAGER', NULL, TO_DATE('07/01/2020','DD/MM/YYYY'), 4000, NULL, 20);

INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (6666, '이순신', 'MANAGER', NULL, SYSDATE, 4000, NULL, 20);

-- EMP 테이블에서 SALGRADE 테이블을 참조하여 급여 1등급 사원을 EMP_TEMP 테이블에 추가
-- 서브쿼리로 작성하기 (**데이터가 추가되는 테이블의 열 개수와 서브쿼리의 열 개수가 일치해야함!)
INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp E, salgrade S
WHERE e.sal BETWEEN s.losal AND s.hisal AND s.grade = 1;