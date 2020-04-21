-- 1.  �ý����� ���� ��¥�� �ð� ��ȸ�ϱ� (dual ���)
select sysdate
from dual;

-- 2.  �޿��� 5000�޷� �̻�ް�, 2005�⿡ �Ի��� ������ ���̵�, �̸�, �޿�, �Ի����� ��ȸ�ϱ�
select employee_id, first_name, salary, hire_date
from employees
where salary >= 5000
and hire_date >= '2005/01/01' and hire_date <= '2006/01/01'
order by employee_id;

-- 3.  �̸��� e�� E�� ���Ե� ���� �߿��� �޿��� 10000�޷� �̻� �޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
select employee_id, first_name, salary
from employees
where (first_name like '%e%' or first_name like '%E%')
and salary >= 10000
order by employee_id;

-- 4.  �Ի�⵵�� ������� 4���� �Ի��� �������� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
select employee_id, first_name, hire_date
from employees
where to_char(hire_date, 'mm') = '04'
order by employee_id;

-- 5.  2006�� ��ݱ�(1/1 ~ 6/30)�� �Ի��� �������� ���̵�, �̸�, �Ի��� ��ȸ�ϱ�
select employee_id, first_name, hire_date
from employees
where hire_date >= '2006/01/01' and hire_date < '2006/07/01'
order by employee_id;

-- 6.  50�� �μ��� �Ҽӵ� �������� �޿��� 13%�λ��Ű���� �Ѵ�.
--     �������̵�, �̸�, ���� �޿�, �λ�� �޿��� ��ȸ�ϱ�
--     �λ�� �޿��� �Ҽ��� ���ϴ� ������.
select employee_id, first_name, salary
    , trunc(salary*1.13)  increase_salary
from employees
where department_id = 50
order by employee_id;

-- 7.  50�� �μ��� �Ҽӵ� �������� �޿��� ��ȸ�Ϸ��� �Ѵ�.
--     ���� ���̵�, �̸�, �޿� �׸���, �޿� 1000�޷��� *�� �ϳ��� ǥ���϶�.
--     120 Matthew 8000 ********
--     122 Shanta  6500 ******
select employee_id, first_name, salary, lpad('*',trunc(salary/1000),'*')
from employees
where department_id = 50
order by employee_id;

-- 8.  �����ڰ� �����Ǿ� ���� �ʴ� �μ��� 
--     �μ����̵�, �μ���, ��ġ���̵�, ���ø�, �ּҸ� ��ȸ�ϱ�
select A.department_id, A.department_name, A.location_id
    , b.city, B.street_address
from departments A, locations B
where manager_id is null
and A.location_id = B.location_id
order by department_id;

-- 9.  'Executive' �μ��� �Ҽӵ� ������ �������̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
select A.employee_id, A.first_name, A.job_id, A.salary
from employees A, departments B
where b.department_name = 'Executive'
and a.department_id = b.department_id
order by employee_id;

-- 10. 100�� ������ �μ������ڷ� ������ �μ��� �Ҽӵ� ������ �������̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
select B.employee_id, B.first_name, B.job_id, B.salary
from departments A, employees B
where A.manager_id = 100
and A.department_id = B.department_id
order by B.employee_id;

-- 11. 10, 20, 30�� �μ��� �Ҽӵ� �������� �������̵�, �̸�, �޿�, �޿������ ��ȸ�ϱ�
select A.employee_id, A.first_name, A.salary, B.gra
from employees A, job_grades B
where A.department_id in (10, 20, 30)
and A.salary between B.lowest_sal and B.highest_sal
order by A.employee_id;

-- 12. �������� ���������� �������� �� �ڽ��� �����ϰ� �ִ� ������ �����޿��� �ް� �ִ�
--     ������ ���̵�, �̸�, �޿�, �������̵�, ���������޿��� ��ȸ�ϱ�
select A.employee_id, A.first_name, A.salary
    , B.job_id, B.min_salary
from employees A, jobs B
where A.job_id = b.job_id
and A.salary = B.min_salary
order by A.employee_id;

