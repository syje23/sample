-- SCOTT ������ ������ �ִ� ��� ���̺� ����
select * from tab;

-- emp ���̺��� ����
DESC emp;


-- emp ���̺��� ��� ���� ��ȸ
SELECT * FROM emp;

-- emp ���̺��� Ư�� �ʵ常 ��ȸ
SELECT ename, job, sal FROM emp;



-- �ߺ� ���ڵ� ������ �� ��ȸ : DISTINCT
SELECT DISTINCT deptno FROM emp;

-- alais(��Ī) : AS
SELECT empno AS �����ȣ FROM emp;

SELECT ename, sal, sal*12+comm AS ����, comm FROM emp;

SELECT ename as ����̸�, job AS "�� å" from emp;

-- ORDER BY : �����Ͽ� ��ȸ

-- �ϳ��� ���� ������ �־� ��������(ASC) ��ȸ
SELECT ename,sal FROM emp ORDER BY sal;

-- �ϳ��� ���� ������ �־� �������� ��ȸ
SELECT ename,sal FROM emp ORDER BY sal DESC;

-- ��ü �����͸� ��ȸ(�����ȣ ��������)
SELECT * FROM emp ORDER BY empno;

-- �μ���ȣ�� ���������̰�, �μ���ȣ�� �����ϴٸ� �޿��� ��������
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;

-- ��µǴ� ���� ��Ī�� ������ ���� �����Ѵ�.
-- EMPNO : EMPLOYEE_NO
-- ENAME : EMPLOYEE_NAME
-- MGR : MANAGER
-- SAL : SALARY
-- COMM : COMMISSION
-- DEPTNO : DEPARTMENT_NO

-- �μ���ȣ�� �������� ������������ �����ϵ� �μ� ��ȣ�� ���ٸ� ��� �̸��� �������� �������� �����Ѵ�.

SELECT empno AS EMPLOYEE_NO, ename AS EMPLOYEE_NAME, job, mgr AS MANAGER,
       hiredate, sal AS SALARY, comm AS COMMISSION, deptno AS DEPARTMENT_NO
FROM emp ORDER BY deptno DESC, ename ASC;

-- WHERE : ��ȸ�� �� �� ���� �ֱ�

-- �μ���ȣ�� 30���� ��� ��ȸ
SELECT * FROM emp WHERE deptno = 30;

-- �����ȣ�� 7782�� ��� ��ȸ
SELECT * FROM emp WHERE empno=7782;

-- �μ���ȣ�� 30�̰�, �����å�� SALESMAN ���� ��ȸ
SELECT * FROM emp WHERE deptno=30 AND job='SALESMAN';

-- �����ȣ�� 7499�̰�, �μ���ȣ�� 30�� ���� ��ȸ
SELECT * FROM emp WHERE empno=7499 AND deptno=30;

-- �μ���ȣ�� 30�̰ų�, �����å�� CLERK ���� ��ȸ
SELECT * FROM emp WHERE deptno=30 OR job='CLERK';

-- �μ���ȣ�� 20�̰ų�, �����å�� SALESMAN ���� ��ȸ
SELECT * FROM emp WHERE deptno=20 OR job='SALESMAN';


-- �����ڸ� �̿��� ��ȸ

-- ��������� : sal*12 �� �ݾ��� 36000 �� ������ ��ȸ
SELECT * FROM emp WHERE sal*12=36000;

-- ���迬���� : >, <, >=, <=
SELECT * FROM emp WHERE sal > 3000;
SELECT * FROM emp WHERE sal >= 3000;

SELECT * FROM emp WHERE ename >= 'F';

-- �������� : AND, OR
-- �޿��� 2500�̻��̰�, ������ ANALYST�� ������� ��ȸ
SELECT * FROM emp WHERE sal >=2500 AND job='ANALYST';

-- ������ MANAGER, SALESMAN, CLERK �� ������� ��ȸ
SELECT * FROM emp WHERE job='MANAGER' OR job='SALESMAN' OR job='CLERK';

-- ������� : ���� �׸��� ������ �˻�

-- SAL�� 3000�� �ƴ� ������� ���
SELECT * FROM emp WHERE sal!=3000;
SELECT * FROM emp WHERE sal<>3000;
SELECT * FROM emp WHERE sal^=3000;

-- IN ������
SELECT * FROM emp WHERE job IN('MANAGER','SALESMAN','CLERK');

SELECT * FROM emp WHERE job!='MANAGER' AND job!='SALESMAN' AND job!='CLERK';
SELECT * FROM emp WHERE job NOT IN('MANAGER','SALESMAN','CLERK');

