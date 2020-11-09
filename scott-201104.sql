-- SCOTT 계정이 가지고 있는 모든 테이블 보기
select * from tab;

-- emp 테이블의 구조
DESC emp;


-- emp 테이블의 모든 내용 조회
SELECT * FROM emp;

-- emp 테이블의 특정 필드만 조회
SELECT ename, job, sal FROM emp;



-- 중복 레코드 제거한 후 조회 : DISTINCT
SELECT DISTINCT deptno FROM emp;

-- alais(별칭) : AS
SELECT empno AS 사원번호 FROM emp;

SELECT ename, sal, sal*12+comm AS 연봉, comm FROM emp;

SELECT ename as 사원이름, job AS "직 책" from emp;

-- ORDER BY : 정렬하여 조회

-- 하나의 열로 기준을 주어 오름차순(ASC) 조회
SELECT ename,sal FROM emp ORDER BY sal;

-- 하나의 열로 기준을 주어 내림차순 조회
SELECT ename,sal FROM emp ORDER BY sal DESC;

-- 전체 데이터를 조회(사원번호 오름차순)
SELECT * FROM emp ORDER BY empno;

-- 부서번호의 오름차순이고, 부서번호가 동일하다면 급여의 내림차순
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;

-- 출력되는 열의 별칭을 다음과 같이 지정한다.
-- EMPNO : EMPLOYEE_NO
-- ENAME : EMPLOYEE_NAME
-- MGR : MANAGER
-- SAL : SALARY
-- COMM : COMMISSION
-- DEPTNO : DEPARTMENT_NO

-- 부서번호를 기준으로 내림차순으로 정렬하되 부서 번호가 같다면 사원 이름을 기준으로 오름차순 정렬한다.

SELECT empno AS EMPLOYEE_NO, ename AS EMPLOYEE_NAME, job, mgr AS MANAGER,
       hiredate, sal AS SALARY, comm AS COMMISSION, deptno AS DEPARTMENT_NO
FROM emp ORDER BY deptno DESC, ename ASC;

-- WHERE : 조회를 할 때 기준 주기

-- 부서번호가 30번인 사원 조회
SELECT * FROM emp WHERE deptno = 30;

-- 사원번호가 7782인 사원 조회
SELECT * FROM emp WHERE empno=7782;

-- 부서번호가 30이고, 사원직책이 SALESMAN 정보 조회
SELECT * FROM emp WHERE deptno=30 AND job='SALESMAN';

-- 사원번호가 7499이고, 부서번호가 30인 정보 조회
SELECT * FROM emp WHERE empno=7499 AND deptno=30;

-- 부서번호가 30이거나, 사원직책이 CLERK 정보 조회
SELECT * FROM emp WHERE deptno=30 OR job='CLERK';

-- 부서번호가 20이거나, 사원직책이 SALESMAN 정보 조회
SELECT * FROM emp WHERE deptno=20 OR job='SALESMAN';


-- 연산자를 이용한 조회

-- 산술연산자 : sal*12 한 금액이 36000 인 데이터 조회
SELECT * FROM emp WHERE sal*12=36000;

-- 관계연산자 : >, <, >=, <=
SELECT * FROM emp WHERE sal > 3000;
SELECT * FROM emp WHERE sal >= 3000;

SELECT * FROM emp WHERE ename >= 'F';

-- 논리연산자 : AND, OR
-- 급여가 2500이상이고, 직업이 ANALYST인 사원정보 조회
SELECT * FROM emp WHERE sal >=2500 AND job='ANALYST';

-- 직무가 MANAGER, SALESMAN, CLERK 인 사원정보 조회
SELECT * FROM emp WHERE job='MANAGER' OR job='SALESMAN' OR job='CLERK';

-- 등가연산자 : 양쪽 항목이 같은지 검사

-- SAL이 3000이 아닌 사원정보 출력
SELECT * FROM emp WHERE sal!=3000;
SELECT * FROM emp WHERE sal<>3000;
SELECT * FROM emp WHERE sal^=3000;

