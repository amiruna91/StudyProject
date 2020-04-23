-- 1. employees ���̺��� ������� ��� �������̵� ��ȸ�ϱ�
select job_id
from employees;

-- 2. �޿��� 12,000�޷� �̻� �޴� ����� �̸��� �޿��� ��ȸ�ϱ�
select employee_id, salary
from employees
where salary >= 12000;

-- 3. �����ȣ�� 176�� ����� ���̵�� �̸� ������ ��ȸ�ϱ�
select employee_id, first_name, job_id
from employees
where employee_id = 176;

-- 4. �޿��� 12,000�޷� �̻� 15,000�޷� ���� �޴� ������� ��� ���̵�� �̸��� �޿��� ��ȸ�ϱ�
select employee_id, first_name, salary
from employees
where salary >= 12000
and salary <= 15000;

-- 5. 2000�� 1�� 1�Ϻ��� 2000�� 6�� 30�� ���̿� �Ի��� ����� ���̵�, �̸�, �������̵�, �Ի����� ��ȸ�ϱ�
select employee_id, first_name, job_id, hire_date
from employees
where hire_date >= '2005/01/01'
and hire_date < '2005/07/01';

-- 6. �޿��� 5,000�޷��� 12,000�޷� �����̰�, �μ���ȣ�� 20 �Ǵ� 50�� ����� �̸��� �޿��� ��ȸ�ϱ�
select first_name, salary
from employees
where department_id in (20, 50)
and salary >= 5000
and salary <= 12000;

-- 7. �����ڰ� ���� ����� �̸��� �������̵� ��ȸ�ϱ�
select first_name, job_id
from employees
where manager_id is null;

-- 8. Ŀ�̼��� �޴� ��� ����� �̸��� �޿�, Ŀ�̼��� �޿� �� Ŀ�̼��� ������������ �����ؼ� ��ȸ�ϱ�
select first_name, salary, commission_pct
from employees
where commission_pct is not null
order by salary asc, commission_pct asc;

-- 9. �̸��� 2��° ���ڰ� e�� ��� ����� �̸��� ��ȸ�ϱ�
select first_name
from employees
where first_name like '_e%';

-- 10. �������̵� ST_CLERK �Ǵ� SA_REP�̰� �޿��� 2,500�޷�, 3,500�޷�, 7,000�޷� �޴� ��� ����� �̸��� �������̵�, �޿��� ��ȸ�ϱ�
select first_name, job_id, salary
from employees
where job_id in ('ST_SLERK', 'SA_REP')
and salary in (2500, 3500, 7000);

-- 11. ��� ����� �̸��� �Ի���, �ٹ� ���� ���� ����Ͽ� ��ȸ�ϱ�, �ٹ����� ���� ������ �ݿø��ϰ�, �ٹ��������� �������� ������������ �����ϱ�
select first_name, hire_date, round(months_between(sysdate, hire_date)) �ٹ�������
from employees
order by 3;

-- 12. ����� �̸��� Ŀ�̼��� ��ȸ�ϱ�, Ŀ�̼��� ���� �ʴ� ����� '����'���� ǥ���ϱ�
select first_name, nvl(to_char(commission_pct), '����')
from employees;

-- 13. ��� ����� �̸�, �μ���ȣ, �μ��̸��� ��ȸ�ϱ�
select A.first_name, B.department_id, B.department_name
from employees A, departments B
where A.department_id = B.department_id;

-- 14. 80���μ��� �Ҽӵ� ����� �̸��� �������̵�, ��������, �μ��̸��� ��ȸ�ϱ�
select A.employee_id, B.job_title, C.department_name
from employees A, jobs B, departments C
where A.department_id = 80
and A.job_id = B.job_id
and A.department_id = C.department_id;

-- 15. Ŀ�̼��� �޴� ��� ����� �̸��� �������̵�, ��������, �μ��̸�, �μ������� ���ø��� ��ȸ�ϱ�
select A.first_name, B.job_id, B.job_title, C.department_name
    , d.street_address, D.city
from employees A, jobs B, departments C, locations D
where a.commission_pct is not null
and A.job_id = B.job_id
and A.department_id = C.department_id
and C.location_id = D.location_id;

-- 16. ������ �������� �ΰ� �ִ� ��� �μ����̵�� �μ��̸��� ��ȸ�ϱ�
select A.department_id, A.department_name
from departments A, locations B, countries C, regions D
where d.region_name = 'Europe'
and D.region_id = C.region_id
and C.country_id = B.country_id
and B.location_id = A.location_id;

-- 17. ����� �̸��� �ҼӺμ���, �޿�, �޿� ����� ��ȸ�ϱ�
select A.first_name, B.department_name, A.salary, C.gra
from employees A, departments B, job_grades C
where A.department_id = B.department_id
and A.salary >= C.lowest_sal and A.salary <= C.highest_sal;

-- 18. ����� �̸��� �ҼӺμ���, �ҼӺμ��� �����ڸ��� ��ȸ�ϱ�, �ҼӺμ��� ���� ����� �ҼӺμ��� '����, �����ڸ� '����'���� ǥ���ϱ�
select A.first_name, nvl(B.department_name, '����'), nvl(c.first_name, '����')
from employees A, departments B, employees C
where A.department_id = B.department_id(+)
and B.manager_id = C.employee_id(+);

-- 19. ��� ����� �޿� �ְ��, �޿� ������, �޿� �Ѿ�, �޿� ��վ��� ��ȸ�ϱ�
select max(salary), min(salary), sum(salary), avg(salary)
from employees;

-- 20. ������ �޿� �ְ��, �޿� ������, �޿� �Ѿ�, �޿� ��վ��� ��ȸ�ϱ�
select job_id, max(salary), min(salary), sum(salary), avg(salary)
from employees
group by job_id;

-- 21. �� ������ ������� ��ȸ�ؼ� ���� ������� ���� ���� 3���� ��ȸ�ϱ�, �������̵�� ����� ǥ���ϱ�
select A.job_id, a.cnt
from (select job_id, count(*) cnt
        from employees
        group by job_id
        order by cnt desc) A
where rownum <= 3;

-- 22. �����ں� ������� ��ȸ�ϱ�, ������ �̸��� �� �����ڰ� �����ϴ� ����� ǥ���ϱ�

-- 23. �� �μ��� ���� �μ��̸�, ������ �̸�, �Ҽӻ�� ��, �Ҽӻ������ ��� �޿��� ��ȸ�ϱ�

-- 24. Steven King�� ���� �μ��� ���� ����� �̸��� �Ի����� ��ȸ�ϱ�

-- 25. �Ҽ� �μ��� ��ձ޿����� ���� �޿��� �޴� ����� ���̵�� ����̸�, �޿�, �� �μ��� ��� �޿��� ��ȸ�ϱ�

-- 26. Kochhar�� ������ �޿� �� Ŀ�̼��� �޴� ��� ����� �̸��� �Ի��� �޿��� ��ȸ�ϱ�, ����� Kochhar�� ���Խ�Ű�� �ʱ�

-- 27. �Ҽ� �μ��� �Ի����� ������, �� ���� �޿��� �޴� ����� �̸��� �ҼӺμ���, �޿��� ��ȸ�ϱ�

-- 28. ������ ���̵�, �����ڸ�, �� �����ڰ� �����ϴ� �����, �� �����ڰ� �Ҽӵ� �μ��� ��ȸ�ϱ�
