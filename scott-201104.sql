-- HR ������ ������ �ִ� ��� ���̺� ����
select * from tab;

desc emp;

select*from emp;

select*from emp where sal >= 2500 and job = 'ANALYST';

SELECT*FROM     emp WHERE sal != 3000;
SELECT*FROM emp WHERE sal<>3000;
SELECT*FROM emp WHERE sal^=3000;

SELECT*FROM emp where sal != 2500; and sal !=3500; and sal != 7000;

SELECT*FROM emp where sal>=2000 and sal <= 3000;
SELECT*FROM emp where sal between 2000 and 3000;
SELECT*FROM emp where sal not between 2000 and 3000;


-- like : ���ڿ� �˻��� ���
-- 1. ��� �̸��� S�� �����ϴ� ��� ��� ���� ��ȸ�ϱ�
select*from emp WHERE ename like 'S%';

-- 2. ��� �̸��� �ι�° ���ڰ� L�� ����� ��ȸ�ϱ�
select*from emp WHERE ename like '_L%';

-- 3. ��� �̸��� AM�� ���ԵǾ� �ִ� ����� ��ȸ / �ȵǾ��ִ°� not like
select*from emp where ename like '%AM%';

select empno, ename, sal, deptno
from emp
where sal > 2000
union
select empno, ename, sal, deptno
from emp
where sal>2000 and deptno=30

-- ����Ŭ �Լ�
select *from emp where MONTHS_BETWEEN(SYSDATE,hire_date) <456;

select to_char(SYSDATE, 'YYYY/MM/DD') AS ���糯¥ FROM DUAL;
SELECT  TO_CHAR(SYSDATE, 'HH12:MI:SS') AS ���糯¥ FROM DUAL;
SELECT  TO_CHAR(SYSDATE, 'HH12:MI:SS PM') AS ���糯¥ FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ð� FROM DUAL;

SELECT 1300-TO_NUMBER('1500'), TO_NUMBER('1300') + 1500 FROM DUAL;
SELECT TO_NUMBER('1,300','999,999') - TO_NUMBER('1,500','999,999') FROM DUAL;

-- ��ó�� �Լ� : NVL, NVL2
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM FROM EMP;
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM, NVL(COMM,0), SAL+NVL(COMM,0)
FROM EMP;

SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM, NVL2(COMM,'O','X'), 
            NVL2(COMM,SAL*12+COMM,SAL*12) AS ANNSAL
FROM EMP;

--�ǽ�1
SELECT empno, ename, sal, 
            ROUND((sal/21.5),2) AS day_pay, ROUND(sal/(21.5/8),1) AS TIME_PAY
FROM emp;

--�ǽ�2
SELECT EMPNO, ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(hiredate,3),'������') as R_JOB,
            NVL(TO_CHAR(comm), 'N/A') AS COMM
FROM emp;

--�ǽ�3
SELECT SUBSTR(TO_CHAR(mgr),1,2) FROM EMP;
SELECT empno, ename, mgr,
            DECODE(SUBSTR(TO_CHAR(mgr),1,2),
                            null, '0000',
                            '75', '5555',
                            '76', '6666',
                            '77', '7777',
                            '78', '8888',
                            TO_CHAR(mgr)) AS CHG_MGR
FROM emp;

--�ǽ�4
SELECT last_name, salary,
            CASE
                    WHEN salary < 2000 THEN 0
                    WHEN (salary < 4000) THEN 0.09
                    WHEN (salary < 6000) THEN 0.2
                    WHEN (salary < 8000) THEN 0.3
                    WHEN (salary < 10000) THEN 0.4
                    WHEN (salary < 12000) THEN 0.42
                    WHEN (salary < 14000) THEN 0.44
                    ELSE 0.45
            END AS TAX_RATE
FROM employees WHERE department_id=80;

SELECT last_name, salary,
            DECODE(TRUNC(salary/2000,0),
                                        0, 0.00,
                                        1, 0.09,
                                        2, 0.20,
                                        3, 0.30,
                                        4, 0.40,
                                        5, 0.42,
                                        6, 0.44,
                                        0.45) as TAX_RATE
FROM employees WHERE department_id=80;