--1. �޿��� 5000�̻� 12000������ ����� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
select employee_id ,first_name, salary
from employees
where salary >= 5000 and salary <= 12000
order by 1;

--2. ������� �Ҽӵ� �μ��� �μ����� �ߺ����� ��ȸ�ϱ�
select distinct B.department_id, B.department_name
from employees A, departments B
where A.department_id = B.department_id
order by 1;

--3. 2007�⿡ �Ի��� ����� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
select employee_id, first_name, hire_date
from employees
where hire_date >= '2007/01/01' and  hire_date < '2008/01/01'
order by 1;

--4. �޿��� 5000�̻� 12000�����̰�, 20���� 50�� �μ��� �Ҽӵ� ����� ���̵�, �̸�, �޿�, �ҼӺμ����� 
--   ��ȸ�ϱ�
select A.employee_id, A.first_name, A.salary, B.department_name
from employees A, departments B
where A.salary >= 5000 and A.salary <= 12000
and A.department_id in (20, 50)
and A.department_id = B.department_id
order by 1;

--5. 100�������� �����ϴ� ����� ���̵�, �̸�, �޿�, �޿������ ��ȸ�ϱ�
select A.employee_id, A.first_name, A.salary, B.gra
from employees A, job_grades B
where A.manager_id = 100
and A.salary >= B.lowest_sal and A.salary <= b.highest_sal
order by 1;

--6. 80�� �μ��� �ҼӵǾ� �ְ�, 80�� �μ��� ��ձ޿����� ���� �޿��� �޴� ����� ���̵�, �̸�, 
--   �޿��� ��ȸ�ϱ�
select avg(salary) avg
from employees
where department_id = 80;

select employee_id, first_name, salary
from employees
where department_id = 80
and salary <= (select avg(salary) avg
                from employees
                where department_id = 80)
order by 1;

--7. 50�� �μ��� �Ҽӵ� ��� �߿��� �ش� ������ �ּұ޿����� 2�� �̻��� �޿��� �޴� ����� ���̵�, 
--   �̸�, �޿��� ��ȸ�ϱ�
select A.employee_id, A.first_name, A.salary
from employees A, jobs B
where A.department_id = 50
and A.job_id = B.job_id
and A.salary >= b.min_salary * 2;

--8. ����� �߿��� �ڽ��� ��纸�� ���� �Ի��� ����� ���̵�, �̸�, �Ի���, ����� �̸�, 
--   ����� �Ի����� ��ȸ�ϱ�
select A.employee_id, A.first_name, A.hire_date, B.first_name, B.hire_date
from employees A, employees B
where a.manager_id = B.employee_id
and A.hire_date < B.hire_date
order by 1;

--9. Steven King�� ���� �μ����� �ٹ��ϴ� ����� ���̵�� �̸��� ��ȸ�ϱ�
select B.employee_id, B.first_name
from employees A, employees B
where A.first_name || ' ' || A.last_name = 'Steven King'
and A.department_id = B.department_id
order by 1;

select employee_id, first_name
from employees
where department_id in (select department_id
                        from employees
                        where first_name = 'Steven' and last_name = 'King');

--10. �����ں� ������� ��ȸ�ϱ�, ������ ���̵�, ������� ����Ѵ�. ������ ���̵������ �������� ����
select manager_id, count(*)
from employees
group by manager_id
order by 1;

--11. Ŀ�̼��� �޴� ����� ���̵�, �̸�, �޿�, Ŀ�̼��� ��ȸ�ϱ�
select employee_id, first_name, salary, commission_pct
from employees
where commission_pct is not null
order by 1;

--12. �޿��� ���� ���� �޴� ��� 3���� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
select employee_id, first_name, salary
from (select salary, employee_id, first_name
      from employees
      order by 1 desc)
where rownum <= 3;

--13. 'Ismael'�� ���� �ؿ� �Ի��߰�, ���� �μ��� �ٹ��ϴ� ����� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
select hire_date, department_id
from employees
where first_name = 'Ismael';

select A.employee_id, A.first_name, A.hire_date
from employees A, (select hire_date, department_id
                   from employees
                   where first_name = 'Ismael') B
where to_char(A.hire_date, 'yyyy') = to_char(B.hire_date, 'yyyy')
and A.department_id = B.department_id
order by 1;

--14. 'Renske'���� ����޴� ����� ���̵�� �̸�, �޿�, �޿� ����� ��ȸ�ϱ�
select a.employee_id, A.first_name, A.salary, C.gra
from employees A, employees B, job_grades C
where B.first_name = 'Renske'
and B.manager_id = A.employee_id
and A.salary >= c.lowest_sal and A.salary <= c.highest_sal;

--15. ������̺��� �޿��� �������� �޿������ ��ȸ���� ��, �޿���޺� ������� ��ȸ�ϱ�
select B.gra, count(*)
from employees A, job_grades B
where A.salary >= b.lowest_sal and A.salary <= b.highest_sal
group by B.gra
order by 1;

-- E�� �����ؼ� ��ȸ �غ���
select gra, 0
from job_grades
where gra not in (select B.gra
                  from employees A, job_grades B
                  where A.salary >= b.lowest_sal and A.salary <= b.highest_sal
                  group by B.gra)
union
select B.gra, count(*)
from employees A, job_grades B
where A.salary >= b.lowest_sal and A.salary <= b.highest_sal
group by B.gra;

