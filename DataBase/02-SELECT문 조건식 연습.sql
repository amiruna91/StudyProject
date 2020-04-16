-- ���̺��� ��� ���� ��ȸ�ϱ�
-- ������� ���� ��ȸ�ϱ�
SELECT *
FROM employees;

-- �μ����� ���� ��ȸ�ϱ�
SELECT *
FROM departments;

-- ���̺��� ���� �����ؼ� �����ϱ�
-- ������̵�, �����, �������̴�, �޿� ��ȸ�ϱ�
SELECT employee_id, first_name, job_id, salary
FROM employees;

-- �������̵�, ������ �ּұ޿�, �ִ�޿� ��ȸ�ϱ�
SELECT job_id, min_salary, max_salary
FROM jobs;

-- �������̵�, ������, �ּ� ��ȸ�ϱ�
SELECT location_id, city, street_address
FROM locations;

-- ������̵�, �����, �Ի��� ��ȸ�ϱ�
SELECT employee_id, first_name, hire_date
from employees;

-- �����ڸ� �̿��ϱ�, ��Ī ����ϱ�
-- ������̵�, ����, �޿�, ������ ��ȸ�ϱ�
select employee_id, job_id, salary, salary*12 ����
from employees;

-- ������̵�, ����, �޿�, �ñ��� �����ϱ�, �ñ��� �޿�/(20*24)�̴�, ������ ��Ī�� �ο��ϱ�
select employee_id, job_id, salary, round(salary/(5*24), 2) �޿�
from employees;

-- ���� �����ؼ� ��ȸ�ϱ�
-- 60�� �μ����� �ٹ��ϴ� ����� ���̵�, �̸�, ����, �μ����̵� ��ȸ�ϱ�
select employee_id, first_name, job_id, department_id
from employees
where department_id = 60;

-- �޿��� 5000�޷� ���Ϸ� �޴� ������̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
select employee_id, first_name, job_id, salary
from employees
where salary <= 5000;

--100�� �������� �����ϴ� ������ ���̵�, �̸� ��ȸ�ϱ�
select employee_id, first_name
from employees
where manager_id = 100;

-- 100�� ����� �μ�����ڷ� ������ �μ��� ���̵�, �μ����� ��ȸ�ϱ�
select department_id, department_name
from departments
where manager_id = 100;

-- ���� �ִ� �޿��� 15000�޷� �̻�Ǵ� ������ ���̵�, ��������, �ִ�޿� ��ȸ�ϱ�
select job_id,job_title, max_salary
from jobs
where max_salary >= 15000;

-- �ñ��� 100�޷� �̻�޴� ������ ���̵�, �̸�, �������̵�, �޿�, �ñ��� ��ȸ�ϱ�
select employee_id, first_name, job_id, salary, round(salary/(20*8), 2) �ñ�
from EMPLOYEES
where salary/(20*8) >= 100;

-- �̸��� Neena�� ����� �������̵�, �̸�, �̸���, ��ȭ��ȣ�� ��ȸ�ϱ�
select employee_id, first_name, email, phone_number
from employees
where first_name = 'Neena';

-- null�� ���� null�� �ƴ� ��츦 �����ؼ� ��ȸ�ϱ�
-- Ŀ�̼��� null�� ������ �������̵�, �̸�, �ҼӺμ����̵� ��ȸ�ϱ�
select employee_id, first_name, department_id
from employees
where commission_pct is null;

-- Ŀ�̼��� null�� �ƴ� ������ �������̵�, �̸�, �������̵�, �ҼӺμ� ���̵� ��ȸ�ϱ�
select employee_id, first_name, job_id, department_id
from employees
where commission_pct is not null;

-- �ҼӺμ��� �������� ���� ������ ���̵�, �̸�, �Ի��� ��ȸ�ϱ�
select employee_id, first_name, hire_date
from employees
where department_id is null;

-- �μ�����ڰ� �������� ���� �μ��� ���̵�, �μ����� ��ȸ�ϱ�
select department_id, department_name
from departments
where manager_id is null;

-- �μ�����ڰ� ������ �μ��� �μ����̵�, �μ���, ����� �������̵� ��ȸ�ϱ�
select department_id, department_name, manager_id
from departments
where manager_id is not null;

-- BETWEEN A AND B ����ϱ�
-- �޿��� 2000�̻� 3000���Ϸ� �޴� ����� ���̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
select employee_id, first_name, job_id, salary
from employees
where salary between 2000 and 3000;

-- in(��1, ��2, ��3, ...) ����ϱ�
-- 10�� �μ��� 20�� �μ��� �Ҽӵ� ����� ���̵�, �̸�, �ҼӺμ� ���̵� ��ȸ�ϱ�
select employee_id, first_name, department_id
from employees
where department_id in (10, 20);

-- 50, 60, 70, 80�� �μ��� �Ҽӵ��� ���� ����� ���̵�, �̸�, �ҼӺμ� ���̵�, ��ȸ�ϱ�
select employee_id, first_name, department_id
from employees
where department_id not in (50, 60, 70, 80);

-- �������̵� JP, US�� ������ ��ġ���̵�, �ּ�, �������̵� ��ȸ�ϱ�
select location_id, street_address, country_id
from locations
where country_id in ('JP', 'US');

-- ������ �������̵� AD_PRES�̰ų� AD_VP�� ������ ���̵�, �̸�, ������ ��ȸ�ϱ�
select employee_id, first_name, job_id
from employees
where job_id in ('AD_PRES', 'AD_VP');

