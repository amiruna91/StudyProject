--1. ��� �������� ��� �������̵� ��ȸ�ϱ�
select distinct job_id
from employees
order by 1;

--2. �޿��� 12,000�޷� �̻� �޴� ������ �̸��� �޿��� ��ȸ�ϱ�
select first_name, salary
from employees
where salary >= 12000
order by 1;

--3. ������ȣ�� 176�� ������ ���� �μ����� �ٹ��ϴ� ������ ���̵�� �̸� �������̵� ��ȸ�ϱ�
select B.employee_id, B.first_name, B.job_id
from employees A, employees B
where A.employee_id = 176
and A.department_id = B.department_id
order by 1;

--4. �޿��� 12,000�޷� �̻� 15,000�޷� ���� �޴� �������� ���� ���̵�� �̸��� �޿��� ��ȸ�ϱ�
select employee_id, first_name, salary
from employees
where salary >= 12000
and salary <= 15000
order by 1;

--5. 2005�� 1�� 1�Ϻ��� 2005�� 6�� 30�� ���̿� �Ի��� ������ ���̵�, �̸�, �������̵�, �Ի����� ��ȸ�ϱ�
select employee_id, first_name, job_id, hire_date
from employees
where hire_date >= '2005/01/01'
and hire_date < '2005/07/01'
order by 1;

--6. �޿��� 5,000�޷��� 12,000�޷� �����̰�, �μ���ȣ�� 20 �Ǵ� 50�� ������ �̸��� �޿��� ��ȸ�ϱ�
select first_name, salary
from employees
where salary >=5000 and salary <= 12000
and (department_id in (20, 50))
order by 1;

--7. �����ڰ� ���� ������ �̸��� �������̵� ��ȸ�ϱ�
select first_name, job_id
from employees
where manager_id is null
order by 1;

--8. Ŀ�̼��� �޴� ��� ������ �̸��� �޿�, Ŀ�̼��� �޿� �� Ŀ�̼��� ������������ �����ؼ� ��ȸ�ϱ�
select first_name, salary, commission_pct
from employees
where commission_pct is not null
order by salary desc, commission_pct desc;

--9. �̸��� 2��° ���ڰ� e�� ��� ������ �̸��� ��ȸ�ϱ�
select first_name
from employees
where first_name like '_e%'
order by 1;

--10. �������̵� ST_CLERK �Ǵ� SA_REP�̰� �޿��� 2,500�޷�, 3,500�޷�, 7,000�޷� �޴� 
--   ��� ������ �̸��� �������̵�, �޿��� ��ȸ�ϱ�
select first_name, job_id, salary
from employees
where job_id in ('ST_CLERK', 'SA_REP')
and salary in (2500, 3500, 7000)
order by 1;

--11. ��� ������ �̸��� �Ի���, �ٹ� ���� ���� ����Ͽ� ��ȸ�ϱ�, �ٹ����� ���� ������ �ݿø��ϰ�, 
--    �ٹ��������� �������� ������������ �����ϱ�
select first_name, hire_date, round(months_between(sysdate, hire_date))
from employees
order by 3;

--12. ������ �̸��� Ŀ�̼��� ��ȸ�ϱ�, Ŀ�̼��� ���� �ʴ� ������ '����'���� ǥ���ϱ�
select first_name, nvl(to_char(commission_pct), '����')
from employees
order by 1;

--13. ��� ������ �̸�, �μ���ȣ, �μ��̸��� ��ȸ�ϱ�
select A.employee_id, B.department_id, B.department_name
from employees A, departments B
where A.department_id = B.department_id
order by 1;

--14. 80���μ��� �Ҽӵ� ������ �̸��� �������̵�, ��������, �μ��̸��� ��ȸ�ϱ�
select A.first_name, B.job_id, B.job_title, C.department_name
from employees A, jobs B, departments C
where A.department_id = 80
and A.job_id = B.job_id
and A.department_id = C.department_id
order by A.employee_id;

--15. Ŀ�̼��� �޴� ��� ������ �̸��� �������̵�, ��������, �μ��̸�, �μ������� ���ø��� ��ȸ�ϱ�
select A.first_name, A.job_id, B.job_title
    , C.department_name, d.street_address, d.city
from employees A, jobs B, departments C, locations D
where A.commission_pct is not null
and A.job_id = B.job_id
and A.department_id = C.department_id
and C.location_id = D.location_id
order by A.employee_id;

--16. ������ �������� �ΰ� �ִ� ��� �μ����̵�� �μ��̸��� ��ȸ�ϱ�
select a.department_id, A.department_name
from departments A, locations B, countries C, regions D
where d.region_name = 'Europe'
and d.region_id = c.region_id
and c.country_id = b.country_id
and b.location_id = a.location_id
order by A.department_id;

--17. ������ �̸��� �ҼӺμ���, �޿�, �޿� ����� ��ȸ�ϱ�
select A.first_name, B.department_name, A.salary, C.gra
from employees A, departments B, job_grades C
where A.department_id = B.department_id(+)
and A.salary >= C.lowest_sal and A.salary <= C.highest_sal
order by A.employee_id;

