-- hr ������ ������ �ִ� ��� ���̺� ����
select * from tab;

-- employees ���̺� ��ü ���� ��ȸ
SELECT * FROM employees;

select last_name, employee_id, hire_date
from employees
where hire_date >= '2008-02-20' and hire_date <= '2008-05-01' ORDER BY hire_date;