-- 50�� Ȥ�� 60�� �μ��� �ٹ��� ���� �ִ� ����� ���̵�, �ٹ�������, �ٹ��������� ��ȸ�ϱ�
select employee_id, start_date, end_date
from job_history
where department_id in (50, 60);

-- 101���̳� 102�� ������ ���� ������ ����� ���̵�, �̸�, �Ŵ������̵� ��ȸ�ϱ�
select employee_id, first_name, manager_id
from employees
where manager_id in (101, 102);

-- �������̵� **_MAN�� ������ ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
select employee_id, first_name, job_id, salary
from employees
where job_id like '%MAN';

-- �̸��� 'A'�� �����ϰ� �̸��� �ױ����� ������ �̸��� ���� ��ȸ�ϱ�
select first_name
from employees
where first_name like 'A___';

-- �̸��� 'e'�� ���Ե� ������ �̸��� ���� ��ȸ�ϱ�
select first_name
from employees
where first_name like '%e%';

-- �� �����ڸ� ����ؼ� 2�� �̻��� ������ �����ϴ� ���� ��ȸ�ϱ�
-- 80�� �μ����� ���ϴ� ���� �� �޿��� 3000�޷� �̸��� ����� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
select employee_id, first_name, salary
from employees
where department_id = 80 
and salary <= 3000;

-- 50�� �μ����� ���ϴ� ������ ������ �Ŵ����� ������ �������̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
select employee_id, first_name, job_id, salary
from employees
where department_id = 50 
and job_id like '%MAN';

-- 50�� �μ����� ���ϰ�, �޿��� 2500�� ���Ϸ� �ް�, �ڽ��� �Ŵ����� ���̵� 121���� ������
-- ���̵�, �̸�, �Ի���, �޿�, �������̵� ��ȸ�ϱ�
select employee_id, first_name, hire_date, salary, job_id
from employees
where department_id = 50 
and salary <= 2500 
and manager_id = 121;

-- 50���̳� 60�� �μ��� �Ҽӵ� ���� �߿��� �̸��� 'A'�� �����ϴ� ������ ���̵�, �̸�, �μ����̵�
-- ��ȸ�ϱ�
select employee_id, first_name, department_id
from employees
where department_id in (50, 60) 
and first_name like 'A%';

-- Ŀ�̼��� �޴� �����߿��� �޿��� 10000�޷� �̻�޴� ������ ���̵�, �̸�, ����,
-- �Ի���, �޿�, ������ ��ȸ�ϱ� (���� = �޿�*4*12 + �޿�*Ŀ�̼�*4*12)
select employee_id, first_name, job_id, hire_date, salary, (salary*4*12) + (salary*commission_pct*4*12) ����
from employees
where commission_pct is not null 
and salary >= 10000;

-- �����ϱ�
-- 60�� �μ��� �Ҽӵ� ������� ���̵�, �̸�, �޿�, �Ի����� ��ȸ�ϱ�
-- �̸������� �������� �����ϱ�
select employee_id, first_name, salary, hire_date
from employees
where department_id = 60
order by first_name;

-- 60�� �μ��� �Ҽӵ� ������� ���̵�, �̸�, �޿�, �Ի����� ��ȸ�ϱ�
-- �̸������� �������� �����ϱ�
select employee_id, first_name, salary, hire_date
from employees
where department_id = 60
order by first_name desc;

-- 60�� �μ��� �Ҽӵ� ������� ���̵�, �̸�, �޿�, ����, �Ի����� ��ȸ�ϱ�
-- ���������� �������� �����ϱ�
select employee_id, first_name, salary, salary*4*12 annual_salary, hire_date
from employees
where department_id = 60
order by salary*4*12;     -- ������� ����ؼ� �����ϱ�

-- 60�� �μ��� �Ҽӵ� ������� ���̵�, �̸�, �޿�, ����, �Ի����� ��ȸ�ϱ�
-- ���������� �������� �����ϱ�
select employee_id, first_name, salary, salary*4*12 annual_salary, hire_date
from employees
where department_id = 60
order by 4;     -- �÷��� ������ ����ؼ� �����ϱ�

-- 60�� �μ��� �Ҽӵ� ������� ���̵�, �̸�, �޿�, ����, �Ի����� ��ȸ�ϱ�
-- ���������� �������� �����ϱ�
select employee_id, first_name, salary, salary*4*12 annual_salary, hire_date
from employees
where department_id = 60
order by annual_salary;     -- ��Ī�� ����ؼ� �����ϱ�

-- 50�� �μ��� �Ҽӵ� ���� �߿��� ������ 200000�޷� �̻��� ������� ���̵�, �̸�, �޿�, ����, �Ի����� ��ȸ�ϱ�
-- ���������� �������� �����ϱ�
select employee_id, first_name, salary, salary*4*12 annual_salary, hire_date
from employees
where department_id = 50 
and salary*4*12 >= 200000
order by annual_salary;

-- �������
-- SELECT������ ������ ��Ī�� WHERE������ ����� �� ����.
-- SELECT������ ������ ��Ī�� ORDER BY�������� ����� �� �ִ�.
select employee_id, first_name, salary, salary*4*12 annual_salary, hire_date
from employees
where department_id = 50 
and annual_salary >= 200000
order by annual_salary;

-- 50�� �μ����� �ٹ��ϴ� �������� �̸�, �޿��� ��ȸ�ϰ� �޿������� �������� �����ϰ�,
-- ���� �޿��� �����ϸ� �̸������� �������� �����ϱ�
select first_name, salary
from employees
where department_id = 50
order by salary desc, first_name;