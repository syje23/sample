-- 존스의 급여보다 높은 급여를 받는 사원
SELECT * FROM emp;

-- 존스의 급여 알아내기
SELECT sal FROM emp WHERE ename= 'JONES';

-- 높은 급여 사원 출력하기
SELECT * FROM emp WHERE sal > 2975;

-- 서브쿼리 : 쿼리문 안에 다른 쿼리문을 포함하고 있는 상태
-- 단일행 서브쿼리
SELECT * FROM emp WHERE sal > (SELECT sal FROM emp WHERE ename = 'JONES');

-- 사원 이름이 allen 인 사원의 추가 수당 보다 많이 받는 사원
SELECT * FROM emp WHERE comm > (SELECT comm FROM emp WHERE ename = 'ALLEN');

-- 사원 이름이 WARD 인 사원의 입사일 보다 빨리 입사한 사원
SELECT * FROM emp WHERE hiredate < (SELECT hiredate FROM emp WHERE ename = 'WARD');

-- 20번 부서에 속한 사원 중 전체 사원 평균 급여보다 높은 급여 받는 사원
SELECT * FROM emp WHERE deptno = 20 AND sal > (SELECT AVG(sal) FROM emp);

-- 20번 부서에 속한 사원 중 전체 사원 평균 급여보다 높은 급여 받는 사원/ 부서명, 지역 위치 출력
SELECT e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc
FROM emp E, dept D
WHERE e.deptno = d.deptno AND d.deptno = 20 AND e.sal > (SELECT AVG(e.sal) FROM emp);

-- 다중행 서브쿼리

-- 서브쿼리 결과가 2개 이상 나오는 경우, 단일행 서브쿼리의 연산자 사용불가
-- 단일행 하위질의에 2개이상의 행이 리턴되었습니다.

-- IN
SELECT * FROM emp WHERE sal IN (SELECT MAX(sal) FROM emp GROUP BY deptno);
-- ANY(SOME)
SELECT * FROM emp WHERE sal = ANY (SELECT MAX(sal) FROM emp GROUP BY deptno);

-- 30번 부서 사원들의 최대 급여보다 적은 급여를 받는 사람 출력
SELECT * FROM emp WHERE sal < ANY (SELECT MAX(sal) FROM emp WHERE deptno = 30);
SELECT * FROM emp WHERE sal < ANY (SELECT sal FROM emp WHERE deptno = 30);
SELECT DISTINCT sal FROM emp WHERE Deptno = 30;

-- ALL : 서브쿼리 결과 모두 만족하는 메인쿼리 추출할때
SELECT * FROM emp WHERE sal < ALL (SELECT sal FROM emp WHERE deptno = 30);

--EXISTS : IN 과 비슷한 개념, 단 IN보다 성능 우수
SELECT empno, deptno
FROM emp
WHERE EXISTS (SELECT 1 
                        FROM dept 
                        WHERE deptno IN (20,30) AND emp.deptno = dept.deptno);
                        
-- 실습1
-- 전체 사원중 ALLEN과 같은 직책인 사원들의 사원정보, 부서정보 출력
SELECT e.job, e.empno, e.ename, e.sal, d.deptno, d.dname
FROM emp E, dept D
WHERE d.deptno = d.deptno AND e.job IN (SELECT JOB FROM emp WHERE ename = 'ALLEN');

-- 사원 평균 급여보다 높은 급여 받는 사원들의 사원정보, 부서정보, 급여 등급 정보 출력
SELECT e.empno, e.ename, d.dname, e.hiredate, d.loc, e.sal, s.grade
FROM emp E, salgrade S, dept D
WHERE e.deptno = d.deptno AND e.sal BETWEEN s.losal and s.hisal AND e.sal > (SELECT AVG(sal) FROM emp)
ORDER BY e.sal DESC, e.empno;

-- 다중 열 서브쿼리 : 서브쿼리의 SELECT 문에 비교할 컬럼이 여러개 나오는 방식
SELECT * FROM emp WHERE (deptno, sal) IN
                        (SELECT deptno, MAX(sal) FROM emp GROUP BY deptno);
                        
-- FROM 절에 사용하는 서브 쿼리 (인라인 뷰)
SELECT e.empno, e.ename, d.deptno, d.dname, d.loc
FROM (SELECT * FROM emp WHERE deptno = 10) E, (SELECT * FROM dept) D
WHERE e.deptno = d.deptno;

-- 실습 1 / 10번 부서에 근무하는 사원 중 30번 부서에 존재하지 않는 직책 가진 사원정보, 부서정보 출력
SELECT e.empno, e.ename, e.job, d.deptno, d.dname, d.loc
FROM emp E, dept D
WHERE e.deptno = d.deptno AND e.job NOT IN (SELECT DISTINCT job FROM emp WHERE deptno = 30)
            AND e.deptno = 10;
            
-- 실습2 / 직책이 salesman인 사람들의 최고 급여보다 높은 급여 받는 사원들 정보
-- 서브쿼리 활용 시 다중행 함수 사용 방법과 사용하지 않는 방법 통해 사원번호 기준으로 오름차순 정렬
SELECT empno, ename, sal
FROM emp
WHERE sal > (SELECT MAX(sal) FROM emp WHERE JOB = 'SALESMAN');
-- (다중행 사용)
SELECT empno, ename, sal
FROM emp
WHERE sal > ALL (SELECT sal FROM emp WHERE JOB = 'SALESMAN');