-- IN 연산자
SELECT * FROM emp WHERE job IN('MANAGER','SALESMAN','CLERK');

SELECT * FROM emp WHERE job!='MANAGER' AND job!='SALESMAN' AND job!='CLERK';
SELECT * FROM emp WHERE job NOT IN('MANAGER','SALESMAN','CLERK');

-- IN 을 사용해서 부서번호가 10,20번인 사원정보 조회
SELECT * FROM emp WHERE deptno IN(10,20);

-- LIKE : 문자열 검색 사용(s로 시작하는 ~~, H로 끝나는..., 가운데에 T가 있으면)
--1) 사원이름이 S로 시작하는 모든 사원정보 조회하기
SELECT * FROM emp WHERE ename LIKE 'S%';

--2) 사원 이름의 두번째 글자가 L인 사원만 조회
SELECT * FROM emp WHERE ename LIKE '_L%';

--3) 사원 이름에 AM이 포함되어 있는 사원만 조회
SELECT * FROM emp WHERE ename LIKE '%AM%';

--4) 사원 이름에 AM이 포함되어 있지 않는 사원만 조회
SELECT * FROM emp WHERE ename NOT LIKE '%AM%';


-- IS NULL
-- SELECT * FROM emp WHERE comm = null; (x)
SELECT * FROM emp WHERE comm IS null;

-- MGR(매니저ID)이 NULL인 사원정보 조회
SELECT * FROM emp WHERE mgr IS null;

-- MGR(매니저ID)이 NULL이 아닌 사원정보 조회
SELECT * FROM emp WHERE mgr IS NOT null;

-- 집합연산자 : 합집합(UNION), 교집합(INTERSECT), 차집합(MINUS)

-- DEPTNO 가 10인 테이블 과 DEPTNO 가 20인 결과를 구해서 합해서 보여주기
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 20;



SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;


SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION ALL
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;

-- 부서번호가 10이 아닌 사원들의 정보 조회
SELECT empno, ename, sal, deptno FROM emp
MINUS
SELECT empno, ename, sal, deptno FROM emp WHERE deptno=10;

-- 부서번호가 10인 사원정보 조회
SELECT empno, ename, sal, deptno FROM emp
INTERSECT
SELECT empno, ename, sal, deptno FROM emp WHERE deptno=10;

-- 20,30번 부서에 근무하고 있는 사원 중 SAL 이 2000 초과인 사원을 다음 두가지 
-- 방식의 SELECT 문을 사용하여, 사원번호, 이름, 급여, 부서번호를 출력하는 
-- SQL 문 작성하기

-- 집합연산자 사용하지 않는 방식
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno IN(20,30) AND sal>2000;

-- 집합연산자를 사용하는 방식
SELECT empno, ename, sal, deptno
FROM emp
WHERE sal>2000
MINUS
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 10;


SELECT empno, ename, sal, deptno
FROM emp
WHERE sal>2000 AND deptno=20
UNION
SELECT empno, ename, sal, deptno
FROM emp
WHERE sal>2000 AND deptno=30;

-- 오라클 함수
-- 1) 문자함수 : UPPER, LOWER, INITCAP, LENGTH, LENGTHB

-- ENAME 을 UPPER, LOWER, INITCAP으로 변환하여 조회
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename)
FROM EMP;

-- DUAL 테이블 이용(SYS가 소유하고 있는 테이블로 임시연산이나 함수의 결과값
-- 확인하는 용도)

SELECT LENGTH('한글'), LENGTHB('한글') FROM DUAL;

-- 직책 이름이 6글자 이상인 사원들의 정보 추출
SELECT * FROM emp WHERE LENGTH(job) >= 6;

-- 문자열 함수 : substr
SELECT job, substr(job,1,2), substr(job,3,2), substr(job,5) FROM emp;

-- -LENGTH(JOB) = -5
SELECT job, SUBSTR(job, -LENGTH(JOB)), SUBSTR(job, -LENGTH(JOB),2), SUBSTR(JOB,-3)
FROM emp;

