select*from emp;

-- sum : 합계
SELECT SUM(sal), SUM(DISTINCT sal), SUM(ALL sal) FROM emp;

-- count : 개수
SELECT COUNT(*) FROM emp;

-- 부서번호가 30번인 직원 수 구하기
SELECT COUNT(*) FROM emp WHERE deptno = 30;

-- max, min
SELECT MAX(SAL), MIN(SAL) FROM emp;

--부서 번호가 20인 사원의 입사일 중 가장 최근 입사일 구하기
SELECT MAX(hiredate) FROM emp WHERE deptno = 20;

-- AVERAGE
SELECT AVG(SAL) FROM emp;
SELECT AVG(SAL) FROM emp where deptno = 30;

-- 부서별 월급의 평균 GROUP BY : 결과값을 원하는 열로 묶어 출력
SELECT deptno, AVG(SAL) FROM emp GROUP BY deptno;

-- 부서번호별 추가수당 평균 구하기
SELECT deptno, AVG(COMM) FROM emp GROUP BY deptno;

-- 부서번호, 직책별 급여 평균 구하기
SELECT DEPTNO, AVG(SAL), JOB 
FROM emp GROUP BY deptno, job;

SELECT ename, deptno, AVG(sal)
from emp
group by deptno;

-- HAVING : GROUP BY 절에 조건을 줄때 사용