--18. ������ �̸��� �ҼӺμ���, �ҼӺμ��� �����ڸ��� ��ȸ�ϱ�, �ҼӺμ��� ���� ������ �ҼӺμ��� '����, �����ڸ� '����'���� ǥ���ϱ�
select A.first_name, nvl(B.department_name,'����') �ҼӺμ���, nvl(C.first_name, '����') �����ڸ�
from employees A, departments B, employees C
where A.department_id = B.department_id(+)
and B.manager_id = C.employee_id(+)
order by A.employee_id;

--19. ��� ����� �̸�, �������̵�, �޿�, �ҼӺμ����� ��ȸ�ϱ�
select A.first_name, A.job_id, A.salary, B.department_name
from employees A, departments B
where A.department_id = B.department_id
order by A.employee_id;

--20. ��� ����� �̸�, �������̵�, ��������, �޿�, �ּұ޿�, �ִ�޿��� ��ȸ�ϱ�
select A.first_name, A.job_id, B.job_title, A.salary, B.min_salary, B.max_salary
from employees A, jobs B
where A.job_id = B.job_id
order by A.employee_id;

--21. ��� ����� �̸�, �������̵�, ��������, �޿�, �ּұ޿��� ���� �޿��� ���̸� ��ȸ�ϱ�
select A.first_name, A.job_id, B.job_title
    , A.salary, B.min_salary, A.salary - B.min_salary �޿�����
from employees A, jobs B
where A.job_id = B.job_id
order by A.employee_id;

--22. Ŀ�̼��� �޴� ��� ����� ���̵�, �μ��̸�, �ҼӺμ��� ������(���ø�)�� ��ȸ�ϱ�
select A.employee_id, B.department_name, C.city
from employees A, departments B, locations C
where A.commission_pct is not null
and A.department_id = B.department_id
and B.location_id = C.location_id
order by 1;

--23. �̸��� A�� a�� �����ϴ� ��� ����� �̸��� ����, ��������, �޿�, �ҼӺμ����� ��ȸ�ϱ�
select A.first_name, A.job_id, B.job_title, A.salary, C.department_name
from employees A, jobs B, departments C
where A.first_name like 'A%'
and A.job_id = B.job_id
and A.department_id = C.department_id
order by A.employee_id;

--24. 30, 60, 90�� �μ��� �ҼӵǾ� �ִ� ����� �߿��� 100���� �����ϴ� ������� �̸�, ����, �޿�,
--    �޿������ ��ȸ�ϱ�
select A.first_name, A.job_id, A.salary, b.gra
from employees A, job_grades B
where A.department_id in (30, 60, 90)
and A.manager_id = 100
and A.salary >= b.lowest_sal and A.salary <= B.highest_sal
order by A.employee_id;

--25. 80�� �μ��� �Ҽӵ� ������� �̸�, ����, ��������, �޿�, �ּұ޿�, �ִ�޿�, �޿����, 
--    �ҼӺμ����� ��ȸ�ϱ�
select A.first_name, A.job_id, B.job_title
    , A.salary, B.min_salary, B.max_salary, C.gra
    , D.department_name
from employees A, jobs B, job_grades C, departments D
where A.department_id = 80
and A.job_id = B.job_id
and A.salary >= c.lowest_sal and A.salary <= c.highest_sal
and A.department_id = D.department_id
order by A.employee_id;

--26. ������߿��� �ڽ��� ��纸�� ���� �Ի��� ������� �̸�, �Ի���, ����� �̸�, ����� �Ի�����
--    ��ȸ�ϱ�
select A.first_name, A.hire_date, B.first_name, B.hire_date
from employees A, employees B
where A.manager_id = B.employee_id
and A.hire_date < B.hire_date
order by A.manager_id;

--27. �μ����� IT�� �μ��� �ٹ��ϴ� ������� �̸���, ����, �޿�, �޿����, ����� �̸��� ������
--    ��ȸ�ϱ�
select A.first_name, A.job_id, A.salary, C.gra, D.first_name, D.job_id
from employees A, departments B, job_grades C, employees D
where A.department_id = B.department_id
and B.department_name = 'IT'
and A.salary >= c.lowest_sal and A.salary <= C.highest_sal
and B.manager_id = D.employee_id
order by A.employee_id;

--28. 'ST_CLERK'�� �ٹ��ϴٰ� �ٸ� �������� ������ ����� ���̵�, �̸�, ������ �μ���,
--     ���� ����, ���� �ٹ��μ����� ��ȸ�ϱ�
select A.employee_id ���̵�, A.first_name �̸�, C.department_name "�� �μ���"
    , A.job_id "���� ����", D.department_name "���� �μ���"
from employees A, job_history B, departments C, departments D
where A.employee_id = B.employee_id
and B.job_id = 'ST_CLERK'
and B.department_id = C.department_id
and A.department_id = D.department_id
order by 1;