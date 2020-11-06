-- hr 계정이 가지고 있는 모든 테이블 보기
select * from tab;

-- employees 테이블 전체 내용 조회
SELECT * FROM employees;

select last_name, employee_id, hire_date
from employees
where hire_date >= '2008-02-20' and hire_date <= '2008-05-01' ORDER BY hire_date;
