-- �����ϱ�
-- �޿��� 5000�޷� �޴� ����� ���̵�, �̸�, �������̵�, �ҼӺμ����̵�, �ҼӺμ����� ��ȸ
select emp.employee_id
    , emp.first_name
    , emp.job_id
    , emp.department_id
    , dept.department_name
from employees emp, departments dept    -- ������ ���̺��� ����
where emp.salary = 3000                 -- ��ȸ������ ����
and emp.department_id = dept.department_id; -- �������� ����

-- �޿��� 15000�޷� �̻� ���� ������ �������̵�, �̸�, �޿�, �������̵�, ��������
-- ���������޿�, �����ְ�޿��� ��ȸ�ϱ�
select A.employee_id, A.first_name, A.salary, A.job_id
    , B.job_title, B.min_salary, B.max_salary
from employees A, jobs B
where A.salary >= 15000
and A.job_id = B.job_id
order by A.employee_id;

-- �μ������ڰ� ������ �μ��� �μ����̵�, �μ���, ���ø�, �����ȣ, �ּ� ��ȸ�ϱ�
select a.department_id, a.department_name
    , b.city, b.postal_code, b.street_address
from departments A, locations B
where A.manager_id is not null
and A.location_id = B.location_id
order by A.department_id asc;

-- ������ ������ �μ��� �μ����̵�, �μ���, �����ھ��̵�, ������ �̸��� ��ȸ�ϱ�
select a.department_id, a.department_name, a.manager_id
    , b.first_name
from departments A, employees B
where A.manager_id is not null
and A.manager_id = B.employee_id
order by a.department_id;

-- 3�� �̻��� ���̺� �����ϱ�
-- �޿��� 12000�̻� �޴� ����� ������̵�, �̸�, �޿�, �������̵�, ��������, �ҼӺμ����̵�,
-- �ҼӺμ����� ��ȸ�ϱ�
select a.employee_id, a.first_name, a.salary, a.job_id
    , b.job_title
    , c.department_id, c.department_name
from employees A, jobs B, departments C
where A.salary >= 12000
and A.department_id = C.department_id
and A.job_id = B.job_id
order by a.employee_id;

-- �μ� �����ڰ� ������ �μ��� �μ����̵�, �μ���, �������� �������̵�, ������, ��ġ���̵�, ���ø�, �ּ� ��ȸ�ϱ�
select A.department_id, A.department_name
    , B.employee_id, B.first_name 
    , C.location_id, C.city, C.street_address
from departments A, employees B, locations C
where A.manager_id is not null
and A.manager_id = B.employee_id
and A.location_id = C.location_id
order by A.department_id;

-- �μ� �����ڰ� ������ �μ��� �μ����̵�, �μ���, ��ġ���̵�, ���ø�, �ּ�, �������̵�, ������ ��ȸ�ϱ�
select A.department_id, a.department_name
    , b.location_id, b.city, b.street_address
    , c.country_id, c.country_name
from departments A, locations B, countries C
where A.manager_id is not null
and A.location_id = B.location_id
and B.country_id = C.country_id
order by A.department_id;

-- Seattle���� �ٹ��ϴ� ������ ���̵�, �̸�, ����, �ҼӺμ����� ��ȸ�ϱ�
select c.employee_id, c.first_name, c.job_id
    , b.department_name
from locations A, departments B, employees C
where a.city = 'Seattle'
and a.location_id = b.location_id
and b.department_id = c.department_id
order by c.employee_id;

-- ���� ���� �̷¿��� �������̵�, �����̸�, ����������,
-- ����������, �������̵�, ��������, �ҼӺμ����̵�, �μ��� ��ȸ�ϱ�
select a.employee_id
    , c.first_name
    , a.start_date, a.end_date
    , d.job_id, d.job_title
    , b.department_id, b.department_name
from job_history A, departments B, employees C, jobs D
where a.department_id = b.department_id
and a.job_id = d.job_id
and a.employee_id = c.employee_id
order by a.employee_id asc, a.start_date;

create table job_grades (
    gra         char(1)     primary key,
    lowest_sal  number(6,0) not null,
    highest_sal number(6,0) not null
);

insert into job_grades values('A', 1000, 2999);
insert into job_grades values('B', 3000, 5999);
insert into job_grades values('C', 6000, 9999);
insert into job_grades values('D', 10000, 14000);
insert into job_grades values('E', 15000, 24999);
insert into job_grades values('F', 25000, 40000);

commit;

-- �� ����
-- 50�� �μ��� �Ҽӵ� ������ �޿� ����� ��ȸ�ϱ�
-- �������̵�, �̸�, �޿�, �޿����
select A.employee_id, A.first_name, B.lowest_sal, A.salary, B.highest_sal, B.gra
from employees A, job_grades B
where A.department_id = 50
and A.salary between B.lowest_sal and B.highest_sal
order by A.employee_id;

-- ������ ����/ �ְ�޿��� ��� ��ȸ�ϱ�
-- �������̵�, ��������, ���������޿�, �޿����, ���� �ְ�޿�, �޿����
select A.job_id, A.job_title, A.min_salary, B.gra min_salary_gra
    , A.max_salary, C.gra max_salary_gra
from jobs A, job_grades B, job_grades C
where A.min_salary >= B.lowest_sal
and A.min_salary <= B.highest_sal
and A.max_salary between C.lowest_sal and C.highest_sal
order by A.job_id;