-- 13. Ŀ�̼��� �޴� �������� �������̵�, �̸�, Ŀ�̼�, �޿�, �������̵�, ��������, �޿�, �ҼӺμ� ���̵�, �μ����� ��ȸ�ϱ�
select A.employee_id, A.first_name, A.commission_pct, A.salary
    , B.job_id, B.job_title
    , C.department_id, C.department_name
from employees A, jobs B, departments C
where a.commission_pct is not null
and A.job_id = B.job_id
and A.department_id = C.department_id
order by A.employee_id;

-- 14. 'Canada'���� �ٹ��ϰ� �ִ� ������ ���̵�, �̸�, �ҼӺμ� ���̵�, �ҼӺμ���, ��ġ ���̵�, ���ø�, �ּҸ� ��ȸ�ϱ�
select D.employee_id, D.first_name
    , C.department_id, C.department_name
    , B.location_id, B.city, B.street_address
from countries A, locations B, departments C, employees D
where A.country_name = 'Canada'
and A.country_id = B.country_id
and B.location_id = C.location_id
and C.department_id = D.department_id
order by D.employee_id;

-- 15. ��� ������ �������̵�, �̸�, �������̵�, ��������, �޿�, �޿����, �ҼӺμ� ���̵�, �ҼӺμ���, ���ø��� ��ȸ�ϱ�
select A.employee_id, A.first_name
    , B.job_id, B.job_title
    , A.salary, D.gra, C.department_name, E.city
from employees A, jobs B, departments C, job_grades D, locations E
where A.job_id = B.job_id
and A.department_id = C.department_id
and A.salary between D.lowest_sal and D.highest_sal
and C.location_id = E.location_id
order by A.employee_id;

-- 16. �޿��� 5000�޷� ���Ϸ� �޴� �������� ���̵�, �̸�, ����, �ҼӺμ� ���̵�, �ҼӺμ���, �ҼӺμ� ������ �������̵�, 
--     �ҼӺμ� ������ �����̸��� ��ȸ�ϱ�
select A.employee_id, A.first_name, A.job_id, A.salary
    , B.department_id, B.department_name, B.manager_id
    , C.first_name
from employees A, departments B, employees C
where A.salary <= 5000
and A.department_id = B.department_id
and B.manager_id = C.employee_id
order by A.employee_id;

-- 17. 'Asia'������ �������� �ΰ� �ִ� �μ��� ���̵�, �μ���, �μ������� �̸��� ��ȸ�ϱ�
select D.department_id, D.department_name, E.first_name
from regions A, countries B, locations C, departments D, employees E
where A.region_name = 'Asia'
and A.region_id = B.region_id
and B.country_id = C.country_id
and C.location_id = D.location_id
and D.manager_id = E.employee_id
order by D.department_id;

-- 18. 101�� ������ �ٹ��ߴ� �μ����� �ٹ����� ������ ���̵�, �̸�, �μ����̵�, �μ����� ��ȸ�ϱ�
select DISTINCT B.employee_id, B.first_name, C.department_id, C.department_name
from job_history A, employees B, departments C
where A.employee_id = 101
and A.department_id = B.department_id
and A.department_id = C.department_id;

-- 19. �����߿��� �ڽ��� �����ϰ� �ִ� ������ �ְ�޿� 50%�̻��� �޿��� �ް� �ִ� 
--     ������ ���̵�, �̸�, �޿�, �������̵�, ���� �ְ�޿��� ��ȸ�ϱ�
select A.employee_id, A.first_name, A.salary, b.job_id, b.max_salary 
from employees A, jobs B
where A.job_id = B.job_id
and A.salary >= b.max_salary/2
order by B.job_id;

-- 20. �̱�(US)�� ��ġ�ϰ� �ִ� �μ��� ���̵�, �̸�, ��ġ��ȣ, ���ø�, �ּҸ� ��ȸ�ϱ� 
select a.department_id, a.department_name, a.location_id, b.city, b.street_address
from departments A, locations B
where b.country_id = 'US'
and A.location_id = b.location_id
order by a.department_id;

