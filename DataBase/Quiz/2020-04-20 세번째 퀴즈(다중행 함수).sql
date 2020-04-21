--1. 모든 직원들의 모든 업무아이디를 조회하기
select distinct job_id
from employees
order by 1;

--2. 급여를 12,000달러 이상 받는 직원의 이름과 급여를 조회하기
select first_name, salary
from employees
where salary >= 12000
order by 1;

--3. 직원번호가 176번 직원과 같은 부서에서 근무하는 직원의 아이디와 이름 직종아이디를 조회하기
select B.employee_id, B.first_name, B.job_id
from employees A, employees B
where A.employee_id = 176
and A.department_id = B.department_id
order by 1;

--4. 급여를 12,000달러 이상 15,000달러 이하 받는 직원들의 직원 아이디와 이름과 급여를 조회하기
select employee_id, first_name, salary
from employees
where salary >= 12000
and salary <= 15000
order by 1;

--5. 2005년 1월 1일부터 2005년 6월 30일 사이에 입사한 직원의 아이디, 이름, 업무아이디, 입사일을 조회하기
select employee_id, first_name, job_id, hire_date
from employees
where hire_date >= '2005/01/01'
and hire_date < '2005/07/01'
order by 1;

--6. 급여가 5,000달러와 12,000달러 사이이고, 부서번호가 20 또는 50인 직원의 이름과 급여를 조회하기
select first_name, salary
from employees
where salary >=5000 and salary <= 12000
and (department_id in (20, 50))
order by 1;

--7. 관리자가 없는 직원의 이름과 업무아이디를 조회하기
select first_name, job_id
from employees
where manager_id is null
order by 1;

--8. 커미션을 받는 모든 직원의 이름과 급여, 커미션을 급여 및 커미션의 내림차순으로 정렬해서 조회하기
select first_name, salary, commission_pct
from employees
where commission_pct is not null
order by salary desc, commission_pct desc;

--9. 이름의 2번째 글자가 e인 모든 직원의 이름을 조회하기
select first_name
from employees
where first_name like '_e%'
order by 1;

--10. 업무아이디가 ST_CLERK 또는 SA_REP이고 급여를 2,500달러, 3,500달러, 7,000달러 받는 
--   모든 직원의 이름과 업무아이디, 급여를 조회하기
select first_name, job_id, salary
from employees
where job_id in ('ST_CLERK', 'SA_REP')
and salary in (2500, 3500, 7000)
order by 1;

--11. 모든 직원의 이름과 입사일, 근무 개월 수를 계산하여 조회하기, 근무개월 수는 정수로 반올림하고, 
--    근무개월수를 기준으로 오름차순으로 정렬하기
select first_name, hire_date, round(months_between(sysdate, hire_date))
from employees
order by 3;

--12. 직원의 이름과 커미션을 조회하기, 커미션을 받지 않는 직원은 '없음'으로 표시하기
select first_name, nvl(to_char(commission_pct), '없음')
from employees
order by 1;

--13. 모든 직원의 이름, 부서번호, 부서이름을 조회하기
select A.employee_id, B.department_id, B.department_name
from employees A, departments B
where A.department_id = B.department_id
order by 1;

--14. 80번부서에 소속된 직원의 이름과 업무아이디, 업무제목, 부서이름을 조회하기
select A.first_name, B.job_id, B.job_title, C.department_name
from employees A, jobs B, departments C
where A.department_id = 80
and A.job_id = B.job_id
and A.department_id = C.department_id
order by A.employee_id;

--15. 커미션을 받는 모든 직원의 이름과 업무아이디, 업무제목, 부서이름, 부서소재지 도시명을 조회하기
select A.first_name, A.job_id, B.job_title
    , C.department_name, d.street_address, d.city
from employees A, jobs B, departments C, locations D
where A.commission_pct is not null
and A.job_id = B.job_id
and A.department_id = C.department_id
and C.location_id = D.location_id
order by A.employee_id;

--16. 유럽에 소재지를 두고 있는 모든 부서아이디와 부서이름을 조회하기
select a.department_id, A.department_name
from departments A, locations B, countries C, regions D
where d.region_name = 'Europe'
and d.region_id = c.region_id
and c.country_id = b.country_id
and b.location_id = a.location_id
order by A.department_id;

--17. 직원의 이름과 소속부서명, 급여, 급여 등급을 조회하기
select A.first_name, B.department_name, A.salary, C.gra
from employees A, departments B, job_grades C
where A.department_id = B.department_id(+)
and A.salary >= C.lowest_sal and A.salary <= C.highest_sal
order by A.employee_id;