select Y.gra, nvl(cnt,0)
from (select B.gra, count(*) cnt
      from employees A, job_grades B
      where A.salary >= b.lowest_sal and A.salary <= b.highest_sal
      group by B.gra) X, job_grades Y
where X.gra(+) = Y.gra
order by 1;

--16. �Ի��ڰ� ���� ���� �⵵�� �� �ؿ� �Ի��� ������� ��ȸ�ϱ�
select to_char(hire_date, 'yyyy') year, count(*) cnt
from employees
group by to_char(hire_date, 'yyyy')
order by cnt;

select year, cnt
from (select to_char(hire_date, 'yyyy') year, count(*) cnt
      from employees
      group by to_char(hire_date, 'yyyy')
      order by cnt)
where rownum = 1;

--17. �����ں� ������� ��ȸ���� �� �������ϴ� ������� 10���� �Ѵ� �������� ���̵�� ������� ��ȸ�ϱ�
select manager_id, count(*) cnt
from employees
group by manager_id
order by 1;

select manager_id, cnt
from (select manager_id, count(*) cnt
      from employees
      group by manager_id)
where cnt >= 10
order by 1;

--18. 'Europe'�������� �ٹ����� ����� ���̵�, �̸�, �ҼӺμ���, ������ ���ø�, �����̸��� ��ȸ�ϱ�
select E.employee_id, E.first_name, D.department_name, c.city, b.country_name
from regions A, countries B, locations C, departments D, employees E
where a.region_name = 'Europe'
and a.region_id = b.region_id
and B.country_id = c.country_id
and c.location_id = d.location_id
and d.department_id = E.department_id;

--19. ��ü ����� ������̵�, �̸�, �޿�, �ҼӺμ����̵�, �ҼӺμ���, ����� �̸��� ��ȸ�ϱ�
select A.employee_id, A.first_name, A.salary
    , C.department_id, C.department_name
    , B.first_name
from employees A, employees B, departments C
where A.manager_id = B.employee_id(+)
and A.department_id = C.department_id(+)
order by 1;

--20. 50�� �μ��� �ٹ����� ������� �޿��� 500�޷� �λ��Ű��
update employees
set
    salary = salary + 500
where department_id = 50;

--21. ����� ���̵�, �̸�, �޿�, ���ʽ��� ��ȸ�ϱ�,
--    ���ʽ��� 20000�޷� �̻��� �޿��� 10%, 10000�޷� �̻��� �޿��� 15%, �� �ܴ� �޿��� 20%�� �����Ѵ�.
select employee_id
    , first_name
    , salary
    , case 
        when salary >= 20000 then salary * 0.1
        when salary >= 10000 then salary * 0.15
        else salary * 0.2
      end bonus
from employees
order by 1;

--22. �ҼӺμ����� �Ի����� ������, �� ���� �޿��� �޴� ����� �̸�, �Ի���, �ҼӺμ���, �޿��� ��ȸ�ϱ�
select distinct A.employee_id, A.first_name, A.hire_date, A.salary
from employees A, employees B
where A.department_id = B.department_id
and A.hire_date > B.hire_date
and A.salary > B.salary
order by 1;

--23. �μ��� ��ձ޿��� ��ȸ���� �� �μ��� ��ձ޿��� 10000�޷� ������ �μ��� ���̵�, �μ���, ��ձ޿���
--    ��ȸ�ϱ� (��ձ޿��� �Ҽ��� 1�ڸ������� ǥ��)
select department_id, trunc(avg(salary),1)
from employees
group by department_id
order by 1;

select A.department_id, A.department_name, B.avg_salary
from departments A, (select department_id, trunc(avg(salary),1) avg_salary
                     from employees
                     group by department_id) B
where B.avg_salary <= 10000 
and A.department_id = B.department_id
order by 1;

-- �ٸ� ���
select A.department_id, B.department_name, trunc(avg(A.salary)) dept_avg_salary
from employees A, departments B
where A.department_id = B.department_id
group by A.department_id, B.department_name
having avg(A.salary) <= 10000
order by 1;

--24. ����� �߿��� �ڽ� �����ϰ� �ִ� ������ �ִ�޿��� ������ �޿��� �޴� ����� ���̵�, �̸�, �޿���
--    ��ȸ�ϱ�
select A.employee_id, A.first_name, A.salary
from employees A, jobs B
where A.job_id = B.job_id
and A.salary = b.max_salary;

----25. �м��Լ��� ����ؼ� ������� �޿������� �������� �����ϰ�, ������ �ο����� �� 6~10��° ���ϴ� ����,
--    ����� ���̵�, �̸�, �޿�, �޿������ ��ȸ�ϱ�
select row_number() over (order by salary desc) num
     , employee_id, first_name, salary
from employees;

select num, employee_id, first_name, salary
from (select row_number() over (order by salary desc) num
           , employee_id, first_name, salary
      from employees)
where num >= 6 and num <= 10;

select A.num, A.employee_id, A.first_name, A.salary, B.gra
from (select num, employee_id, first_name, salary
      from (select row_number() over (order by salary desc) num
                 , employee_id, first_name, salary
           from employees)
      where num >= 6 and num <= 10) A, job_grades B
where A.salary >= B.lowest_sal and A.salary <= B.highest_sal
order by 1;