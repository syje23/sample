CREATE TABLE dept_temp2 AS SELECT * FROM dept;

-- dept_temp2�� �ִ� loc ��� ����
UPDATE dept_temp2 -- ���̺� ��
SET loc = 'SEOUL'; -- ������ ����

SELECT * FROM dept_temp2;

ROLLBACK; -- control + Z

UPDATE dept_temp2 
SET loc = 'SEOUL'
WHERE deptno = 10; -- ������Ʈ ����

-- EMP_TEMP ���̺��� ����� �߿��� �޿��� 3000 ������ ����� �߰����� 50���� ����
SELECT * FROM emp_temp;

UPDATE emp_temp
SET comm = 50
WHERE sal <= 3000;

-- �������� �̿��� ������ ����
-- 40�� �μ��� �μ���� ���� ����
UPDATE dept_temp2
SET (dname, loc) = (SELECT dname, loc FROM dept WHERE deptno = 30)
WHERE deptno = 40;

UPDATE dept_temp2
SET loc = 'SEOUL'
WHERE deptno = (SELECT deptno FROM dept WHERE dname = 'OPERATIONS');

COMMIT;