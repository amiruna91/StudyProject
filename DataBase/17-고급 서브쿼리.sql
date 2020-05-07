-- 다중열 서브쿼리 사용하기
-- 'Karen'과 같은 직종에 종사하고,
-- 같은 부서에 소속되어 있는 사원의 아이디, 이름, 직종, 부서아이디 조회하기
select job_id, department_id
from employees
where first_name = 'Karen';

select *
from employees
where (job_id, department_id) in (select job_id, department_id
                                  from employees
                                  where first_name = 'Karen');
                                  
-- 부서별 최고 급여를 받는 사원의 아이디, 이름, 급여, 부서아이디를 조회하기
select department_id, max(salary)
from employees
where department_id is not null
group by department_id;

select employee_id, first_name, salary, department_id, job_id
from employees
where (department_id, salary) in (select department_id, max(salary)
                                  from employees
                                  where department_id is not null
                                  group by department_id)
order by 1;

-- 스칼라 서브쿼리 사용하기
-- 전체 평균보다 적은 급여를 받는 사원의 아이디, 이름, 급여, 평균급여, 
-- 평균급여와의 차이를 조회하기
select employee_id, first_name, salary
     , trunc((select avg(salary) from employees) - salary) salary_gap
from employees
where salary < (select avg(salary)
                from employees)
order by salary_gap;

-- 20000달러 이상은 전체 평균급여의 10%을 보너스로, 10000달러 이상은 15%, 그 외는 20%를
-- 보너스로 지급하려고 한다. 아이디, 이름, 급여, 보너스조회하기
select employee_id
     , first_name
     , salary
     , case
        when salary >= 20000 then trunc((select avg(salary) from employees) * 0.1)
        when salary >= 10000 then trunc((select avg(salary) from employees) * 0.15)
        else trunc((select avg(salary) from employees) * 0.2)
       end bonus
from employees;

-- 전체 평균급여보다 급여를 많이 받는 사원의 이름, 급여를 조회하기
select first_name, salary
from employees
where salary > (select avg(salary)
                from employees);
                
-- 자신이 소속된 소속부서의 평균급여보다 많은 급여를 받는 사원의 이름, 급여를 조회하기
select outter.employee_id, outter.first_name, outter.salary, outter.department_id
from employees outter
where outter.commission_pct is null
and salary > (select avg(inners.salary)
                from employees inners
                where outter.department_id = inners.department_id);
-- 외부 SQL이 실행 되어서 행을 가져온다.(후보행)
-- 후보행의 행마다 department_id값을 가져와서 서브쿼리를 실행한다.
-- 서브쿼리의 결과값을 사용해서 후보행을 검증한다.
-- 후보행이 남지 않을 때까지 반복한다.

-- 부서아이디, 부서명, 해당부서의 사원수를 조회하기
select outter.department_id
     , outter.department_name
     , (select count(*)
        from employees
        where department_id = outter.department_id) cnt
from departments outter;

-- exists 연산자 사용하기
-- 부하직원을 가지고 있는 직원을 조회하기
select *
from employees 상사
where (select count(*)
       from employees 부하
       where 부하.manager_id = 상사.employee_id) > 0;   -- count() 사용 비추천
       
select *
from employees 상사
where exists (select 1
              from employees 부하
              where 부하.manager_id = 상사.employee_id);    -- exists 사용 추천
              
-- with 절
with 
dept_costs AS -- 부서이름, 부서총급여
(select B.department_name, sum(A.salary) as dept_total
 from employees A, departments B
 where A.department_id = B.department_id
 group by B.department_name),
avg_costs AS    -- 부서별 총 급여에 대한 평균급여
(select sum(dept_total)/count(*) as dept_avg
 from dept_costs) -- 가상의 테이블
select *
from dept_costs
where dept_total > (select dept_avg     -- 부서총급여가 평균급여보다
                    from avg_costs)
order by department_name;