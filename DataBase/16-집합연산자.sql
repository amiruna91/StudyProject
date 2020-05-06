-- 집합 연산자 사용하기
-- 모든 직원의 현재 및 이전 근무했던 직종을 조회하기
-- 직원별로 한번씩만 표시하기
select employee_id, job_id -- 현재 근무중인 직종 조회하기
from employees
union
select employee_id, job_id -- 이전에 근무했던 직종 조회학.
from job_history;

-- 모든 사원의 현재 부서아이디와 이전 소속부서 아이디를 조회하기
select employee_id, department_id
from employees
union all
select employee_id, department_id
from job_history
order by 1;

-- 현재 종사하는 직종과 같은 직종에서 종사하고 있는 사원의 아이디와 직종아이디 조회하기
select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;

select a.employee_id, a.job_id
from employees A, job_history B
where A.employee_id = B.employee_id
and A.job_id = B.job_id;

-- 직종이 변경된 적이 없는 사원의 아이디, 이름을 조회하기
select employee_id, first_name
from employees
minus
select employee_id, ''
from job_history;

-- 직종이 변경된 적이 없는 사원의 아이디, 이름, 현재 직종, 소속부서명을 조회하기
select A.employee_id, B.first_name, B.job_id, C.department_name
from (select employee_id
      from employees
      minus
      select employee_id
      from job_history) A, employees B, departments C
where a.employee_id = B.employee_id
and B.department_id = C.department_id
order by 1;

-- 모든 사원의 현재 및 이전에 근무했던 직종을 조회하기
-- 사원아이디, 직종, 급여를 조회하기
select employee_id, job_id, salary
from employees
union
select employee_id, job_id, 0
from job_history;