-- 1.  시스템의 현재 날짜와 시간 조회하기 (dual 사용)
select sysdate
from dual;

-- 2.  급여를 5000달러 이상받고, 2005년에 입사한 직원의 아이디, 이름, 급여, 입사일을 조회하기
select employee_id, first_name, salary, hire_date
from employees
where salary >= 5000
and hire_date >= '2005/01/01' and hire_date <= '2006/01/01'
order by employee_id;

-- 3.  이름에 e나 E가 포함된 직원 중에서 급여를 10000달러 이상 받는 직원의 아이디, 이름, 급여를 조회하기
select employee_id, first_name, salary
from employees
where (first_name like '%e%' or first_name like '%E%')
and salary >= 10000
order by employee_id;

-- 4.  입사년도와 상관없이 4월에 입사한 직원들의 아이디, 이름, 입사일을 조회하기
select employee_id, first_name, hire_date
from employees
where to_char(hire_date, 'mm') = '04'
order by employee_id;

-- 5.  2006년 상반기(1/1 ~ 6/30)에 입사한 직원들의 아이디, 이름, 입사일 조회하기
select employee_id, first_name, hire_date
from employees
where hire_date >= '2006/01/01' and hire_date < '2006/07/01'
order by employee_id;

-- 6.  50번 부서에 소속된 직원들의 급여를 13%인상시키려고 한다.
--     직원아이디, 이름, 현재 급여, 인상된 급여를 조회하기
--     인상된 급여는 소숫점 이하는 버린다.
select employee_id, first_name, salary
    , trunc(salary*1.13)  increase_salary
from employees
where department_id = 50
order by employee_id;

-- 7.  50번 부서에 소속된 직원들의 급여를 조회하려고 한다.
--     직원 아이디, 이름, 급여 그리고, 급여 1000달러당 *를 하나씩 표시하라.
--     120 Matthew 8000 ********
--     122 Shanta  6500 ******
select employee_id, first_name, salary, lpad('*',trunc(salary/1000),'*')
from employees
where department_id = 50
order by employee_id;

-- 8.  관리자가 지정되어 있지 않는 부서의 
--     부서아이디, 부서명, 위치아이디, 도시명, 주소를 조회하기
select A.department_id, A.department_name, A.location_id
    , b.city, B.street_address
from departments A, locations B
where manager_id is null
and A.location_id = B.location_id
order by department_id;

-- 9.  'Executive' 부서에 소속된 직원의 직원아이디, 이름, 직종, 급여를 조회하기
select A.employee_id, A.first_name, A.job_id, A.salary
from employees A, departments B
where b.department_name = 'Executive'
and a.department_id = b.department_id
order by employee_id;

-- 10. 100번 직원이 부서관리자로 지정된 부서에 소속된 직원의 직원아이디, 이름, 직종, 급여를 조회하기
select B.employee_id, B.first_name, B.job_id, B.salary
from departments A, employees B
where A.manager_id = 100
and A.department_id = B.department_id
order by B.employee_id;

-- 11. 10, 20, 30번 부서에 소속된 직원들의 직원아이디, 이름, 급여, 급여등급을 조회하기
select A.employee_id, A.first_name, A.salary, B.gra
from employees A, job_grades B
where A.department_id in (10, 20, 30)
and A.salary between B.lowest_sal and B.highest_sal
order by A.employee_id;

-- 12. 직원들의 직종정보를 참고했을 때 자신이 종사하고 있는 직종의 최저급여를 받고 있는
--     직원의 아이디, 이름, 급여, 직종아이디, 직종최저급여를 조회하기
select A.employee_id, A.first_name, A.salary
    , B.job_id, B.min_salary
from employees A, jobs B
where A.job_id = b.job_id
and A.salary = B.min_salary
order by A.employee_id;

-- 13. 커미션을 받는 직원들의 직원아이디, 이름, 커미션, 급여, 직종아이디, 직종제목, 급여, 소속부서 아이디, 부서명을 조회하기
select A.employee_id, A.first_name, A.commission_pct, A.salary
    , B.job_id, B.job_title
    , C.department_id, C.department_name
from employees A, jobs B, departments C
where a.commission_pct is not null
and A.job_id = B.job_id
and A.department_id = C.department_id
order by A.employee_id;

-- 14. 'Canada'에서 근무하고 있는 직원의 아이디, 이름, 소속부서 아이디, 소속부서명, 위치 아이디, 도시명, 주소를 조회하기
select D.employee_id, D.first_name
    , C.department_id, C.department_name
    , B.location_id, B.city, B.street_address
from countries A, locations B, departments C, employees D
where A.country_name = 'Canada'
and A.country_id = B.country_id
and B.location_id = C.location_id
and C.department_id = D.department_id
order by D.employee_id;

-- 15. 모든 직원의 직원아이디, 이름, 직종아이디, 직종제목, 급여, 급여등급, 소속부서 아이디, 소속부서명, 도시명을 조회하기
select A.employee_id, A.first_name
    , B.job_id, B.job_title
    , A.salary, D.gra, C.department_name, E.city
from employees A, jobs B, departments C, job_grades D, locations E
where A.job_id = B.job_id
and A.department_id = C.department_id
and A.salary between D.lowest_sal and D.highest_sal
and C.location_id = E.location_id
order by A.employee_id;

-- 16. 급여를 5000달러 이하로 받는 직원들의 아이디, 이름, 직종, 소속부서 아이디, 소속부서명, 소속부서 관리자 직원아이디, 
--     소속부서 관리자 직원이름을 조회하기
select A.employee_id, A.first_name, A.job_id, A.salary
    , B.department_id, B.department_name, B.manager_id
    , C.first_name
from employees A, departments B, employees C
where A.salary <= 5000
and A.department_id = B.department_id
and B.manager_id = C.employee_id
order by A.employee_id;

-- 17. 'Asia'지역에 소재지를 두고 있는 부서의 아이디, 부서명, 부서관리자 이름을 조회하기
select D.department_id, D.department_name, E.first_name
from regions A, countries B, locations C, departments D, employees E
where A.region_name = 'Asia'
and A.region_id = B.region_id
and B.country_id = C.country_id
and C.location_id = D.location_id
and D.manager_id = E.employee_id
order by D.department_id;

-- 18. 101번 직원이 근무했던 부서에서 근무중이 직원의 아이디, 이름, 부서아이디, 부서명을 조회하기
select DISTINCT B.employee_id, B.first_name, C.department_id, C.department_name
from job_history A, employees B, departments C
where A.employee_id = 101
and A.department_id = B.department_id
and A.department_id = C.department_id;

-- 19. 직원중에서 자신이 종사하고 있는 직종의 최고급여 50%이상을 급여로 받고 있는 
--     직원의 아이디, 이름, 급여, 직종아이디, 직종 최고급여를 조회하기
select A.employee_id, A.first_name, A.salary, b.job_id, b.max_salary 
from employees A, jobs B
where A.job_id = B.job_id
and A.salary >= b.max_salary/2
order by B.job_id;

-- 20. 미국(US)에 위치하고 있는 부서의 아이디, 이름, 위치번호, 도시명, 주소를 조회하기 
select a.department_id, a.department_name, a.location_id, b.city, b.street_address
from departments A, locations B
where b.country_id = 'US'
and A.location_id = b.location_id
order by a.department_id;