--18. 직원의 이름과 소속부서명, 소속부서의 관리자명을 조회하기, 소속부서가 없는 직원은 소속부서명 '없음, 관리자명 '없음'으로 표시하기
select A.first_name, nvl(B.department_name,'없음') 소속부서명, nvl(C.first_name, '없음') 관리자명
from employees A, departments B, employees C
where A.department_id = B.department_id(+)
and B.manager_id = C.employee_id(+)
order by A.employee_id;

--19. 모든 사원의 이름, 직종아이디, 급여, 소속부서명을 조회하기
select A.first_name, A.job_id, A.salary, B.department_name
from employees A, departments B
where A.department_id = B.department_id
order by A.employee_id;

--20. 모든 사원의 이름, 직종아이디, 직종제목, 급여, 최소급여, 최대급여를 조회하기
select A.first_name, A.job_id, B.job_title, A.salary, B.min_salary, B.max_salary
from employees A, jobs B
where A.job_id = B.job_id
order by A.employee_id;

--21. 모든 사원의 이름, 직종아이디, 직종제목, 급여, 최소급여와 본인 급여의 차이를 조회하기
select A.first_name, A.job_id, B.job_title
    , A.salary, B.min_salary, A.salary - B.min_salary 급여차이
from employees A, jobs B
where A.job_id = B.job_id
order by A.employee_id;

--22. 커미션을 받는 모든 사원의 아이디, 부서이름, 소속부서의 소재지(도시명)을 조회하기
select A.employee_id, B.department_name, C.city
from employees A, departments B, locations C
where A.commission_pct is not null
and A.department_id = B.department_id
and B.location_id = C.location_id
order by 1;

--23. 이름이 A나 a로 시작하는 모든 사원의 이름과 직종, 직종제목, 급여, 소속부서명을 조회하기
select A.first_name, A.job_id, B.job_title, A.salary, C.department_name
from employees A, jobs B, departments C
where A.first_name like 'A%'
and A.job_id = B.job_id
and A.department_id = C.department_id
order by A.employee_id;

--24. 30, 60, 90번 부서에 소속되어 있는 사원들 중에서 100에게 보고하는 사원들의 이름, 직종, 급여,
--    급여등급을 조회하기
select A.first_name, A.job_id, A.salary, b.gra
from employees A, job_grades B
where A.department_id in (30, 60, 90)
and A.manager_id = 100
and A.salary >= b.lowest_sal and A.salary <= B.highest_sal
order by A.employee_id;

--25. 80번 부서에 소속된 사원들의 이름, 직종, 직종제목, 급여, 최소급여, 최대급여, 급여등급, 
--    소속부서명을 조회하기
select A.first_name, A.job_id, B.job_title
    , A.salary, B.min_salary, B.max_salary, C.gra
    , D.department_name
from employees A, jobs B, job_grades C, departments D
where A.department_id = 80
and A.job_id = B.job_id
and A.salary >= c.lowest_sal and A.salary <= c.highest_sal
and A.department_id = D.department_id
order by A.employee_id;

--26. 사원들중에서 자신의 상사보다 먼저 입사한 사원들의 이름, 입사일, 상사의 이름, 상사의 입사일을
--    조회하기
select A.first_name, A.hire_date, B.first_name, B.hire_date
from employees A, employees B
where A.manager_id = B.employee_id
and A.hire_date < B.hire_date
order by A.manager_id;

--27. 부서명이 IT인 부서에 근무하는 사원들의 이름과, 직종, 급여, 급여등급, 상사의 이름과 직종을
--    조회하기
select A.first_name, A.job_id, A.salary, C.gra, D.first_name, D.job_id
from employees A, departments B, job_grades C, employees D
where A.department_id = B.department_id
and B.department_name = 'IT'
and A.salary >= c.lowest_sal and A.salary <= C.highest_sal
and B.manager_id = D.employee_id
order by A.employee_id;

--28. 'ST_CLERK'로 근무하다가 다른 직종으로 변경한 사원의 아이디, 이름, 변경전 부서명,
--     현재 직종, 현재 근무부서명을 조회하기
select A.employee_id 아이디, A.first_name 이름, C.department_name "전 부서명"
    , A.job_id "현재 직종", D.department_name "현재 부서명"
from employees A, job_history B, departments C, departments D
where A.employee_id = B.employee_id
and B.job_id = 'ST_CLERK'
and B.department_id = C.department_id
and A.department_id = D.department_id
order by 1;