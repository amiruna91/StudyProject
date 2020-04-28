 -- 뷰 만들기
 create or replace view emp_salary_grade_view
		   as select A.employee_id, A.first_name, A.salary, B.gra
		      from employees A, job_grades B
		      where A.salary >= B.lowest_sal and A.salary <= B.highest_sal;
              
select *
from emp_salary_grade_view
where gra = 'F';

create or replace view emp_salary_view
		   as select employee_id, first_name, salary
			    , (salary*4*12 + salary*nvl(commission_pct, 0)*4*12) all_salary
		      from employees;

select *
from emp_salary_view
where employee_id = 100;

-- 인라인뷰 사용하기
select id, name, salary, deptid
from (select 
        employee_id id
        , first_name || ' ' || last_name name
        , salary
        , department_id deptid
        from employees)
where deptid = 60;
-- 전체 직원 중에서 자신이 소속된 부서의 평균급여보다 급여를 적게 받는 
-- 사원의 아이디, 이름, 급여, 부서아이디, 부서의 평균급여
select A.employee_id
     , A.first_name
     , A.salary
     , B.deptid
     , B.avg_salary
from employees A, (select department_id deptid
                          , trunc(avg(salary)) avg_salary
                   from employees
                   where department_id is not null
                   group by department_id) B 
where A.department_id = B.deptid
and A.salary < B.avg_salary
order by 1 ASC, 4 ASC;

-- 부서아이디, 부서명, 부서별 사원수, 도시명을 출력하기
select department_id, count(*) count
from employees
where department_id is not null
group by department_id;

select A.department_id, A.department_name, C.cnt, B.city
from departments A, locations B, (select department_id, count(*) cnt
                                  from employees
                                  where department_id is not null
                                  group by department_id) C
where A.location_id = B.location_id
and A.department_id = C.department_id
order by 1 asc;