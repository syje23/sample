-- HR ������ ������ �ִ� ��� ���̺� ����
select * from tab;

-- employees ���̺� ��ü ���� ��ȸ
SELECT * FROM employees;

-- employees ���̺��� first_name, last_name, job_id �� ��ȸ
SELECT first_name, last_name, job_id FROM employees;

-- �����ȣ�� 176�� ����� LAST_NAME�� �μ���ȣ ��ȸ
SELECT last_name, department_id from employees WHERE employee_id=176;

-- ������ 12000 �̻�(>=) �Ǵ� �������� LAST_NAME �� ���� ��ȸ
SELECT last_name,salary FROM employees WHERE salary >= 12000;

-- ������ 5000���� 12000�� ���� �̿��� ������� LAST_NAME �� ���� ��ȸ
SELECT last_name,salary FROM employees WHERE salary < 5000 OR salary > 12000;

-- 20�� �� 50�� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� �μ���ȣ�� ���ĺ���
-- ���� ��ȸ
SELECT last_name,department_id 
FROM employees 
WHERE department_id in(20,50) ORDER BY last_name, department_id;

-- Ŀ�̼��� ���� ��� ������� LAST_NAME,����,Ŀ�̼� ��ȸ�ϱ�. ��, ������ ���� ��
-- Ŀ�̼� �������� ��� ����ϱ�
SELECT last_name,salary,commission_pct 
FROM employees 
WHERE commission_pct>0 ORDER BY salary DESC, commission_pct DESC;

-- ������ 2500,3500,7000�� �ƴϸ�, ������ SA_REP �̳� ST_CLERK �� ����� ��ȸ
SELECT *
FROM employees 
WHERE salary NOT IN(2500,3500,7000) AND job_id IN('SA_REP','ST_CLERK');


-- 2008/02/20 ~ 2008/05/01 ���̿� ���� ������� LAST_NAME,�����ȣ,������� ��ȸ
-- ��, ������� ������������ �����Ͽ� ���
SELECT last_name, employee_id, hire_date
FROM employees 
WHERE hire_data >= '2008-02-20' AND hire_data <= '2008-05-01' ORDER BY hire_date DESC;

-- 2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� ��������
-- �������� �����Ͽ� ���
SELECT last_name, hire_date
FROM employees 
WHERE hire_date >='2004-01-01' AND hire_date <= '2004-12-31' ORDER BY hire_date;

-- BETWEEN ���
-- ������ 5000���� 12000�� ������ �ְ�, 20 OR 50�� �μ��� �ٹ��ϴ� �������
-- ������ ��ȸ�Ͽ� ������������ �����ֱ�(LAST_NAME, SALARY)

SELECT LAST_NAME, SALARY
FROM employees
WHERE department_id IN (20,50) AND salary BETWEEN 5000 AND 12000 ORDER BY salary;


-- 2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� ��������
-- �������� �����Ͽ� ���

SELECT last_name, hire_date
FROM employees 
WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-31' ORDER BY hire_date;

-- ������ 5000~12000 ���� �̿��� ������� LAST_NAME, SALARY ��ȸ

SELECT LAST_NAME, SALARY
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;

-- LIKE ����

-- 2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� ��������
-- �������� �����Ͽ� ���
SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '04%' ORDER BY hire_date;

-- LAST_NAME �� u�� ���ԵǴ� ������� ��� �� last_name ��ȸ
SELECT employee_id, last_name 
FROM employees
WHERE last_name LIKE '%u%';

-- last_name �� �׹�° ���ڰ� a �� ������� last_name ��ȸ
SELECT last_name 
FROM employees
WHERE last_name LIKE '___a%';

-- last_name �� a Ȥ�� e ���ڰ� �ִ� ������� last_name�� ��ȸ�Ͽ� last_name
-- �������� �������� ����
SELECT last_name 
FROM employees
WHERE last_name LIKE '%a%' or last_name LIKE '%e%' ORDER BY last_name;

-- last_name �� a �� e ���ڰ� �ִ� ������� last_name�� ��ȸ�Ͽ� last_name
-- �������� �������� ����
SELECT last_name 
FROM employees
WHERE last_name LIKE '%a%e%' or last_name LIKE '%e%a%' ORDER BY last_name;

-- IS NULL ����
-- �Ŵ����� ���� ������� LAST_NAME, JOB_ID ��ȸ
SELECT last_name,job_id
FROM employees
WHERE manager_id IS NULL;

-- ST_CLERK�� JOB_ID�� ���� ����� ���� �μ� ID ��ȸ. �μ� ��ȣ�� NULL�� �� ����
SELECT DISTINCT department_id
FROM employees
WHERE job_id NOT IN('ST_CLERK') AND department_id IS NOT NULL;

-- COMMISSION_PCT�� NULL �� �ƴ� ����� �߿��� COMMISSION = SALARY * COMMISSION_PCT
-- �� ���Ͽ� EMPLOYEE_ID, FIRST_NAME, JOB_ID �� ���� ��ȸ

SELECT employee_id, first_name, job_id, SALARY * COMMISSION_PCT AS COMMISSION
FROM employees
WHERE commission_pct IS NOT NULL;


