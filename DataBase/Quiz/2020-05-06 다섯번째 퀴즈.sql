--1. 급여가 5000이상 12000이하인 사원의 아이디, 이름, 급여를 조회하기
select employee_id ,first_name, salary
from employees
where salary >= 5000 and salary <= 12000
order by 1;

--2. 사원들이 소속된 부서의 부서명을 중복없이 조회하기
select distinct B.department_id, B.department_name
from employees A, departments B
where A.department_id = B.department_id
order by 1;

--3. 2007년에 입사한 사원의 아이디, 이름, 입사일을 조회하기
select employee_id, first_name, hire_date
from employees
where hire_date >= '2007/01/01' and  hire_date < '2008/01/01'
order by 1;

--4. 급여가 5000이상 12000이하이고, 20번과 50번 부서에 소속된 사원의 아이디, 이름, 급여, 소속부서명을 
--   조회하기
select A.employee_id, A.first_name, A.salary, B.department_name
from employees A, departments B
where A.salary >= 5000 and A.salary <= 12000
and A.department_id in (20, 50)
and A.department_id = B.department_id
order by 1;

--5. 100직원에게 보고하는 사원의 아이디, 이름, 급여, 급여등급을 조회하기
select A.employee_id, A.first_name, A.salary, B.gra
from employees A, job_grades B
where A.manager_id = 100
and A.salary >= B.lowest_sal and A.salary <= b.highest_sal
order by 1;

--6. 80번 부서에 소속되어 있고, 80번 부서의 평균급여보다 적은 급여를 받는 사원의 아이디, 이름, 
--   급여를 조회하기
select avg(salary) avg
from employees
where department_id = 80;

select employee_id, first_name, salary
from employees
where department_id = 80
and salary <= (select avg(salary) avg
                from employees
                where department_id = 80)
order by 1;

--7. 50번 부서에 소속된 사원 중에서 해당 직종의 최소급여보다 2배 이상의 급여를 받는 사원의 아이디, 
--   이름, 급여를 조회하기
select A.employee_id, A.first_name, A.salary
from employees A, jobs B
where A.department_id = 50
and A.job_id = B.job_id
and A.salary >= b.min_salary * 2;

--8. 사원들 중에서 자신의 상사보다 먼저 입사한 사원의 아이디, 이름, 입사일, 상사의 이름, 
--   상사의 입사일을 조회하기
select A.employee_id, A.first_name, A.hire_date, B.first_name, B.hire_date
from employees A, employees B
where a.manager_id = B.employee_id
and A.hire_date < B.hire_date
order by 1;

--9. Steven King과 같은 부서에서 근무하는 사원의 아이디와 이름을 조회하기
select B.employee_id, B.first_name
from employees A, employees B
where A.first_name || ' ' || A.last_name = 'Steven King'
and A.department_id = B.department_id
order by 1;

select employee_id, first_name
from employees
where department_id in (select department_id
                        from employees
                        where first_name = 'Steven' and last_name = 'King');

--10. 관리자별 사원수를 조회하기, 관리자 아이디, 사원수를 출력한다. 관리자 아이디순으로 오름차순 정렬
select manager_id, count(*)
from employees
group by manager_id
order by 1;

--11. 커미션을 받는 사원의 아이디, 이름, 급여, 커미션을 조회하기
select employee_id, first_name, salary, commission_pct
from employees
where commission_pct is not null
order by 1;

--12. 급여를 가장 많이 받는 사원 3명의 아이디, 이름, 급여를 조회하기
select employee_id, first_name, salary
from (select salary, employee_id, first_name
      from employees
      order by 1 desc)
where rownum <= 3;

--13. 'Ismael'과 같은 해에 입사했고, 같은 부서에 근무하는 사원의 아이디, 이름, 입사일을 조회하기
select hire_date, department_id
from employees
where first_name = 'Ismael';

select A.employee_id, A.first_name, A.hire_date
from employees A, (select hire_date, department_id
                   from employees
                   where first_name = 'Ismael') B
where to_char(A.hire_date, 'yyyy') = to_char(B.hire_date, 'yyyy')
and A.department_id = B.department_id
order by 1;

--14. 'Renske'에게 보고받는 사원의 아이디와 이름, 급여, 급여 등급을 조회하기
select a.employee_id, A.first_name, A.salary, C.gra
from employees A, employees B, job_grades C
where B.first_name = 'Renske'
and B.manager_id = A.employee_id
and A.salary >= c.lowest_sal and A.salary <= c.highest_sal;

--15. 사원테이블의 급여를 기준으로 급여등급을 조회했을 때, 급여등급별 사원수를 조회하기
select B.gra, count(*)
from employees A, job_grades B
where A.salary >= b.lowest_sal and A.salary <= b.highest_sal
group by B.gra
order by 1;

-- E도 포함해서 조회 해보자
select gra, 0
from job_grades
where gra not in (select B.gra
                  from employees A, job_grades B
                  where A.salary >= b.lowest_sal and A.salary <= b.highest_sal
                  group by B.gra)
