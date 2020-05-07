-- 118���� ��� ��ȸ�ϱ�
select employee_id, first_name
from employees
start with employee_id = 118
connect by prior manager_id = employee_id;

-- 101���� ���������� ��ȸ�ϱ�
select employee_id, first_name, manager_id
from employees
start with employee_id = 101
connect by prior employee_id = manager_id;

--100�� �������� ��ȸ�ϱ� ('Neena'�� ���� �������� �����ϱ�)
select lpad(first_name, length(first_name) + level*4-4, ' ')
from employees
start with employee_id = 100
connect by prior employee_id = manager_id
and first_name != 'Neena';

--100�� �������� ��ȸ�ϱ� (level2����)
select lpad(first_name, length(first_name) + level*4-4, ' ')
from employees
start with employee_id = 100
connect by prior employee_id = manager_id
and level <= 2;

-- 2020/01/01 ~ 2020/12/31 ��¥ �����
select to_date('2020/01/01', 'yyyy/mm/dd') + level - 1
from dual
connect by level <= 366;

-- 2003�⵵ ���� �Ի��ڼ� ��ȸ�ϱ�
select to_char(hire_date, 'yyyy-mm'), count(*)
from employees
where to_char(hire_date, 'yyyy') = '2003'
group by to_char(hire_date, 'yyyy-mm')
order by 1;

with 
months AS
(select '2003-' || 
    case 
        when level < 10 then '0' || level
        else to_char(level)
    end mon
 from dual
 connect by level <= 12),
month_emp_count AS
(select to_char(hire_date, 'yyyy-mm') mon, count(*) cnt
 from employees
 where to_char(hire_date, 'yyyy') = '2003'
 group by to_char(hire_date, 'yyyy-mm'))
 
select A.mon, nvl(B.cnt, 0) cnt
from months A, month_emp_count B
where A.mon = B.mon(+)
order by 1;
