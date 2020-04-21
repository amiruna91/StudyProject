-- 다중행 함수 사용하기
-- employees의 모든 행의 갯수 조회하기
select count(*)
from employees;

-- 50번 부서에서 일하는 직원의 수를 조회하기
select count(*)
from employees
where department_id = 50;

-- 커미션을 받는 직원의 수를 조회하기
select count(commission_pct)    -- 컬럼을 지정하면 해당 컬럼의 값이 null이 아닌 것만 카운트 한다.
from employees;

select count(*)
from employees
where commission_pct is not null;

-- 직원들 중에서 최고급여, 최저급여를 받는 직원의 급여를 조회하기
select max(salary), min(salary)
from employees;

-- 최고급여를 받는 사람의 이름과 최고급여를 조회하기
select first_name, max(salary)   -- 오류 : 그룹함수가 아닌표현식을 같이 조회할 수 없다.
from employees;

-- 조회된 행의 갯수를 구하기
-- count(*) : 조회된 모든 행의 갯수를 반환한다.
-- count(컬럼명) : 해당 컬럼의 값이 null이 아닌 행의 갯수를 반환한다.
-- count(distinct 컬럼명) : 해당 컬럼의 값에 대해 중복된 값은 1번만 카운트해서 행의 갯수를 반환한다.
select count(*)
from employees;         -- 107

select count(job_id)
from employees;         -- 107

select count(DISTINCT job_id)
from employees;         -- 19

select count(distinct to_char(hire_date, 'yyyy'))
from employees;         -- 8

-- 조회된 행의 특정 칼럼에 대한 합계를 구하기
-- sum(컬럼명) : 해당 컬럼의 값 중에서 null을 제외한 값들의 합계를 반환한다.
select sum(salary)  -- 전체 사원들의 급여 총액
from employees;

select sum(commission_pct)  -- 전체 사원들의 커미션에 대한 합계
from employees;             -- 커미션 값이 null인 것은 계산에 포함되지 않은

-- 조회된 행의 특정 컬럼에 대한 평균을 구하기
-- avg(컬럼명) : 해당 컬럼의 값 중에서 null을 제외한 값을 가진 행들에 대한 평균값을 반환한다.
select trunc(avg(salary))     -- 전체 직원들의 급여 평균
from employees;

select trunc(avg(commission_pct), 2)
from employees;

-- 조회된 행의 특정 컬럼에 대한 최대값, 최소값 구하기
-- min(컬럼명) : 해당 컬럼의 값 중에서 null을 제외한 가장 작은 값을 반환한다.
-- max(컬럼명) : 해당 컬럼의 값 중에서 null을 제외한 가장 쿤 값을 반환한다.
select min(salary), max(salary)
from employees;

select min(commission_pct), max(commission_pct)
from employees;

-- group by와 그룹합수를 사용해서 데이터 집계하기
-- 직종별 직원수를 조회하기
select job_id, count(*)
from employees
group by job_id;

select to_char(hire_date, 'yyyy'), count(*)
from employees
group by to_char(hire_date, 'yyyy')
order by 1;