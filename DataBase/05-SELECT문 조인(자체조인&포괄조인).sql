-- 셀프조인(자체조인)
-- 101번 사원의 이름, 직종, 자신의 상사이름을 조회하기
select EMP.first_name 직원명, EMP.job_id "직원의 직종", MGR.first_name "상사의 이름"
from employees EMP, employees MGR
where EMP.employee_id = 101
and EMP.manager_id = MGR.employee_id;

-- 60번 부서에 근무중인 직원의 아이디 이름, 직원의 직종, 상사의 이름, 상사의 직종,
-- 직원의 부서 아이디, 직원의 소속 부서명, 부서관리자 아이디, 부서관리자 이름을 조회하기
select EMP.employee_id 직원아이디
    , EMP.first_name 직원이름
    , EMP.job_id "직원의 직종"
    , MGR.first_name "상사의 이름"
    , MGR.job_id "상사의 직종"
    , EMP.department_id "소속부서 아이디"
    , DPT.department_name "소속부서 이름"
    , DPT.manager_id "관리자 아이디"
    , DPTMGR.first_name "관리자 이름"
from employees EMP, employees MGR, departments DPT, employees DPTMGR
where EMP.department_id = 60
and EMP.manager_id = MGR.employee_id        -- 직원과 상사간의 조인조건
and EMP.department_id = DPT.department_id   -- 직원과 소속부서간에 조인조건
and DPT.manager_id = DPTMGR.employee_id     -- 부서와 부서관리자간에 조인조건
order by EMP.employee_id;

-- 포괄조인
-- 부서아이디, 부서명, 부서관리자아이디, 부서관리자 이름 조회하기
select A.department_id, A.department_name, A.manager_id, B.first_name
from departments A, employees B
where A.manager_id = B.employee_id(+)
order by A.department_id;

-- 모든 직원의 이름, 급여, 직종아이디, 소속부서명을 조회하기
select *
from employees A, departments B
where A.department_id = B.department_id(+)
order by A.employee_id;