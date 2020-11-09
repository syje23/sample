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
-- �μ���ȣ, ��å, �μ��� ��å ��� �޿�
SELECT deptno, job, AVG(sal)
FROM emp
GROUP BY deptno, job HAVING avg(sal) >= 500;

-- �׷������ ���� ������ ���� ����ȴ�!!
SELECT deptno, job, AVG(sal)
FROM emp
WHERE sal <= 3000
GROUP BY deptno, job HAVING AVG(sal) >= 2000
ORDER BY deptno, job;

-- �ǽ�1
SELECT deptno, ROUND(AVG(sal),0), MAX(sal), MIN(sal), COUNT(deptno)
FROM emp
GROUP BY deptno
ORDER BY deptno DESC;

select deptno, floor(avg(sal)) as avg_sal, max(sal) as max_sal,
            min(sal) as min_sal, count(empno) as cnt
from emp
group by deptno;

--�ǽ�2
SELECT job, COUNT(job)
FROM emp
GROUP BY job having count(job) >=3;

--�ǽ�3
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

-- ���� �� �ִ� ��� ���� ��ȸ
SELECT*FROM emp, dept ORDER BY empno;

-- 1. ��������(�����)
SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno --������ ����
ORDER BY empno;

SELECT *
FROM emp E, dept D -- ��Ī ���̱�
WHERE E.deptno = D.deptno --������ ����
ORDER BY empno;

SELECT * 
FROM emp INNER JOIN dept
ON emp.deptno = dept.deptno
ORDER BY empno;

-- �� ���̺� ���� �̸� �ʵ尡 �����ϴ� ��� / ��� ���̺� �ʵ����� ��Ȯ�� ���
SELECT empno, ename, job, d.deptno, dname 
FROM emp E INNER JOIN dept D
ON E.deptno = D.deptno
ORDER BY empno;

-- EMP���̺�� DEPT���̺� �����Ͽ� ENPNO, ENAME, SAL, DEPTNO, DNAME, LOC ��ȸ / �޿� 3000 �̻� ��� ���
SELECT  e.empno, e.ename, e.sal, d.deptno, d.dname, d.Loc
FROM emp E, dept D
WHERE e.deptno = d.deptno AND e.sal >= 3000;

-- emp ���̺��� ��Ī�� e�� dept ���̺� ��Ī d�� / �޿� 2500���� / �����ȣ 9999 ������ ���
SELECT e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc
FROM emp E, dept D
WHERE e.deptno = d.deptno AND e.sal <= 2500 AND e.empno <= 9999;

-- emp ��Ī e, salgrade ��Ī s / 
SELECT *
FROM emp e, salgrade s
WHERE e.sal BETWEEN s.losal and s.hisal;

--2. ��������(��ü����) : ���� ���̺��� �ڱ� ���̺��϶�
SELECT e1.empno, e1.ename, e1.mgr, e2.empno as MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

--3. OUTER JOIN(�ܺ�����) : ������ �������� �ʴ� ������ ����
-- LEFT OUTER JOIN / ���� ����
SELECT e1.empno, e1.ename, e1.mgr, e2.empno as MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 LEFT OUTER JOIN EMP E2 ON e1.mgr = E2.EMPNO;

SELECT e1.empno, e1.ename, e1.mgr, e2.empno as MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);

-- RIGHT OUTER JOIN / ���� ������
SELECT e1.empno, e1.ename, e1.mgr, e2.empno as MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON e1.mgr = E2.EMPNO;

SELECT e1.empno, e1.ename, e1.mgr, e2.empno as MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO;

-- �ǽ�1
SELECT e.deptno, d.dname, e.empno, e.ename, e.sal
FROM emp E, dept D
WHERE e.deptno = d.deptno AND e.sal > 2000
ORDER BY e.deptno, d.dname;

SELECT e.deptno, d.dname, e.empno, e.ename, e.sal
FROM emp E INNER JOIN dept D ON e.deptno = d.deptno 
WHERE e.sal > 2000
ORDER BY e.deptno, d.dname;

-- �ǽ�2
SELECT e.deptno, d.dname, FLOOR(AVG(e.sal)) AS AVG_SAL, MAX(e.sal) AS MAX_SAL, MIN(e.sal) AS MIN_SAL, COUNT(d.dname)
FROM emp E, dept D
where e.deptno = d.deptno
GROUP BY e.deptno, d.dname
order by e.deptno;

-- �ǽ� 3
SELECT e.deptno, d.dname, e.empno, e.ename, e.job, e.sal
FROM emp E, dept D
WHERE e.deptno = d.deptno
ORDER BY e.deptno, d.dname;

-- �ǽ� 4
SELECT d1.deptno, d1.dname, e1.empno, e1.ename, e1.mgr, e1.sal, e1.deptno,
             s.losal, s.hisal, s.grade, e2.empno as mgr_empno, e2.ename as mgr_ename
FROM emp E1, dept d1, salgrade s, emp e2
WHERE e1.deptno(+) = d1.deptno and e1.sal between s.losal(+) and s.hisal(+) and e1.mgr = e2.empno(+)
ORDER BY e1.deptno;