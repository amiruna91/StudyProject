-- ���� ������ ����ϱ�
-- ��� ������ ���� �� ���� �ٹ��ߴ� ������ ��ȸ�ϱ�
-- �������� �ѹ����� ǥ���ϱ�
select employee_id, job_id -- ���� �ٹ����� ���� ��ȸ�ϱ�
from employees
union
select employee_id, job_id -- ������ �ٹ��ߴ� ���� ��ȸ��.
from job_history;

-- ��� ����� ���� �μ����̵�� ���� �ҼӺμ� ���̵� ��ȸ�ϱ�
select employee_id, department_id
from employees
union all
select employee_id, department_id
from job_history
order by 1;

-- ���� �����ϴ� ������ ���� �������� �����ϰ� �ִ� ����� ���̵�� �������̵� ��ȸ�ϱ�
select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;

select a.employee_id, a.job_id
from employees A, job_history B
where A.employee_id = B.employee_id
and A.job_id = B.job_id;

-- ������ ����� ���� ���� ����� ���̵�, �̸��� ��ȸ�ϱ�
select employee_id, first_name
from employees
minus
select employee_id, ''
from job_history;

-- ������ ����� ���� ���� ����� ���̵�, �̸�, ���� ����, �ҼӺμ����� ��ȸ�ϱ�
select A.employee_id, B.first_name, B.job_id, C.department_name
from (select employee_id
      from employees
      minus
      select employee_id
      from job_history) A, employees B, departments C
where a.employee_id = B.employee_id
and B.department_id = C.department_id
order by 1;

-- ��� ����� ���� �� ������ �ٹ��ߴ� ������ ��ȸ�ϱ�
-- ������̵�, ����, �޿��� ��ȸ�ϱ�
select employee_id, job_id, salary
from employees
union
select employee_id, job_id, 0
from job_history;