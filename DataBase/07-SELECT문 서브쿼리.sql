-- ������ �׷��� ����
-- group by ���� ����ϸ� ���̺��� ������ ���� �׸����� �����
-- �׷�� �����͸� ������ �� �ִ�.
-- �ҼӺμ��� ������� ��ȸ�ϱ�, ��, �ҼӺμ��� �������� ���� ������ �����Ѵ�.
select department_id, count(*)
from employees
where department_id is not null
group by department_id
order by department_id;

-- �����ں� �ڽ��� �����ϴ� �������� ��ȸ�ϱ�, ��, �����ڰ� �������� ���� ������ ����
-- �����ھ��̵�, �������� ��ȸ�Ѵ�.
select manager_id, count(*)
from employees
where manager_id is not null
group by manager_id
order by manager_id;

-- �μ��� �������� ��ȸ�ϱ�, �� �μ��� ��¡���� ���� ����� ����
-- �μ��̸�, �������� ��ȸ�ϱ�
select B.department_name, count(*)
from employees A, departments B
where A.department_id is not null
and A.department_id = B.department_id
group by B.department_name;

-- ���ú� �μ��� �������� ��ȸ�ϱ�
-- ���ø�, �μ���, ������
select C.city, B.department_name, count(*)
from employees A, departments B, locations C
where A.department_id = B.department_id
and B.location_id = C.location_id
group by C.city, B.department_name
order by 1, 2;

-- having �� ����ؼ� �׷��� �����ϱ�
-- �޿��� ������� ��ȸ���� ��, �������� 10�� �̻��� �޿��� ������ ������ ��ȸ�ϱ�
select trunc(salary,-3) salary, count(*)
from employees
group by trunc(salary, -3)
having count(*) >= 10
order by salary;

-- �μ��� ��ձ޿� ��ȸ�ϱ�
-- �μ���� �μ��� ��ձ޿��� ��ȸ�Ѵ�. ��ձ޿��� �Ҽ������ϴ� ������.
-- ��ձ޿��� 5000�޷� �̸��� �μ��� ��ȸ�ϱ�
select B.department_name, trunc(avg(salary)) avg_salary
from employees A, departments B
where A.department_id = B.department_id
group by B.department_name
having avg(salary) < 5000
order by B.department_name;

-- �׷��Լ��� ��ø
-- �μ����� �������� ��ȸ������ ���� ���� ������� ����ϱ�?
select max(count(*))
from employees
group by department_id;

-- �޿� ��޺� ������� ��ȸ�ϱ�
-- �޿���ް� �����, ��ձ޿��� ǥ���Ѵ�.
select B.gra, count(*), trunc(avg(A.salary))
from employees A, job_grades B
where A.salary >= B.lowest_sal and A.salary <= B.highest_sal
group by B.gra
order by 1;

-- ��������
-- �̸��� Neena�� ����� ���� �ؿ� �Ի��� ������� �̸�, �Ի������� ��ȸ�ϱ�
select to_char(hire_date, 'yyyy')
from employees
where first_name = 'Neena';

select first_name, hire_date
from employees
where to_char(hire_date, 'yyyy') = (select to_char(hire_date, 'yyyy')
                                    from employees
                                    where first_name = 'Neena');
                                    
                                    
-- Stephen�� ���� �������� ���� �ϴ� �������� ���̵�� �̸�, �޿��� ��ȸ�ϱ�
select employee_id, first_name, salary, job_id
from employees
where job_id = (select job_id
                from employees
                where first_name = 'Stephen');

-- Mozhe�� ���� ������ �����ϰ�,
-- Mozhe�� �޿����� �޿��� ���� �޴� ������ ���̵�� �̸�, �޿��� ��ȸ�ϱ�
select employee_id, first_name, salary
from employees
where job_id = (select job_id
                from employees
                where first_name = 'Mozhe')
and salary > (select salary
              from employees
              where first_name = 'Mozhe');
              
-- ��ü ������ ��ձ޿����� ���� �޿��� �޴� �������� ���̴�, �̸�, �޿��� ��ȸ�ϱ�
select employee_id, first_name, salary
from employees
where salary < (select avg(salary)
                from employees);
                
-- ���� ���� �޿��� �޴� �������� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
select employee_id, first_name, salary
from employees
where salary = (select min(salary)
                from employees);
                
-- �μ��� ������� ��ȸ���� �� ������� ���� ���� �μ��� ���̵��, ������� ��ȸ�ϱ�
-- with ���� ����ؼ� �ߺ� ����Ǵ� �����۾��� �� ���� ����ǰ� �� �� �ִ�.
-- ������ ���༺���� ����Ų��.
with deptCnt
as (select department_id, count(*) cnt
    from employees
    group by department_id)
select department_id, cnt
from deptCnt
where cnt = (select max(cnt)
            from deptCnt);
            
-- ������ ��������
-- 50�� �μ��� �ٹ��ߴ� ���� �ִ� ����� ���̵�, �̸�, ����, �ҼӺμ����̵�, ��ȸ�ϱ�
select employee_id, first_name, job_id, department_id
from employees
where employee_id in (select employee_id
                    from job_history
                    where department_id = 50);

-- ������ ��ũ���� ���, ������ Ȱ���ؼ� �����ϱ�
select A.employee_id, A.first_name, A.job_id, A.department_id
from employees A, job_history B
where A.employee_id = B.employee_id
and B.department_id = 50;

-- Seattle�� ��ġ�ϰ� �ִ� �μ��� ������ �������̵�, �̸��� ��ȸ�ϱ�
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
