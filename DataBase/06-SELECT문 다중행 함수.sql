-- ������ �Լ� ����ϱ�
-- employees�� ��� ���� ���� ��ȸ�ϱ�
select count(*)
from employees;

-- 50�� �μ����� ���ϴ� ������ ���� ��ȸ�ϱ�
select count(*)
from employees
where department_id = 50;

-- Ŀ�̼��� �޴� ������ ���� ��ȸ�ϱ�
select count(commission_pct)    -- �÷��� �����ϸ� �ش� �÷��� ���� null�� �ƴ� �͸� ī��Ʈ �Ѵ�.
from employees;

select count(*)
from employees
where commission_pct is not null;

-- ������ �߿��� �ְ�޿�, �����޿��� �޴� ������ �޿��� ��ȸ�ϱ�
select max(salary), min(salary)
from employees;

-- �ְ�޿��� �޴� ����� �̸��� �ְ�޿��� ��ȸ�ϱ�
select first_name, max(salary)   -- ���� : �׷��Լ��� �ƴ�ǥ������ ���� ��ȸ�� �� ����.
from employees;

-- ��ȸ�� ���� ������ ���ϱ�
-- count(*) : ��ȸ�� ��� ���� ������ ��ȯ�Ѵ�.
-- count(�÷���) : �ش� �÷��� ���� null�� �ƴ� ���� ������ ��ȯ�Ѵ�.
-- count(distinct �÷���) : �ش� �÷��� ���� ���� �ߺ��� ���� 1���� ī��Ʈ�ؼ� ���� ������ ��ȯ�Ѵ�.
select count(*)
from employees;         -- 107

select count(job_id)
from employees;         -- 107

select count(DISTINCT job_id)
from employees;         -- 19

select count(distinct to_char(hire_date, 'yyyy'))
from employees;         -- 8

-- ��ȸ�� ���� Ư�� Į���� ���� �հ踦 ���ϱ�
-- sum(�÷���) : �ش� �÷��� �� �߿��� null�� ������ ������ �հ踦 ��ȯ�Ѵ�.
select sum(salary)  -- ��ü ������� �޿� �Ѿ�
from employees;

select sum(commission_pct)  -- ��ü ������� Ŀ�̼ǿ� ���� �հ�
from employees;             -- Ŀ�̼� ���� null�� ���� ��꿡 ���Ե��� ����

-- ��ȸ�� ���� Ư�� �÷��� ���� ����� ���ϱ�
-- avg(�÷���) : �ش� �÷��� �� �߿��� null�� ������ ���� ���� ��鿡 ���� ��հ��� ��ȯ�Ѵ�.
select trunc(avg(salary))     -- ��ü �������� �޿� ���
from employees;

select trunc(avg(commission_pct), 2)
from employees;

-- ��ȸ�� ���� Ư�� �÷��� ���� �ִ밪, �ּҰ� ���ϱ�
-- min(�÷���) : �ش� �÷��� �� �߿��� null�� ������ ���� ���� ���� ��ȯ�Ѵ�.
-- max(�÷���) : �ش� �÷��� �� �߿��� null�� ������ ���� �� ���� ��ȯ�Ѵ�.
select min(salary), max(salary)
from employees;

select min(commission_pct), max(commission_pct)
from employees;

-- group by�� �׷��ռ��� ����ؼ� ������ �����ϱ�
-- ������ �������� ��ȸ�ϱ�
select job_id, count(*)
from employees
group by job_id;

select to_char(hire_date, 'yyyy'), count(*)
from employees
group by to_char(hire_date, 'yyyy')
order by 1;