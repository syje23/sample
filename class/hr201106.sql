-- HR 계정이 가지고 있는 모든 테이블 보기
select * from tab;

-- employees 테이블 전체 내용 조회
SELECT * FROM employees;

-- employees 테이블의 first_name, last_name, job_id 만 조회
SELECT first_name, last_name, job_id FROM employees;

-- 사원번호가 176인 사람의 LAST_NAME와 부서번호 조회
SELECT last_name, department_id from employees WHERE employee_id=176;

-- 연봉이 12000 이상(>=) 되는 직원들의 LAST_NAME 및 연봉 조회
SELECT last_name,salary FROM employees WHERE salary >= 12000;

-- 연봉이 5000에서 12000의 범위 이외의 사람들의 LAST_NAME 및 연봉 조회
SELECT last_name,salary FROM employees WHERE salary < 5000 OR salary > 12000;

-- 20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서번호를 알파벳순
-- 으로 조회
SELECT last_name,department_id 
FROM employees 
WHERE department_id in(20,50) ORDER BY last_name, department_id;

-- 커미션을 버는 모든 사원들의 LAST_NAME,연봉,커미션 조회하기. 단, 연봉의 역순 및
-- 커미션 역순으로 결과 출력하기
SELECT last_name,salary,commission_pct 
FROM employees 
WHERE commission_pct>0 ORDER BY salary DESC, commission_pct DESC;

-- 연봉이 2500,3500,7000이 아니며, 직업이 SA_REP 이나 ST_CLERK 인 사람들 조회
SELECT *
FROM employees 
WHERE salary NOT IN(2500,3500,7000) AND job_id IN('SA_REP','ST_CLERK');


-- 2008/02/20 ~ 2008/05/01 사이에 고용된 사원들의 LAST_NAME,사원번호,고용일자 조회
-- 단, 고용일자 내림차순으로 정렬하여 출력
SELECT last_name, employee_id, hire_date
FROM employees 
WHERE hire_data >= '2008-02-20' AND hire_data <= '2008-05-01' ORDER BY hire_date DESC;

-- 2004년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회하여 입사일 기준으로
-- 오름차순 정렬하여 출력
SELECT last_name, hire_date
FROM employees 
WHERE hire_date >='2004-01-01' AND hire_date <= '2004-12-31' ORDER BY hire_date;

-- BETWEEN 사용
-- 연봉이 5000에서 12000의 범위에 있고, 20 OR 50번 부서에 근무하는 사람들의
-- 연봉을 조회하여 오름차순으로 보여주기(LAST_NAME, SALARY)

SELECT LAST_NAME, SALARY
FROM employees
WHERE department_id IN (20,50) AND salary BETWEEN 5000 AND 12000 ORDER BY salary;


-- 2004년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회하여 입사일 기준으로
-- 오름차순 정렬하여 출력

SELECT last_name, hire_date
FROM employees 
WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-31' ORDER BY hire_date;

-- 연봉이 5000~12000 범위 이외의 사람들의 LAST_NAME, SALARY 조회

SELECT LAST_NAME, SALARY
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;

-- LIKE 연습

-- 2004년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회하여 입사일 기준으로
-- 오름차순 정렬하여 출력
SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '04%' ORDER BY hire_date;

-- LAST_NAME 에 u가 포함되는 사원들의 사번 및 last_name 조회
SELECT employee_id, last_name 
FROM employees
WHERE last_name LIKE '%u%';

-- last_name 에 네번째 글자가 a 인 사람들의 last_name 조회
SELECT last_name 
FROM employees
WHERE last_name LIKE '___a%';

-- last_name 에 a 혹은 e 글자가 있는 사원들의 last_name을 조회하여 last_name
-- 기준으로 오름차순 정렬
SELECT last_name 
FROM employees
WHERE last_name LIKE '%a%' or last_name LIKE '%e%' ORDER BY last_name;

-- last_name 에 a 와 e 글자가 있는 사원들의 last_name을 조회하여 last_name
-- 기준으로 오름차순 정렬
SELECT last_name 
FROM employees
WHERE last_name LIKE '%a%e%' or last_name LIKE '%e%a%' ORDER BY last_name;

-- IS NULL 연습
-- 매니저가 없는 사람들의 LAST_NAME, JOB_ID 조회
SELECT last_name,job_id
FROM employees
WHERE manager_id IS NULL;

-- ST_CLERK인 JOB_ID를 가진 사원이 없는 부서 ID 조회. 부서 번호가 NULL인 값 제외
SELECT DISTINCT department_id
FROM employees
WHERE job_id NOT IN('ST_CLERK') AND department_id IS NOT NULL;

