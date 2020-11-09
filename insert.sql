-- ȸ������, �Խñ� ���, �Ա� ��

-- ������ dept ���̺� �����ؼ� dept_temp ���̺� ����
CREATE TABLE dept_temp AS SELECT * FROM dept;

-- ���� ���̺� ��ȸ
SELECT *
FROM DEPT_TEMP;

-- ������ �߰��ϱ�(���1)
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)
VALUES(50, 'DATABASE', 'SEOUL');

-- ������ �߰��ϱ�(���2) / **���� ������ ���Ѿ���
INSERT INTO dept_temp VALUES (60, 'NETWORK', 'BUSAN');

-- NULL ���� / ���������
INSERT INTO dept_temp(DEPTNO, DNAME, LOC) VALUES (70, 'DATABASE', NULL);
INSERT INTO dept_temp(DEPTNO, DNAME, LOC) VALUES (80, 'MOBILE', '');

-- NULL ���� / ����������
INSERT INTO dept_temp(DEPTNO, LOC) VALUES (70, 'INCHEON');

-- EMP���̺��� �����Ͽ� EMP_TEMP ���̺� ����
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP;

-- ���̺� ����
DROP TABLE EMP_TEMP;

-- ���̺� ������ �����ϱ�
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP WHERE 1<>1;
SELECT * FROM EMP_TEMP;

DESC EMP_TEMP;
INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (9999, 'ȫ�浿', 'PRESIDENT', NULL, '2020-11-09', 4000, NULL, 10);
INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (8888, '������', 'MANAGER', NULL, '2020-10-08', 3000, NULL, 10);

-- ���� �ݿ�
COMMIT;

INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (7777, '����ȣ', 'MANAGER', NULL, TO_DATE('07/01/2020','DD/MM/YYYY'), 4000, NULL, 20);

INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (6666, '�̼���', 'MANAGER', NULL, SYSDATE, 4000, NULL, 20);

-- EMP ���̺��� SALGRADE ���̺��� �����Ͽ� �޿� 1��� ����� EMP_TEMP ���̺� �߰�
-- ���������� �ۼ��ϱ� (**�����Ͱ� �߰��Ǵ� ���̺��� �� ������ ���������� �� ������ ��ġ�ؾ���!)
INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp E, salgrade S
WHERE e.sal BETWEEN s.losal AND s.hisal AND s.grade = 1;