-- 데이터 그룹의 생성
-- group by 절을 사용하면 테이블의 정보를 작은 그릅으로 나누어서
-- 그룹당 데이터를 집계할 수 있다.
-- 소속부서별 사원수를 조회하기, 단, 소속부서가 지정되지 않은 직원은 제외한다.
select department_id, count(*)
from employees
where department_id is not null
group by department_id
order by department_id;

-- 관리자별 자신이 관리하는 직원수를 조회하기, 단, 관리자가 지정되지 않은 직원은 제외
-- 관리자아이디, 직원수를 조회한다.
select manager_id, count(*)
from employees
where manager_id is not null
group by manager_id
order by manager_id;

-- 부서별 직원수를 조회하기, 단 부서가 저징되지 않은 사원은 제외
-- 부서이름, 직원수를 조회하기
select B.department_name, count(*)
from employees A, departments B
where A.department_id is not null
and A.department_id = B.department_id
group by B.department_name;

-- 도시별 부서별 직원수를 조회하기
-- 도시명, 부서명, 직원수
select C.city, B.department_name, count(*)
from employees A, departments B, locations C
where A.department_id = B.department_id
and B.location_id = C.location_id
group by C.city, B.department_name
order by 1, 2;

-- having 절 사용해서 그룹결과 제한하기
-- 급여별 사원수를 조회했을 떄, 직원수가 10명 이상인 급여별 직원수 정보만 조회하기
select trunc(salary,-3) salary, count(*)
from employees
group by trunc(salary, -3)
having count(*) >= 10
order by salary;

-- 부서별 평균급여 조회하기
-- 부서명과 부서멸 평균급여를 조회한다. 평균급여는 소숫점이하는 버린다.
-- 평균급여가 5000달러 미만인 부서만 조회하기
select B.department_name, trunc(avg(salary)) avg_salary
from employees A, departments B
where A.department_id = B.department_id
group by B.department_name
having avg(salary) < 5000
order by B.department_name;

-- 그룹함수의 중첩
-- 부서별로 직원수를 조회했을때 가장 많은 사원수는 몇명일까?
select max(count(*))
from employees
group by department_id;

-- 급여 등급별 사원수를 조회하기
-- 급여등급과 사원수, 평균급여를 표시한다.
select B.gra, count(*), trunc(avg(A.salary))
from employees A, job_grades B
where A.salary >= B.lowest_sal and A.salary <= B.highest_sal
group by B.gra
order by 1;

-- 서브쿼리
-- 이름이 Neena인 사원과 같은 해에 입사한 사원들의 이름, 입사한일을 조회하기
select to_char(hire_date, 'yyyy')
from employees
where first_name = 'Neena';

select first_name, hire_date
from employees
where to_char(hire_date, 'yyyy') = (select to_char(hire_date, 'yyyy')
                                    from employees
                                    where first_name = 'Neena');
                                    
                                    
-- Stephen과 같은 직종에서 일을 하는 직원들의 아이디와 이름, 급여를 조회하기
select employee_id, first_name, salary, job_id
from employees
where job_id = (select job_id
                from employees
                where first_name = 'Stephen');

-- Mozhe와 같은 직종의 일을하고,
-- Mozhe의 급여보다 급여를 많이 받는 직원의 아이디와 이름, 급여를 조회하기
select employee_id, first_name, salary
from employees
where job_id = (select job_id
                from employees
                where first_name = 'Mozhe')
and salary > (select salary
              from employees
              where first_name = 'Mozhe');
              
-- 전체 직원의 평균급여보다 적은 급여를 받는 직원들의 아이다, 이름, 급여를 조회하기
select employee_id, first_name, salary
from employees
where salary < (select avg(salary)
                from employees);
                
-- 가장 적은 급여를 받는 직원들의 아이디, 이름, 급여를 조회하기
select employee_id, first_name, salary
from employees
where salary = (select min(salary)
                from employees);
                
-- 부서별 사원수를 조회했을 때 사원수가 가장 많은 부서의 아이디와, 사원수를 조회하기
-- with 절을 사용해서 중복 실행되는 쿼리작업을 한 번만 실행되게 할 수 있다.
-- 쿼리의 실행성능을 향상시킨다.
with deptCnt
as (select department_id, count(*) cnt
    from employees
    group by department_id)
select department_id, cnt
from deptCnt
where cnt = (select max(cnt)
            from deptCnt);
            
-- 다중행 서브쿼리
-- 50번 부서에 근무했던 적이 있는 사원의 아이디, 이름, 직종, 소속부서아이디, 조회하기
select employee_id, first_name, job_id, department_id
from employees
where employee_id in (select employee_id
                    from job_history
                    where department_id = 50);

-- 다중행 서크쿼리 대신, 조인을 활용해서 조인하기
select A.employee_id, A.first_name, A.job_id, A.department_id
from employees A, job_history B
where A.employee_id = B.employee_id
and B.department_id = 50;

-- Seattle에 위치하고 있는 부서의 관리자 직원아이디, 이름을 조회하기
select employee_id, first_name
from employees
where employee_id in (select manager_id
                        from departments
                        where location_id = (select location_id
                                                from locations
                                                where city = 'Seattle'));
                                                
select A.employee_id, A.first_name
from employees A, departments B, locations C
where A.employee_id = B.manager_id
and B.location_id = C.location_id
and C.city = 'Seattle';
