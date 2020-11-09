-- ������ �޿����� ���� �޿��� �޴� ���
SELECT * FROM emp;

-- ������ �޿� �˾Ƴ���
SELECT sal FROM emp WHERE ename= 'JONES';

-- ���� �޿� ��� ����ϱ�
SELECT * FROM emp WHERE sal > 2975;

-- �������� : ������ �ȿ� �ٸ� �������� �����ϰ� �ִ� ����
-- ������ ��������
SELECT * FROM emp WHERE sal > (SELECT sal FROM emp WHERE ename = 'JONES');

-- ��� �̸��� allen �� ����� �߰� ���� ���� ���� �޴� ���
SELECT * FROM emp WHERE comm > (SELECT comm FROM emp WHERE ename = 'ALLEN');

-- ��� �̸��� WARD �� ����� �Ի��� ���� ���� �Ի��� ���
SELECT * FROM emp WHERE hiredate < (SELECT hiredate FROM emp WHERE ename = 'WARD');

-- 20�� �μ��� ���� ��� �� ��ü ��� ��� �޿����� ���� �޿� �޴� ���
SELECT * FROM emp WHERE deptno = 20 AND sal > (SELECT AVG(sal) FROM emp);

-- 20�� �μ��� ���� ��� �� ��ü ��� ��� �޿����� ���� �޿� �޴� ���/ �μ���, ���� ��ġ ���
SELECT e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc
FROM emp E, dept D
WHERE e.deptno = d.deptno AND d.deptno = 20 AND e.sal > (SELECT AVG(e.sal) FROM emp);

-- ������ ��������

-- �������� ����� 2�� �̻� ������ ���, ������ ���������� ������ ���Ұ�
-- ������ �������ǿ� 2���̻��� ���� ���ϵǾ����ϴ�.

-- IN
SELECT * FROM emp WHERE sal IN (SELECT MAX(sal) FROM emp GROUP BY deptno);
-- ANY(SOME)
SELECT * FROM emp WHERE sal = ANY (SELECT MAX(sal) FROM emp GROUP BY deptno);

-- 30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ��� ���
SELECT * FROM emp WHERE sal < ANY (SELECT MAX(sal) FROM emp WHERE deptno = 30);
SELECT * FROM emp WHERE sal < ANY (SELECT sal FROM emp WHERE deptno = 30);
SELECT DISTINCT sal FROM emp WHERE Deptno = 30;

-- ALL : �������� ��� ��� �����ϴ� �������� �����Ҷ�
SELECT * FROM emp WHERE sal < ALL (SELECT sal FROM emp WHERE deptno = 30);

--EXISTS : IN �� ����� ����, �� IN���� ���� ���
SELECT empno, deptno
FROM emp
WHERE EXISTS (SELECT 1 
                        FROM dept 
                        WHERE deptno IN (20,30) AND emp.deptno = dept.deptno);
                        
-- �ǽ�1
-- ��ü ����� ALLEN�� ���� ��å�� ������� �������, �μ����� ���
SELECT e.job, e.empno, e.ename, e.sal, d.deptno, d.dname
FROM emp E, dept D
WHERE d.deptno = d.deptno AND e.job IN (SELECT JOB FROM emp WHERE ename = 'ALLEN');

-- ��� ��� �޿����� ���� �޿� �޴� ������� �������, �μ�����, �޿� ��� ���� ���
SELECT e.empno, e.ename, d.dname, e.hiredate, d.loc, e.sal, s.grade
FROM emp E, salgrade S, dept D
WHERE e.deptno = d.deptno AND e.sal BETWEEN s.losal and s.hisal AND e.sal > (SELECT AVG(sal) FROM emp)
ORDER BY e.sal DESC, e.empno;

-- ���� �� �������� : ���������� SELECT ���� ���� �÷��� ������ ������ ���
SELECT * FROM emp WHERE (deptno, sal) IN
                        (SELECT deptno, MAX(sal) FROM emp GROUP BY deptno);
                        
-- FROM ���� ����ϴ� ���� ���� (�ζ��� ��)
SELECT e.empno, e.ename, d.deptno, d.dname, d.loc
FROM (SELECT * FROM emp WHERE deptno = 10) E, (SELECT * FROM dept) D
WHERE e.deptno = d.deptno;

-- �ǽ� 1 / 10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ��� �������� �ʴ� ��å ���� �������, �μ����� ���
SELECT e.empno, e.ename, e.job, d.deptno, d.dname, d.loc
FROM emp E, dept D
WHERE e.deptno = d.deptno AND e.job NOT IN (SELECT DISTINCT job FROM emp WHERE deptno = 30)
            AND e.deptno = 10;
            
-- �ǽ�2 / ��å�� salesman�� ������� �ְ� �޿����� ���� �޿� �޴� ����� ����
-- �������� Ȱ�� �� ������ �Լ� ��� ����� ������� �ʴ� ��� ���� �����ȣ �������� �������� ����
SELECT empno, ename, sal
FROM emp
WHERE sal > (SELECT MAX(sal) FROM emp WHERE JOB = 'SALESMAN');
-- (������ ���)
SELECT empno, ename, sal
FROM emp
WHERE sal > ALL (SELECT sal FROM emp WHERE JOB = 'SALESMAN');