-- IN �� ����ؼ� �μ���ȣ�� 10,20���� ������� ��ȸ
SELECT * FROM emp WHERE deptno IN(10,20);

-- LIKE : ���ڿ� �˻� ���(s�� �����ϴ� ~~, H�� ������..., ����� T�� ������)
--1) ����̸��� S�� �����ϴ� ��� ������� ��ȸ�ϱ�
SELECT * FROM emp WHERE ename LIKE 'S%';

--2) ��� �̸��� �ι�° ���ڰ� L�� ����� ��ȸ
SELECT * FROM emp WHERE ename LIKE '_L%';

--3) ��� �̸��� AM�� ���ԵǾ� �ִ� ����� ��ȸ
SELECT * FROM emp WHERE ename LIKE '%AM%';

--4) ��� �̸��� AM�� ���ԵǾ� ���� �ʴ� ����� ��ȸ
SELECT * FROM emp WHERE ename NOT LIKE '%AM%';


-- IS NULL
-- SELECT * FROM emp WHERE comm = null; (x)
SELECT * FROM emp WHERE comm IS null;

-- MGR(�Ŵ���ID)�� NULL�� ������� ��ȸ
SELECT * FROM emp WHERE mgr IS null;

-- MGR(�Ŵ���ID)�� NULL�� �ƴ� ������� ��ȸ
SELECT * FROM emp WHERE mgr IS NOT null;

-- ���տ����� : ������(UNION), ������(INTERSECT), ������(MINUS)

-- DEPTNO �� 10�� ���̺� �� DEPTNO �� 20�� ����� ���ؼ� ���ؼ� �����ֱ�
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 20;



SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;


SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION ALL
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;

-- �μ���ȣ�� 10�� �ƴ� ������� ���� ��ȸ
SELECT empno, ename, sal, deptno FROM emp
MINUS
SELECT empno, ename, sal, deptno FROM emp WHERE deptno=10;

-- �μ���ȣ�� 10�� ������� ��ȸ
SELECT empno, ename, sal, deptno FROM emp
INTERSECT
SELECT empno, ename, sal, deptno FROM emp WHERE deptno=10;

-- 20,30�� �μ��� �ٹ��ϰ� �ִ� ��� �� SAL �� 2000 �ʰ��� ����� ���� �ΰ��� 
-- ����� SELECT ���� ����Ͽ�, �����ȣ, �̸�, �޿�, �μ���ȣ�� ����ϴ� 
-- SQL �� �ۼ��ϱ�

-- ���տ����� ������� �ʴ� ���
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno IN(20,30) AND sal>2000;

-- ���տ����ڸ� ����ϴ� ���
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

-- ����Ŭ �Լ�
-- 1) �����Լ� : UPPER, LOWER, INITCAP, LENGTH, LENGTHB

-- ENAME �� UPPER, LOWER, INITCAP���� ��ȯ�Ͽ� ��ȸ
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename)
FROM EMP;

-- DUAL ���̺� �̿�(SYS�� �����ϰ� �ִ� ���̺�� �ӽÿ����̳� �Լ��� �����
-- Ȯ���ϴ� �뵵)

SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�') FROM DUAL;

-- ��å �̸��� 6���� �̻��� ������� ���� ����
SELECT * FROM emp WHERE LENGTH(job) >= 6;

-- ���ڿ� �Լ� : substr
SELECT job, substr(job,1,2), substr(job,3,2), substr(job,5) FROM emp;

-- -LENGTH(JOB) = -5
SELECT job, SUBSTR(job, -LENGTH(JOB)), SUBSTR(job, -LENGTH(JOB),2), SUBSTR(JOB,-3)
FROM emp;

-- ���ڿ� �Լ� : INSTR(Ư������ ��ġ ã��)
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1, 
       INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
       INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
FROM dual;

-- ���ڿ��Լ� : REPLACE(ã�Ƽ� �ٲٱ�)
SELECT REPLACE('�̰��� oracle�̴�','�̰���','This is') 
FROM dual;

SELECT '010-1234-5678' AS REPLACE_BEFORE, 
       REPLACE('010-1234-5678','-',' ') AS REPLACE_1,
       REPLACE('010-1234-5678','-') AS REPLACE_2
FROM dual;

-- ���ڿ� �Լ� : CONCAT(����)
-- empno, ename�� �����Ͽ� ��ȸ
SELECT CONCAT(empno,ename), CONCAT(empno, CONCAT(':',ename))
FROM emp
WHERE ename='SCOTT';

-- || : ������ �ǹ̷� ����

SELECT empno || ename, empno || ':' || ename
FROM emp
WHERE ename='SCOTT';

