select*from emp;

-- sum : �հ�
SELECT SUM(sal), SUM(DISTINCT sal), SUM(ALL sal) FROM emp;

-- count : ����
SELECT COUNT(*) FROM emp;

-- �μ���ȣ�� 30���� ���� �� ���ϱ�
SELECT COUNT(*) FROM emp WHERE deptno = 30;

-- max, min
SELECT MAX(SAL), MIN(SAL) FROM emp;

--�μ� ��ȣ�� 20�� ����� �Ի��� �� ���� �ֱ� �Ի��� ���ϱ�
SELECT MAX(hiredate) FROM emp WHERE deptno = 20;

-- AVERAGE
SELECT AVG(SAL) FROM emp;
SELECT AVG(SAL) FROM emp where deptno = 30;

-- �μ��� ������ ��� GROUP BY : ������� ���ϴ� ���� ���� ���
SELECT deptno, AVG(SAL) FROM emp GROUP BY deptno;

-- �μ���ȣ�� �߰����� ��� ���ϱ�
SELECT deptno, AVG(COMM) FROM emp GROUP BY deptno;

-- �μ���ȣ, ��å�� �޿� ��� ���ϱ�
SELECT DEPTNO, AVG(SAL), JOB 
FROM emp GROUP BY deptno, job;

SELECT ename, deptno, AVG(sal)
from emp
group by deptno;

-- HAVING : GROUP BY ���� ������ �ٶ� ���