-- COMMISSION_PCT가 NULL 이 아닌 사원들 중에서 COMMISSION = SALARY * COMMISSION_PCT
-- 를 구하여 EMPLOYEE_ID, FIRST_NAME, JOB_ID 와 같이 조회

SELECT employee_id, first_name, job_id, SALARY * COMMISSION_PCT AS COMMISSION
FROM employees
WHERE commission_pct IS NOT NULL;


-- [실습]문자열 함수
-- 1. first_name이 Curtis 인 사람의 first_name, last_name, email, phone_number,
--    job_id를 조회한다. 단, job_id의 결과는 소문자로 출력되도록 한다.
SELECT  first_name, last_name, email, phone_number, LOWER(job_id)   
FROM employees
WHERE first_name = 'Curtis';

-- 2. 부서번호가 60,70,80,90인 사람들의 employee_id, first_name, hire_date, job_id를
-- 조회한다. 단, job_id가 it_prog인 사원의 경우 프로그래머로 변경하여 출력한다.
SELECT employee_id, first_name, hire_date, REPLACE(job_id,'IT_PROG','프로그래머')
FROM employees
WHERE department_id IN (60,70,80,90);

-- 3. job_id가 ad_pres, pu_clerk인 사원들의 employee_id, first_name,last_name, 
-- department_id, job_id를 조회하시오, 단, 사원명은 first_name과 last_name을 연결
-- 하여 출력한다.

SELECT  employee_id,CONCAT(first_name,CONCAT(' ',last_name)),department_id, job_id
FROM employees
WHERE job_id IN('AD_PRES','PU_CLERK');


-- ppt 연습문제 
-- 부서 80의 각 사원에 대해 적용 가능한 세율 표시
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

-- 다중행 함수 연습
-- 회사 내의 최대 연봉 및 최소 연봉 차이를 조회
SELECT MAX(salary) - MIN(salary) FROM employees;

-- 매니저로 근무하는 사원들의 인원수 조회
SELECT COUNT(DISTINCT manager_id) AS 매니저 FROM employees;

-- 부서별 직원의 수를 구하여 부서번호의 오름차순으로 출력
SELECT COUNT(employee_id), department_id
FROM employees
GROUP BY department_id
ORDER BY department_id;
-- 부서별 급여의 평균 연봉을 출력하고, 평균연봉은 정수만 나오도록 한다.
-- 부서번호별 오름차순으로 정렬
SELECT ROUND(AVG(salary),0),department_id
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- 동일한 직업을 가진 사원수를 조회
SELECT job_id, COUNT(employee_id)
FROM employees
GROUP BY job_id;

-- JOIN 실습
select * from employees;
select * from departments;
select * from locations;

-- 자신의 담당 매니저의 고용일보다 빠른 입사자를 찾아 HIRE_DATE, LAST_NAME, MANAGER_ID를 출력하시오(EMPLOYEES SELF JOIN)
SELECT e1.hire_date, e1.last_name, e1.manager_id 
FROM employees E1, employees E2
WHERE e1.manager_id = e2.employee_id AND e1.hire_date > e2.hire_date;

-- 도시 이름이 T로 시작하는 지역에 사는 사원들의 사번, LAST_NAME, 부서번호 조회
-- (EMPLOYEES 의 DEPARTMENT_ID 와 DEPARTMENTS의 DEPARTMENT_ID 연결 후 DEPARTMENTS 의 LOCATION_ID 와 LOCATIONS의 LOCATION_ID 조인)
SELECT e.employee_id, e.last_name, e.department_id, l.city
FROM employees E, departments D, locations L
WHERE e.department_id = d.department_id AND d.location_id = l.location_id AND l.city Like 'T%';

-- 위치 ID가 1700인 동일한 사원들의 EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, SALARY 조회
-- (EMPLOYEES 와 DEPARTMENTS 조인)
SELECT  e.employee_id, e.last_name, e.department_id, e.salary
FROM employees E, departments D
WHERE e.department_id = d.department_id AND 

-- DEPARTMENT_NAME, LOCATION_ID, 각 부서별 사원수, 각 부서별 평균 연봉 조회
-- (EMPLOYEES, DEPARTMENT 조인)


-- EXECUTIVE 부서에 근무하는 모든 사원들의 DEPARTMENT_ID, LAST_NAME,JOB_ID 조회
-- (EMPLOYEES, DEPARTMENT 조인)


-- 기존의 직업을 여전히 가지고 있는 사원들의 사번 및 JOB_ID 조회
-- (EMPLOYEES, JOB_HISTORY 조인)


-- 각 사원별 소속 부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는 사원이 존재하는 모든 사원들의 LAST_NAME을 조회
-- (EMPLOYEES SELF JOIN)