-- ���ڿ� �Լ� : TRIM(��������), LTRIM(���� ���� ����), RTRIM(������ ���� ����)
SELECT '     �̰���      ', TRIM('     �̰���      ')
FROM dual;

-- ���ڿ� �Լ� : REVERSE
SELECT REVERSE('Oracle') FROM dual;


-- 2. �����Լ� : ROUND(�ݿø�), TRUNC(����), CEIL(�Էµ� ���ڿ� ����� ū ����),
-- FLOOR(�Էµ� ���ڿ� ����� ���� ����), MOD(������)

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

-- 3. ��¥�Լ� : SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP

SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP FROM dual;

-- ��¥�����ʹ� ������ ������ : ��¥������ + 1, -1, ��¥������-��¥������
-- ��¥������ + ��¥�����ʹ� �ȵ�
SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW
FROM DUAL;

-- ��¥�Լ� : ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3) FROM DUAL;

-- �Ի�10�ֳ��� �Ǵ� ����� ��ȸ
SELECT empno, ename, hiredate, ADD_MONTHS(hiredate,120) FROM emp;

-- �Ի�38�� �̸��� ��� ��ȸ
SELECT * FROM emp WHERE ADD_MONTHS(hiredate, 456) > SYSDATE;

-- ��¥�Լ� : MONTHS_BETWEEN(�� ��¥ ������ ����)
SELECT * FROM emp WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) < 456;

SELECT empno, ename, hiredate, SYSDATE,MONTHS_BETWEEN(hiredate,SYSDATE) AS MONTHS1,
MONTHS_BETWEEN(SYSDATE,hiredate) AS MONTHS2, TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate))
FROM emp;

-- ��¥�Լ� : NEXT_DAY, LAST_DAY
SELECT SYSDATE, NEXT_DAY(SYSDATE, '������'), LAST_DAY(SYSDATE)
FROM DUAL;

-- 4. ����ȯ �Լ� : TO_CHAR(��¥,���ڵ����͸� ���ڷ� ��ȯ), 
--                  TO_NUMBER(���ڵ����͸� ���ڷ� ��ȯ)
--                  TO_DATE(���� �����͸� ��¥�� ��ȯ)

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MM') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DAY') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH12:MI:SS') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') AS ���糯¥ FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS AM') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS PM') AS ���糯¥ FROM DUAL;

-- ���ó�¥�� ��/��/�� 16:51:45 ǥ��
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ð� FROM DUAL;


SELECT 1300-TO_NUMBER('1500'), TO_NUMBER('1300')+1500 FROM dual;

-- SELECT TO_NUMBER('1,300')-TO_NUMBER('1,500') FROM DUAL;(x)
-- 9,0 (������ ���ڸ��� �ǹ���), 9 ���ڸ��� ä���� �ʴ� ����, 0 ���ڸ��� ä��� ����

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

-- 1981��6��1�� ���Ŀ� �Ի��� ������� ��ȸ
SELECT *
FROM emp
WHERE hiredate > TO_DATE('1981-06-01','YYYY-MM-DD');

SELECT TO_DATE('2019-12-20')-TO_DATE('2019-10-20') FROM DUAL;


-- ��ó�� �Լ� : NVL, NVL2
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM FROM EMP;
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,NVL(COMM,0), SAL+NVL(COMM,0)
FROM EMP;

SELECT EMPNO, ENAME, SAL, COMM, NVL2(COMM,'O','X'), 
       NVL2(COMM,SAL*12+COMM,SAL*12) AS ANNSAL
FROM EMP;

-- DECODE�Լ��� CASE��
-- job�� manager, salesman, analyst ��쿡 ������ �ٸ� ������ �����ϰ� �ʹٸ�?
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
                            WHEN COMM IS NULL THEN '�ش���׾���'
                            WHEN COMM=0 THEN '�������'
                            WHEN COMM>0 THEN '���� : ' || COMM
                           END AS COMM_TEXT FROM EMP;


/*
    ppt �Լ� ��������
*/
DESC emp;

-- ����� �ٹ��ϼ��� 21.5 ��, DAY_PAY(�Ϸ�޿�) : SAL / 21.5, 
-- TIME_PAY(�ñ�) : SAL/21.5/8

SELECT empno,ename,sal,ROUND((sal/21.5),2) as day_pay, 
       ROUND((sal/21.5/8),1) as time_pay
FROM emp;

-- ������ ���� : HIREDATE + 3 ������ ���� ù ������

SELECT empno,ename,hiredate,NEXT_DAY(ADD_MONTHS(hiredate,3),'������') as R_JOB, 
       NVL(TO_CHAR(comm),'N/A') AS COMM
FROM emp;

-- EMP ���̺��� ���ӻ�� �����ȣ

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