-- [�ǽ�]���ڿ� �Լ�
-- 1. first_name�� Curtis �� ����� first_name, last_name, email, phone_number,
--    job_id�� ��ȸ�Ѵ�. ��, job_id�� ����� �ҹ��ڷ� ��µǵ��� �Ѵ�.
SELECT  first_name, last_name, email, phone_number, LOWER(job_id)   
FROM employees
WHERE first_name = 'Curtis';

-- 2. �μ���ȣ�� 60,70,80,90�� ������� employee_id, first_name, hire_date, job_id��
-- ��ȸ�Ѵ�. ��, job_id�� it_prog�� ����� ��� ���α׷��ӷ� �����Ͽ� ����Ѵ�.
SELECT employee_id, first_name, hire_date, REPLACE(job_id,'IT_PROG','���α׷���')
FROM employees
WHERE department_id IN (60,70,80,90);

-- 3. job_id�� ad_pres, pu_clerk�� ������� employee_id, first_name,last_name, 
-- department_id, job_id�� ��ȸ�Ͻÿ�, ��, ������� first_name�� last_name�� ����
-- �Ͽ� ����Ѵ�.

SELECT  employee_id,CONCAT(first_name,CONCAT(' ',last_name)),department_id, job_id
FROM employees
WHERE job_id IN('AD_PRES','PU_CLERK');


-- ppt �������� 
-- �μ� 80�� �� ����� ���� ���� ������ ���� ǥ��
SELECT last_name,salary,
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


SELECT last_name,salary,
       DECODE(TRUNC(salary/2000,0),
                    0,0.00,
                    1,0.09,
                    2,0.20,
                    3,0.30,
                    4,0.40,
                    5,0.42,
                    6,0.44,
                    0.45) AS TAX_RATE
FROM employees WHERE department_id=80;

-- ������ �Լ� ����
-- ȸ�� ���� �ִ� ���� �� �ּ� ���� ���̸� ��ȸ
SELECT MAX(salary) - MIN(salary) FROM employees;

-- �Ŵ����� �ٹ��ϴ� ������� �ο��� ��ȸ
SELECT COUNT(DISTINCT manager_id) AS �Ŵ��� FROM employees;

-- �μ��� ������ ���� ���Ͽ� �μ���ȣ�� ������������ ���
SELECT COUNT(employee_id), department_id
FROM employees
GROUP BY department_id
ORDER BY department_id;
-- �μ��� �޿��� ��� ������ ����ϰ�, ��տ����� ������ �������� �Ѵ�.
-- �μ���ȣ�� ������������ ����
SELECT ROUND(AVG(salary),0),department_id
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- ������ ������ ���� ������� ��ȸ
SELECT job_id, COUNT(employee_id)
FROM employees
GROUP BY job_id;

-- JOIN �ǽ�
select * from employees;
select * from departments;
select * from locations;

-- �ڽ��� ��� �Ŵ����� ����Ϻ��� ���� �Ի��ڸ� ã�� HIRE_DATE, LAST_NAME, MANAGER_ID�� ����Ͻÿ�(EMPLOYEES SELF JOIN)
SELECT e1.hire_date, e1.last_name, e1.manager_id 
FROM employees E1, employees E2
WHERE e1.manager_id = e2.employee_id AND e1.hire_date > e2.hire_date;

-- ���� �̸��� T�� �����ϴ� ������ ��� ������� ���, LAST_NAME, �μ���ȣ ��ȸ
-- (EMPLOYEES �� DEPARTMENT_ID �� DEPARTMENTS�� DEPARTMENT_ID ���� �� DEPARTMENTS �� LOCATION_ID �� LOCATIONS�� LOCATION_ID ����)
SELECT e.employee_id, e.last_name, e.department_id, l.city
FROM employees E, departments D, locations L
WHERE e.department_id = d.department_id AND d.location_id = l.location_id AND l.city Like 'T%';

-- ��ġ ID�� 1700�� ������ ������� EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, SALARY ��ȸ
-- (EMPLOYEES �� DEPARTMENTS ����)
SELECT  e.employee_id, e.last_name, e.department_id, e.salary
FROM employees E, departments D
WHERE e.department_id = d.department_id AND 

-- DEPARTMENT_NAME, LOCATION_ID, �� �μ��� �����, �� �μ��� ��� ���� ��ȸ
-- (EMPLOYEES, DEPARTMENT ����)


-- EXECUTIVE �μ��� �ٹ��ϴ� ��� ������� DEPARTMENT_ID, LAST_NAME,JOB_ID ��ȸ
-- (EMPLOYEES, DEPARTMENT ����)


-- ������ ������ ������ ������ �ִ� ������� ��� �� JOB_ID ��ȸ
-- (EMPLOYEES, JOB_HISTORY ����)


-- �� ����� �Ҽ� �μ����� �ڽź��� �ʰ� ���Ǿ����� ���� ���� ������ �޴� ����� �����ϴ� ��� ������� LAST_NAME�� ��ȸ
-- (EMPLOYEES SELF JOIN)


