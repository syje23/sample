-- hr 계정이 가지고 있는 모든 테이블 보기
select * from tab;

-- employees 테이블 전체 내용 조회
SELECT * FROM employees;
select * from dept;

select last_name, employee_id, hire_date
from employees
where hire_date >= '2008-02-20' and hire_date <= '2008-05-01' ORDER BY hire_date;

-- 회사 내의 최대 연봉 및 최소 연봉 차이를 조회
SELECT MAX(salary) - MIN(salary) FROM employees;

-- 부서별 직원 수를 구하여 부서번호 오름차순으로 출력
SELECT COUNT(employee_id), department_id
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- 부서별 급여 평균연봉 출력, 평균연봉은 정수만 나오도록 / 부서 번호별 오름차순 정렬
SELECT ROUND(AVG(salary),0), department_id
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- 동일 직업 가진 사원 수를 조회
SELECT COUNT(employee_id), job_id
FROM employees
GROUP BY job_id