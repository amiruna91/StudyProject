-- 사원 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM employees;

-- 부서아이디, 부서명을 조회하기
SELECT department_id, department_name 
FROM departments;

-- 잡아이디, 잡타이틀 조회하기
SELECT job_id, job_title
FROM jobs;

-- 나라이름 조회하기
SELECT country_name
FROM countries;

-- 사원아이디, 이름, 급여, 연봉을 조회하기
-- 사원아이디의 별칭은 ID, 이름은 NAME, 급여는 SAL, 연봉은 ANN_SAL로 정의하기
SELECT employee_id ID, first_name NAME, salary SAL, salary*12 ANN_SAL 
FROM employees;

-- 사원아이디, 이름, 급여, 10%인상된 급여를 조회하기
-- 사원아이디의 별칭은 ID, 이름은 NAME, 급여는 SAL, 10%인상된 급여는 INCREMENT SALARY로 정의하기
SELECT employee_id ID, first_name NAME, salary SAL, salary*1.1 "INCREMENT SALARY"
FROM employees;

-- 부서아이디, 부서명, 부서담당자 아이디 조회하기
SELECT department_id, department_name, manager_id
FROM departments;

-- 사원아이디, 이름, 급여, 커미션, 커미션이 포함된 급여 조회하기
-- 커미션이 포함된 급여는 급여 + 급여*커미션
SELECT employee_id, first_name, salary, commission_pct, commission_pct * salary + salary 
FROM employees;

-- 중복행없이 조회하기
-- 사원들이 종사하고 있는 직종을 전부 조회하기
SELECT DISTINCT job_id
FROM employees;

-- 60번 부서에 근무하는 사원의 아이디, 이름, 직종, 급여, 부서아이디를 조회하기
SELECT employee_id, first_name, job_id, salary, department_id
FROM employees
WHERE DEPARTMENT_ID = 60;

-- 급여를 15000달러 이상 받는 사원의 아이디, 이름, 직종, 급여를 조회하기
SELECT employee_id, first_name, job_id, salary 
FROM employees
WHERE salary >= 15000;