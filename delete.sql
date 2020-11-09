CREATE TABLE EMP_TEMP2 AS SELECT * FROM emp;

SELECT * FROM EMP_TEMP2;

-- JOB 이 MANAGER 인 데이터 삭제하기
DELETE FROM emp_temp2 WHERE JOB = 'MANAGER';
ROLLBACK;

-- 실습
CREATE TABLE exam_emp AS SELECT * FROM emp WHERE 1<>1;
CREATE TABLE exam_dept AS SELECT * FROM dept;
CREATE TABLE exam_salgrade AS SELECT * FROM salgrade;

SELECT * FROM exam_emp;
SELECT * FROM exam_dept;
SELECT * FROM exam_salgrade;

INSERT INTO exam_emp VALUES (7201, 'TEST_USER1', 'MANAGER', 7788, '2016-01-02', 4500, NULL, 50);
INSERT INTO exam_emp VALUES (7202, 'TEST_USER2', 'CLERK', 7201, '2016-02-21', 1800, NULL, 50);
INSERT INTO exam_emp VALUES (7203, 'TEST_USER3', 'ANALYST', 7201, '2016-04-11', 3400, NULL, 60);
INSERT INTO exam_emp VALUES (7204, 'TEST_USER4', 'SALESMAN', 7201, '2016-05-31', 2700, 300, 60);
INSERT INTO exam_emp VALUES (7205, 'TEST_USER5', 'CLERK', 7201, '2016-07-20', 2600, NULL, 70);
INSERT INTO exam_emp VALUES (7206, 'TEST_USER6', 'CLERK', 7201, '2016-09-08', 2600, NULL, 70);
INSERT INTO exam_emp VALUES (7207, 'TEST_USER7', 'LECTURER', 7201, '2016-10-28', 2300, NULL, 80);
INSERT INTO exam_emp VALUES (7208, 'TEST_USER8', 'STUDENT', 7201, '2016-03-09', 1200, NULL, 80);

-- EXAM_EMP 사원 중 50번 부서에서 근무하는 사원의 평균 급여보다 많은 급여 받고 있는 사원들 70번 부서로 옮기기
UPDATE exam_emp
SET deptno = 70
WHERE deptno = 50 AND sal > AVG