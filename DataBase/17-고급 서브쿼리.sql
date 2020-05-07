-- ���߿� �������� ����ϱ�
-- 'Karen'�� ���� ������ �����ϰ�,
-- ���� �μ��� �ҼӵǾ� �ִ� ����� ���̵�, �̸�, ����, �μ����̵� ��ȸ�ϱ�
select job_id, department_id
from employees
where first_name = 'Karen';

select *
from employees
where (job_id, department_id) in (select job_id, department_id
                                  from employees
                                  where first_name = 'Karen');
                                  
-- �μ��� �ְ� �޿��� �޴� ����� ���̵�, �̸�, �޿�, �μ����̵� ��ȸ�ϱ�
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

-- ��Į�� �������� ����ϱ�
-- ��ü ��պ��� ���� �޿��� �޴� ����� ���̵�, �̸�, �޿�, ��ձ޿�, 
-- ��ձ޿����� ���̸� ��ȸ�ϱ�
select employee_id, first_name, salary
     , trunc((select avg(salary) from employees) - salary) salary_gap
from employees
where salary < (select avg(salary)
                from employees)
order by salary_gap;

-- 20000�޷� �̻��� ��ü ��ձ޿��� 10%�� ���ʽ���, 10000�޷� �̻��� 15%, �� �ܴ� 20%��
-- ���ʽ��� �����Ϸ��� �Ѵ�. ���̵�, �̸�, �޿�, ���ʽ���ȸ�ϱ�
select employee_id
     , first_name
     , salary
     , case
        when salary >= 20000 then trunc((select avg(salary) from employees) * 0.1)
        when salary >= 10000 then trunc((select avg(salary) from employees) * 0.15)
        else trunc((select avg(salary) from employees) * 0.2)
       end bonus
from employees;

-- ��ü ��ձ޿����� �޿��� ���� �޴� ����� �̸�, �޿��� ��ȸ�ϱ�
select first_name, salary
from employees
where salary > (select avg(salary)
                from employees);
                
-- �ڽ��� �Ҽӵ� �ҼӺμ��� ��ձ޿����� ���� �޿��� �޴� ����� �̸�, �޿��� ��ȸ�ϱ�
select outter.employee_id, outter.first_name, outter.salary, outter.department_id
from employees outter
where outter.commission_pct is null
and salary > (select avg(inners.salary)
                from employees inners
                where outter.department_id = inners.department_id);
-- �ܺ� SQL�� ���� �Ǿ ���� �����´�.(�ĺ���)
-- �ĺ����� �ึ�� department_id���� �����ͼ� ���������� �����Ѵ�.
-- ���������� ������� ����ؼ� �ĺ����� �����Ѵ�.
-- �ĺ����� ���� ���� ������ �ݺ��Ѵ�.

-- �μ����̵�, �μ���, �ش�μ��� ������� ��ȸ�ϱ�
select outter.department_id
     , outter.department_name
     , (select count(*)
        from employees
        where department_id = outter.department_id) cnt
from departments outter;

-- exists ������ ����ϱ�
-- ���������� ������ �ִ� ������ ��ȸ�ϱ�
select *
from employees ���
where (select count(*)
       from employees ����
       where ����.manager_id = ���.employee_id) > 0;   -- count() ��� ����õ
       
select *
from employees ���
where exists (select 1
              from employees ����
              where ����.manager_id = ���.employee_id);    -- exists ��� ��õ
              
-- with ��
with 
dept_costs AS -- �μ��̸�, �μ��ѱ޿�
(select B.department_name, sum(A.salary) as dept_total
 from employees A, departments B
 where A.department_id = B.department_id
 group by B.department_name),
avg_costs AS    -- �μ��� �� �޿��� ���� ��ձ޿�
(select sum(dept_total)/count(*) as dept_avg
 from dept_costs) -- ������ ���̺�
select *
from dept_costs
where dept_total > (select dept_avg     -- �μ��ѱ޿��� ��ձ޿�����
                    from avg_costs)
order by department_name;