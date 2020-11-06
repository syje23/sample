-- hr ������ ������ �ִ� ��� ���̺� ����
select * from tab;

-- employees ���̺� ��ü ���� ��ȸ
SELECT * FROM employees;
select * from dept;

select last_name, employee_id, hire_date
from employees
where hire_date >= '2008-02-20' and hire_date <= '2008-05-01' ORDER BY hire_date;

-- ȸ�� ���� �ִ� ���� �� �ּ� ���� ���̸� ��ȸ
SELECT MAX(salary) - MIN(salary) FROM employees;

-- �μ��� ���� ���� ���Ͽ� �μ���ȣ ������������ ���
SELECT COUNT(employee_id), department_id
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- �μ��� �޿� ��տ��� ���, ��տ����� ������ �������� / �μ� ��ȣ�� �������� ����
SELECT ROUND(AVG(salary),0), department_id
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- ���� ���� ���� ��� ���� ��ȸ
SELECT COUNT(employee_id), job_id
FROM employees
GROUP BY job_id