-- 문자열 함수 : INSTR(특정문자 위치 찾기)
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1, 
       INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
       INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
FROM dual;

-- 문자열함수 : REPLACE(찾아서 바꾸기)
SELECT REPLACE('이것이 oracle이다','이것이','This is') 
FROM dual;

SELECT '010-1234-5678' AS REPLACE_BEFORE, 
       REPLACE('010-1234-5678','-',' ') AS REPLACE_1,
       REPLACE('010-1234-5678','-') AS REPLACE_2
FROM dual;

-- 문자열 함수 : CONCAT(연결)
-- empno, ename을 연결하여 조회
SELECT CONCAT(empno,ename), CONCAT(empno, CONCAT(':',ename))
FROM emp
WHERE ename='SCOTT';

-- || : 연결의 의미로 사용됨

SELECT empno || ename, empno || ':' || ename
FROM emp
WHERE ename='SCOTT';

-- 문자열 함수 : TRIM(공백제거), LTRIM(왼쪽 공백 제거), RTRIM(오른쪽 공백 제거)
SELECT '     이것이      ', TRIM('     이것이      ')
FROM dual;

-- 문자열 함수 : REVERSE
SELECT REVERSE('Oracle') FROM dual;


-- 2. 숫자함수 : ROUND(반올림), TRUNC(버림), CEIL(입력된 숫자와 가까운 큰 정수),
-- FLOOR(입력된 숫자와 가까운 작은 정수), MOD(나머지)

SELECT ROUND(1234.5678) AS ROUND,
       ROUND(1234.5678,0) AS ROUND_1,
       ROUND(1234.5678,1) AS ROUND_2,
       ROUND(1234.5678,-1) AS ROUND_MINUS,
       ROUND(1234.5678,-2) AS ROUND_MINUS2
FROM dual;


SELECT TRUNC(1234.5678) AS TRUNC,
       TRUNC(1234.5678,0) AS TRUNC_1,
       TRUNC(1234.5678,1) AS TRUNC_2,
       TRUNC(1234.5678,-1) AS TRUNC_MINUS,
       TRUNC(1234.5678,-2) AS TRUNC_MINUS2
FROM dual;

SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14)
FROM dual;

SELECT MOD(15,6), MOD(10,2), MOD(11,2) FROM dual;

-- 3. 날짜함수 : SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP

SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP FROM dual;

-- 날짜데이터는 연산이 가능함 : 날짜데이터 + 1, -1, 날짜데이터-날짜데이터
-- 날짜데이터 + 날짜데이터는 안됨
SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW
FROM DUAL;

-- 날짜함수 : ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3) FROM DUAL;

-- 입사10주년이 되는 사원들 조회
SELECT empno, ename, hiredate, ADD_MONTHS(hiredate,120) FROM emp;

-- 입사38년 미만인 사원 조회
SELECT * FROM emp WHERE ADD_MONTHS(hiredate, 456) > SYSDATE;

-- 날짜함수 : MONTHS_BETWEEN(두 날짜 사이의 차이)
SELECT * FROM emp WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) < 456;

SELECT empno, ename, hiredate, SYSDATE,MONTHS_BETWEEN(hiredate,SYSDATE) AS MONTHS1,
MONTHS_BETWEEN(SYSDATE,hiredate) AS MONTHS2, TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate))
FROM emp;

-- 날짜함수 : NEXT_DAY, LAST_DAY
SELECT SYSDATE, NEXT_DAY(SYSDATE, '월요일'), LAST_DAY(SYSDATE)
FROM DUAL;

-- 4. 형변환 함수 : TO_CHAR(날짜,숫자데이터를 문자로 변환), 
--                  TO_NUMBER(문자데이터를 숫자로 변환)
--                  TO_DATE(문자 데이터를 날짜로 변환)

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MM') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DAY') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH12:MI:SS') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') AS 현재날짜 FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS AM') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS PM') AS 현재날짜 FROM DUAL;

-- 오늘날짜를 년/월/일 16:51:45 표현
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간 FROM DUAL;


