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
-- 부서번호, 직책, 부서별 직책 평균 급여
SELECT deptno, job, AVG(sal)
FROM emp
GROUP BY deptno, job HAVING avg(sal) >= 500;

-- 그룹바이절 들어갈때 웨어절 먼저 실행된다!!
SELECT deptno, job, AVG(sal)
FROM emp
WHERE sal <= 3000
GROUP BY deptno, job HAVING AVG(sal) >= 2000
ORDER BY deptno, job;

-- 실습1
SELECT deptno, ROUND(AVG(sal),0), MAX(sal), MIN(sal), COUNT(deptno)
FROM emp
GROUP BY deptno
ORDER BY deptno DESC;

select deptno, floor(avg(sal)) as avg_sal, max(sal) as max_sal,
            min(sal) as min_sal, count(empno) as cnt
from emp
group by deptno;

--실습2
SELECT job, COUNT(job)
FROM emp
GROUP BY job having count(job) >=3;

--실습3
SELECT TO_CHAR(hiredate, 'YYYY') AS hire_year, deptno,
            COUNT(*) AS CNT
FROM emp
GROUP BY DEPTNO, TO_CHAR(hiredate,'YYYY')
ORDER BY TO_CHAR(hiredate, 'YYYY') DESC;

-- JOIN 
SELECT * FROM tab;
SELECT * FROM dept;
SELECT * FROM emp;
SELECT * FROM salgrade;
SELECT * FROM bonus;

-- 나올 수 있는 모든 조합 조회
SELECT*FROM emp, dept ORDER BY empno;

-- 1. 내부조인(등가조인)
SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno --조인의 기준
ORDER BY empno;

SELECT *
FROM emp E, dept D -- 별칭 붙이기
WHERE E.deptno = D.deptno --조인의 기준
ORDER BY empno;

SELECT * 
FROM emp INNER JOIN dept
ON emp.deptno = dept.deptno
ORDER BY empno;

-- 두 테이블에 같은 이름 필드가 존재하는 경우 / 어느 테이블 필드인지 정확히 명시
SELECT empno, ename, job, d.deptno, dname 
FROM emp E INNER JOIN dept D
ON E.deptno = D.deptno
ORDER BY empno;

-- EMP테이블과 DEPT테이블 조인하여 ENPNO, ENAME, SAL, DEPTNO, DNAME, LOC 조회 / 급여 3000 이상 사원 출력
SELECT  e.empno, e.ename, e.sal, d.deptno, d.dname, d.Loc
FROM emp E, dept D
WHERE e.deptno = d.deptno AND e.sal >= 3000;

-- emp 테이블의 별칭을 e로 dept 테이블 별칭 d로 / 급여 2500이하 / 사원번호 9999 이하인 사원
SELECT e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc
FROM emp E, dept D
WHERE e.deptno = d.deptno AND e.sal <= 2500 AND e.empno <= 9999;

-- emp 별칭 e, salgrade 별칭 s / 
SELECT *
FROM emp e, salgrade s
WHERE e.sal BETWEEN s.losal and s.hisal;

--2. 셀프조인(자체조인) : 조인 테이블이 자기 테이블일때
SELECT e1.empno, e1.ename, e1.mgr, e2.empno as MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

--3. OUTER JOIN(외부조인) : 조건을 만족하지 않는 데이터 추출
-- LEFT OUTER JOIN / 기준 왼쪽
SELECT e1.empno, e1.ename, e1.mgr, e2.empno as MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 LEFT OUTER JOIN EMP E2 ON e1.mgr = E2.EMPNO;

SELECT e1.empno, e1.ename, e1.mgr, e2.empno as MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);

-- RIGHT OUTER JOIN / 기준 오른쪽
SELECT e1.empno, e1.ename, e1.mgr, e2.empno as MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON e1.mgr = E2.EMPNO;

SELECT e1.empno, e1.ename, e1.mgr, e2.empno as MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO;

-- 실습1
SELECT e.deptno, d.dname, e.empno, e.ename, e.sal
FROM emp E, dept D
WHERE e.deptno = d.deptno AND e.sal > 2000
ORDER BY e.deptno, d.dname;

SELECT e.deptno, d.dname, e.empno, e.ename, e.sal
FROM emp E INNER JOIN dept D ON e.deptno = d.deptno 
WHERE e.sal > 2000
ORDER BY e.deptno, d.dname;

-- 실습2
SELECT e.deptno, d.dname, FLOOR(AVG(e.sal)) AS AVG_SAL, MAX(e.sal) AS MAX_SAL, MIN(e.sal) AS MIN_SAL, COUNT(d.dname)
FROM emp E, dept D
where e.deptno = d.deptno
GROUP BY e.deptno, d.dname
order by e.deptno;

-- 실습 3
SELECT e.deptno, d.dname, e.empno, e.ename, e.job, e.sal
FROM emp E, dept D
WHERE e.deptno = d.deptno
ORDER BY e.deptno, d.dname;

-- 실습 4
SELECT d1.deptno, d1.dname, e1.empno, e1.ename, e1.mgr, e1.sal, e1.deptno,
             s.losal, s.hisal, s.grade, e2.empno as mgr_empno, e2.ename as mgr_ename
FROM emp E1, dept d1, salgrade s, emp e2
WHERE e1.deptno(+) = d1.deptno and e1.sal between s.losal(+) and s.hisal(+) and e1.mgr = e2.empno(+)
ORDER BY e1.deptno;