union
select B.gra, count(*)
from employees A, job_grades B
where A.salary >= b.lowest_sal and A.salary <= b.highest_sal
group by B.gra;

select Y.gra, nvl(cnt,0)
from (select B.gra, count(*) cnt
      from employees A, job_grades B
      where A.salary >= b.lowest_sal and A.salary <= b.highest_sal
      group by B.gra) X, job_grades Y
where X.gra(+) = Y.gra
order by 1;

--16. 입사자가 가장 적은 년도와 그 해에 입사한 사원수를 조회하기
select to_char(hire_date, 'yyyy') year, count(*) cnt
from employees
group by to_char(hire_date, 'yyyy')
order by cnt;

select year, cnt
from (select to_char(hire_date, 'yyyy') year, count(*) cnt
      from employees
      group by to_char(hire_date, 'yyyy')
      order by cnt)
where rownum = 1;

--17. 관리자별 사원수를 조회했을 때 관리자하는 사원수가 10명을 넘는 관리자의 아이디와 사원수를 조회하기
select manager_id, count(*) cnt
from employees
group by manager_id
order by 1;

select manager_id, cnt
from (select manager_id, count(*) cnt
      from employees
      group by manager_id)
where cnt >= 10
order by 1;

--18. 'Europe'지역에서 근무중이 사원의 아이디, 이름, 소속부서명, 소재지 도시명, 나라이름을 조회하기
select E.employee_id, E.first_name, D.department_name, c.city, b.country_name
from regions A, countries B, locations C, departments D, employees E
where a.region_name = 'Europe'
and a.region_id = b.region_id
and B.country_id = c.country_id
and c.location_id = d.location_id
and d.department_id = E.department_id;

--19. 전체 사원의 사원아이디, 이름, 급여, 소속부서아이디, 소속부서명, 상사의 이름을 조회하기
select A.employee_id, A.first_name, A.salary
    , C.department_id, C.department_name
    , B.first_name
from employees A, employees B, departments C
where A.manager_id = B.employee_id(+)
and A.department_id = C.department_id(+)
order by 1;

--20. 50번 부서에 근무중이 사원들의 급여를 500달러 인상시키기
update employees
set
    salary = salary + 500
where department_id = 50;

--21. 사원의 아이디, 이름, 급여, 보너스를 조회하기,
--    보너스는 20000달러 이상은 급여의 10%, 10000달러 이상은 급여의 15%, 그 외는 급여의 20%를 지급한다.
select employee_id
    , first_name
    , salary
    , case 
        when salary >= 20000 then salary * 0.1
        when salary >= 10000 then salary * 0.15
        else salary * 0.2
      end bonus
from employees
order by 1;

--22. 소속부서에서 입사일이 늦지만, 더 많은 급여를 받는 사원의 이름, 입사일, 소속부서명, 급여를 조회하기
select distinct A.employee_id, A.first_name, A.hire_date, A.salary
from employees A, employees B
where A.department_id = B.department_id
and A.hire_date > B.hire_date
and A.salary > B.salary
order by 1;

--23. 부서별 평균급여를 조회했을 때 부서별 평균급여가 10000달러 이하인 부서의 아이디, 부서명, 평균급여를
--    조회하기 (평균급여는 소숫점 1자리까지만 표시)
select department_id, trunc(avg(salary),1)
from employees
group by department_id
order by 1;

select A.department_id, A.department_name, B.avg_salary
from departments A, (select department_id, trunc(avg(salary),1) avg_salary
                     from employees
                     group by department_id) B
where B.avg_salary <= 10000 
and A.department_id = B.department_id
order by 1;

-- 다른 방법
select A.department_id, B.department_name, trunc(avg(A.salary)) dept_avg_salary
from employees A, departments B
where A.department_id = B.department_id
group by A.department_id, B.department_name
having avg(A.salary) <= 10000
order by 1;

--24. 사원들 중에서 자신 종사하고 있는 직종의 최대급여와 동일한 급여를 받는 사원의 아이디, 이름, 급여를
--    조회하기
select A.employee_id, A.first_name, A.salary
from employees A, jobs B
where A.job_id = B.job_id
and A.salary = b.max_salary;

----25. 분석함수를 사용해서 사원들을 급여순으로 내림차순 정렬하고, 순번을 부여했을 때 6~10번째 속하는 순번,
--    사원의 아이디, 이름, 급여, 급여등급을 조회하기
select row_number() over (order by salary desc) num
     , employee_id, first_name, salary
from employees;

select num, employee_id, first_name, salary
from (select row_number() over (order by salary desc) num
           , employee_id, first_name, salary
      from employees)
where num >= 6 and num <= 10;

select A.num, A.employee_id, A.first_name, A.salary, B.gra
from (select num, employee_id, first_name, salary
      from (select row_number() over (order by salary desc) num
                 , employee_id, first_name, salary
           from employees)
      where num >= 6 and num <= 10) A, job_grades B
where A.salary >= B.lowest_sal and A.salary <= B.highest_sal
order by 1;