SELECT 1300-TO_NUMBER('1500'), TO_NUMBER('1300')+1500 FROM dual;

-- SELECT TO_NUMBER('1,300')-TO_NUMBER('1,500') FROM DUAL;(x)
-- 9,0 (숫자의 한자리를 의미함), 9 빈자리를 채우지 않는 형태, 0 빈자리를 채우는 형태

SELECT TO_NUMBER('1,300,000','999,999,999') - TO_NUMBER('1,500','999,999') FROM dual;

SELECT SAL, TO_CHAR(SAL, '$999,999') AS SAL_$,
       TO_CHAR(SAL, 'L999,999') AS SAL_L,
       TO_CHAR(SAL, '$999,999.00') AS SAL_1,      
       TO_CHAR(SAL, '000,999,999.00') AS SAL_2, 
       TO_CHAR(SAL, '000999999.99') AS SAL_3,
       TO_CHAR(SAL, '999,999,00') AS SAL_4
FROM EMP;

SELECT TO_DATE('2020-11-05','YYYY/MM/DD') AS TODATE1,
       TO_DATE('20201105', 'YYYY-MM-DD') AS TODATE2 FROM DUAL;

-- 1981년6월1일 이후에 입사한 사원정보 조회
SELECT *
FROM emp
WHERE hiredate > TO_DATE('1981-06-01','YYYY-MM-DD');

SELECT TO_DATE('2019-12-20')-TO_DATE('2019-10-20') FROM DUAL;


-- 널처리 함수 : NVL, NVL2
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM FROM EMP;
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,NVL(COMM,0), SAL+NVL(COMM,0)
FROM EMP;

SELECT EMPNO, ENAME, SAL, COMM, NVL2(COMM,'O','X'), 
       NVL2(COMM,SAL*12+COMM,SAL*12) AS ANNSAL
FROM EMP;

-- DECODE함수와 CASE문
-- job이 manager, salesman, analyst 경우에 각각의 다른 비율을 적용하고 싶다면?
SELECT empno,ename,job,sal,DECODE(JOB,
                                  'MANAGER', SAL*1.1,
                                  'SALESMAN',SAL*1.05,
                                  'ANALYST',SAL,
                                  SAL*1.03) AS UPSAL             
FROM EMP;

SELECT empno,ename,job,sal,CASE JOB
                               WHEN 'MANAGER'  THEN SAL*1.1
                               WHEN 'SALESMAN' THEN SAL*1.05
                               WHEN 'ANALYST' THEN SAL
                               ELSE  SAL*1.03
                           END AS UPSAL             
FROM EMP;

SELECT empno,ename,job,sal,CASE
                            WHEN COMM IS NULL THEN '해당사항없음'
                            WHEN COMM=0 THEN '수당없음'
                            WHEN COMM>0 THEN '수당 : ' || COMM
                           END AS COMM_TEXT FROM EMP;


/*
    ppt 함수 연습문제
*/
DESC emp;

-- 월평균 근무일수는 21.5 일, DAY_PAY(하루급여) : SAL / 21.5, 
-- TIME_PAY(시급) : SAL/21.5/8

SELECT empno,ename,sal,ROUND((sal/21.5),2) as day_pay, 
       ROUND((sal/21.5/8),1) as time_pay
FROM emp;

-- 정직원 기준 : HIREDATE + 3 개월이 지난 첫 월요일

SELECT empno,ename,hiredate,NEXT_DAY(ADD_MONTHS(hiredate,3),'월요일') as R_JOB, 
       NVL(TO_CHAR(comm),'N/A') AS COMM
FROM emp;

-- EMP 테이블의 직속상관 사원번호

SELECT SUBSTR(TO_CHAR(mgr),1,2) FROM EMP;

SELECT empno,ename,mgr,
       DECODE(SUBSTR(TO_CHAR(mgr),1,2),
            null, '0000',
            '75', '5555',
            '76', '6666',
            '77', '7777',
            '78', '8888',
            TO_CHAR(mgr)) AS CHG_MGR
FROM emp;
