-- 1. employees 테이블에서 사원들의 모든 업무아이디를 조회하기
select job_id
from employees;

-- 2. 급여를 12,000달러 이상 받는 사원의 이름과 급여를 조회하기
select employee_id, salary
from employees
where salary >= 12000;

-- 3. 사원번호가 176번 사원의 아이디와 이름 직종을 조회하기
select employee_id, first_name, job_id
from employees
where employee_id = 176;

-- 4. 급여를 12,000달러 이상 15,000달러 이하 받는 사원들의 사원 아이디와 이름과 급여를 조회하기
select employee_id, first_name, salary
from employees
where salary >= 12000
and salary <= 15000;

-- 5. 2000년 1월 1일부터 2000년 6월 30일 사이에 입사한 사원의 아이디, 이름, 업무아이디, 입사일을 조회하기
select employee_id, first_name, job_id, hire_date
from employees
where hire_date >= '2005/01/01'
and hire_date < '2005/07/01';

-- 6. 급여가 5,000달러와 12,000달러 사이이고, 부서번호가 20 또는 50인 사원의 이름과 급여를 조회하기
select first_name, salary
from employees
where department_id in (20, 50)
and salary >= 5000
and salary <= 12000;

-- 7. 관리자가 없는 사원의 이름과 업무아이디를 조회하기
select first_name, job_id
from employees
where manager_id is null;

-- 8. 커미션을 받는 모든 사원의 이름과 급여, 커미션을 급여 및 커미션의 내림차순으로 정렬해서 조회하기
select first_name, salary, commission_pct
from employees
where commission_pct is not null
order by salary asc, commission_pct asc;

-- 9. 이름의 2번째 글자가 e인 모든 사원의 이름을 조회하기
select first_name
from employees
where first_name like '_e%';

-- 10. 업무아이디가 ST_CLERK 또는 SA_REP이고 급여를 2,500달러, 3,500달러, 7,000달러 받는 모든 사원의 이름과 업무아이디, 급여를 조회하기
select first_name, job_id, salary
from employees
where job_id in ('ST_SLERK', 'SA_REP')
and salary in (2500, 3500, 7000);

-- 11. 모든 사원의 이름과 입사일, 근무 개월 수를 계산하여 조회하기, 근무개월 수는 정수로 반올림하고, 근무개월수를 기준으로 오름차순으로 정렬하기
select first_name, hire_date, round(months_between(sysdate, hire_date)) 근무개월수
from employees
order by 3;

-- 12. 사원의 이름과 커미션을 조회하기, 커미션을 받지 않는 사원은 '없음'으로 표시하기
select first_name, nvl(to_char(commission_pct), '없음')
from employees;

-- 13. 모든 사원의 이름, 부서번호, 부서이름을 조회하기
select A.first_name, B.department_id, B.department_name
from employees A, departments B
where A.department_id = B.department_id;

-- 14. 80번부서에 소속된 사원의 이름과 업무아이디, 업무제목, 부서이름을 조회하기
select A.employee_id, B.job_title, C.department_name
from employees A, jobs B, departments C
where A.department_id = 80
and A.job_id = B.job_id
and A.department_id = C.department_id;

-- 15. 커미션을 받는 모든 사원의 이름과 업무아이디, 업무제목, 부서이름, 부서소재지 도시명을 조회하기
select A.first_name, B.job_id, B.job_title, C.department_name
    , d.street_address, D.city
from employees A, jobs B, departments C, locations D
where a.commission_pct is not null
and A.job_id = B.job_id
and A.department_id = C.department_id
and C.location_id = D.location_id;

-- 16. 유럽에 소재지를 두고 있는 모든 부서아이디와 부서이름을 조회하기
select A.department_id, A.department_name
from departments A, locations B, countries C, regions D
where d.region_name = 'Europe'
and D.region_id = C.region_id
and C.country_id = B.country_id
and B.location_id = A.location_id;

-- 17. 사원의 이름과 소속부서명, 급여, 급여 등급을 조회하기
select A.first_name, B.department_name, A.salary, C.gra
from employees A, departments B, job_grades C
where A.department_id = B.department_id
and A.salary >= C.lowest_sal and A.salary <= C.highest_sal;

-- 18. 사원의 이름과 소속부서명, 소속부서의 관리자명을 조회하기, 소속부서가 없는 사원은 소속부서명 '없음, 관리자명 '없음'으로 표시하기
select A.first_name, nvl(B.department_name, '없음'), nvl(c.first_name, '없음')
from employees A, departments B, employees C
where A.department_id = B.department_id(+)
and B.manager_id = C.employee_id(+);

-- 19. 모든 사원의 급여 최고액, 급여 최저액, 급여 총액, 급여 평균액을 조회하기
select max(salary), min(salary), sum(salary), avg(salary)
from employees;

-- 20. 업무별 급여 최고액, 급여 최저액, 급여 총액, 급여 평균액을 조회하기
select job_id, max(salary), min(salary), sum(salary), avg(salary)
from employees
group by job_id;

-- 21. 각 업무별 사원수를 조회해서 가장 사원수가 많은 업무 3개를 조회하기, 업무아이디와 사원수 표시하기
select A.job_id, a.cnt
from (select job_id, count(*) cnt
        from employees
        group by job_id
        order by cnt desc) A
where rownum <= 3;

-- 22. 관리자별 사원수를 조회하기, 관리자 이름과 그 관리자가 관리하는 사원수 표시하기

-- 23. 각 부서에 대해 부서이름, 관리자 이름, 소속사원 수, 소속사원들의 평균 급여를 조회하기

-- 24. Steven King과 같은 부서에 속한 사원의 이름과 입사일을 조회하기

-- 25. 소속 부서의 평균급여보다 많은 급여를 받는 사원의 아이디와 사원이름, 급여, 그 부서의 평균 급여를 조회하기

-- 26. Kochhar과 동일한 급여 및 커미션을 받는 모든 사원의 이름과 입사일 급여를 조회하기, 결과에 Kochhar은 포함시키지 않기

-- 27. 소속 부서에 입사일이 늦지만, 더 많은 급여를 받는 사원의 이름과 소속부서명, 급여를 조회하기

-- 28. 관리자 아이디, 관리자명, 그 관리자가 관리하는 사원수, 그 관리자가 소속된 부서를 조회하기
