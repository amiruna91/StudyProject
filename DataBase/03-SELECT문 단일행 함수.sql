-- ������ �Լ� �� �����Լ� ����ϱ�
-- ����� ���̵�, �̸��� ��ȸ�ϱ�(�̸��� �빮�ڷ� ǥ��)
select employee_id
    , upper(first_name)
    , lower(first_name)
    , length(first_name) ����
    , concat(first_name, last_name)
    , lpad(first_name, 10, '#')
    , rpad(first_name, 10, '@')
    , first_name|| ' ' ||last_name
from employees;

-- ���� �ڸ���
select substr('201231', 3, 2)
from dual;

-- dual ���� ���̺�
select *
from dual;

-- instr ���ϴ� ���� �ε��� �˾Ƴ���
select instr('010-1111-2222', '-')
from dual;

-- instr�� ����Ͽ� ���ϴ� ���ڱ��� �߶󳻱�
select substr('����� ���빮��', 1, instr('����� ���빮��', ' ')-1)
from dual;

select street_address, substr(street_address, 1, instr(street_address, ' ')-1)
from locations;

-- replace ������ ���ڸ� �ٲٱ�
select replace(first_name,'a','A')
from employees;

-- ���� �Լ�
SELECT
    ROUND(1265.737, 2) "2",     -- �Ҽ��� 2�ڸ��� �ݿø��ض�
    ROUND(1265.737, 1) "1",     -- �Ҽ��� 1�ڸ��� �ݿø��ض�
    ROUND(1265.737, 0) "0",     -- ���� �ڸ��� �ݿø��ض�
    ROUND(1265.737) " ",        -- ���� �ڸ��� �ݿø��ض�
    ROUND(1265.737, -1) "-1",   -- ���� �ڸ��� �ݿø��ض�
    ROUND(1265.737, -2) "-2"    -- ���� �ڸ��� �ݿø��ض�
FROM DUAL;

-- ���ڰ� ������
SELECT
    trunc(1265.737, 2) "2",     -- �Ҽ��� 2�ڸ������� ����� ������
    trunc(1265.737, 1) "1",     -- �Ҽ��� 1�ڸ������� ����� ������
    trunc(1265.737, 0) "0",     -- ���� �ڸ������� ����� ������
    trunc(1265.737) " ",        -- ���� �ڸ������� ����� ������
    trunc(1265.737, -1) "-1",   -- ���� �ڸ������� ����� ������
    trunc(1265.737, -2) "-2"    -- ���� �ڸ������� ����� ������
FROM DUAL;

-- �������� �ñ��� ��ȸ�ϱ�
-- �������̵�, �̸�, �������̵�, �޿�, �ñ�
-- �ñ� = (�޿�*ȯ��)/(5*8) �ñ��� ������������ ǥ���Ѵ�.
select employee_id
    , first_name
    , job_id
    , salary
    , trunc((salary*1220.40)/(5*8)) PAY_FOR_HOUR
from employees
order by pay_for_hour desc;

-- �������� ���ϱ�
SELECT MOD(32, 5) 
FROM DUAL;

-- ��¥ �Լ�
-- ���� ��¥�� �ð����� ��ȸ�ϱ�
SELECT SYSDATE
FROM DUAL;

-- �������̵�, ������, �Ի���, ���ñ��� �ٹ��� ��¥ ��ȸ�ϱ�
SELECT EMPLOYEE_ID
    , FIRST_NAME
    , HIRE_DATE
    , TRUNC(SYSDATE-HIRE_DATE)
FROM EMPLOYEES;

-- ����, 3����, 1������, 1������
SELECT SYSDATE "����"
    , SYSDATE - 3 "3����"
    , SYSDATE - 7 "1���� ��"
    , SYSDATE - 30 " 1�� ��"
FROM DUAL;

-- 60�� �μ��� �Ҽӵ� ������� ���̵�, �̸�, �Ի���, �ٹ��� �������� ��ȸ�ϱ�
-- �������� �Ҽ����κ��� ������.
select employee_id
    , first_name
    , hire_date
    , trunc(months_between(sysdate, hire_date))
from employees
where department_id = 60;

-- ���ú��� 3���� �Ŀ� ��¥��?
select add_months(sysdate, 3), add_months(sysdate, -3)
from dual;

-- ��¥ �ݿø��ϱ�, ������
select sysdate , round(sysdate), trunc(sysdate)
from dual;

-- �� ��¥���� �� �� ����ϱ�
-- ���� ���ڿ� ���� TRUNC()�Լ��� �ú��ʸ� ���� 0���� ���� �� ��¥ ������ �ߴ�.
select employee_id
    , first_name
    , hire_date
    , sysdate - hire_date
    , trunc(sysdate) - hire_date
from employees;

-- �̹� ���� �������� ��ȸ�ϱ�
select last_day(trunc(sysdate))
from dual;

-- ������ �������� ������ �����
select next_day(trunc(sysdate), 7)
from dual;

-- ������ �������� ���� �� �ݿ���
select next_day(trunc(sysdate), 6)
from dual;

-- ������ �������� ���� �� �Ͽ���
select next_day(trunc(sysdate), 1)
from dual;

-- ��ȯ �Լ�
-- ��¥�� ���ڷ� ��ȯ�ϱ�
select to_char(sysdate, 'yyyy') ��
    , to_char(sysdate, 'mm') ��
    , to_char(sysdate, 'dd') ��
    , to_char(sysdate, 'day') ����
    , to_char(sysdate, 'am') "����/����"
    , to_char(sysdate, 'hh') �ð�
    , to_char(sysdate, 'hh24') �ð� 
    , to_char(sysdate, 'mi') ��
    , to_char(sysdate, 'ss') ��
from dual;

-- 2003�⵵�� �Ի��� ����� ���̵�, �̸�, �Ի��� ���� ��ȸ�ϱ�
select employee_id, first_name, to_char(hire_date, 'mm') ��
from employees
where to_char(hire_date, 'yyyy') = '2003';

-- �Ի����� ���� ��¥�� ���� ��¥�� �Ի��� ������ ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
select employee_id, first_name, hire_date
from employees
where to_char(hire_date, 'mmdd') = to_char(sysdate, 'mmdd');

-- Ư����¥�� ��Ÿ���� ���ڸ� ��¥(DATE Ÿ��)�� ��ȯ�ϱ�
select to_date('2018-12-31', 'yyyy-mm-dd') + 1000
from dual;

-- Ư����¥�� ��Ÿ���� ���ڸ� ��¥�� ��ȯ�ؼ� ���ñ����� �ϼ�, �������� ��ȸ�ϱ�
select trunc(sysdate) - to_date('2016-04-17', 'yyyy-mm-dd')
    , months_between(trunc(sysdate), to_date('2016-04-17', 'yyyy-mm-dd'))
from dual;

-- 2005-01-01 ~ 2005-03-31 ���̿� �Ի��� ����� ���̵�, �̸�, �Ի���, �������̵� ��ȸ�ϱ�
select employee_id
    , first_name
    , hire_date
    , job_id
from employees
where hire_date between to_date('2005-01-01', 'yyyy-mm-dd') 
                    and to_date('2005-03-31', 'yyyy-mm-dd')
order by hire_date;

-- 2003�⿡ �Ի��� ������ ���̵�, �̸�, �Ի��� ��ȸ�ϱ�
select employee_id, first_name, hire_date   -- �º��� �������� ����!! 
from employees
where to_char(hire_date, 'yyyy') = '2003'
order by hire_date;

select employee_id, first_name, hire_date
from employees
where hire_date >= to_date('20030101', 'yyyymmdd')
and hire_date < to_date('20040101', 'yyyymmdd')
order by hire_date;

-- �������� ����ȯ
select employee_id, first_name, hire_date
from employees
where hire_date >= '20030101'
and hire_date < '20040101'
order by hire_date;

select employee_id, first_name, hire_date
from employees
where hire_date >= '2003/01/01'
and hire_date < '2004/01/01'
order by hire_date;

-- ���ڸ� õ���� ���� �����ڰ� ���Ե� �ؽ�Ʈ�� ��ȯ�ؼ� ��ȸ�ϱ�
select to_char(10000, '0,000,000')
    , to_char(10000, '9,999,999')
from dual;

-- ���ڸ� �Ҽ��� 2�ڸ����� �ݿø��� �� �ؽ�Ʈ�� ��ȯ�ؼ� ��ȸ�ϱ�
select to_char(123.456, '000.00')
    , to_char(123.456, '999.99')
from dual;

-- ���ڸ� ���ڷ� ��ȯ�ؼ� ����ϱ�
-- �޿��� 15000�޷� �̻��� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
select employee_id, first_name, salary
from employees
where salary >= '15000';

select employee_id, first_name, salary
from employees
where salary >= to_number('15000');

-- TO_NUMBER() �Լ��� �ݵ�� ����ؾ� �ϴ� ���
select employee_id, first_name, salary
from employees
where salary >= to_number('15,000', '99,999');

-- NVL() �Լ�
select nvl(10, 1)   -- 10�� �������̴�
    , nvl(null, 1)  -- 1�� �������̴�
from dual;

-- �������̵�, �̸�, �޿�, Ŀ�̼��� ��ȸ�ϱ�
-- Ŀ�̼ǰ��� null�� ��� 0���� ��ȸ�Ѵ�.
select employee_id, first_name, salary, nvl(commission_pct, 0) comm
from employees
order by employee_id;

-- �������̵�, �̸�, �Ǳ޿��� ��ȸ�ϱ�
-- �Ǳ޿� = �޿� + �޿�*Ŀ�̼��̴�.
select employee_id
    , first_name
    , salary + salary*commission_pct salary1
    , salary + salary*nvl(commission_pct, 0) salary2
from employees
order by employee_id;

-- �μ����̵�, �μ���, �ش�μ� ������ ���̵� ��ȸ�ϱ�
-- ������ ���̵� null�� ��� '������ ������ ����'���� ��ȸ�ϱ�
select department_id
    , department_name
    , nvl(to_char(manager_id), '������ ������ ����')
from departments
order by department_id;

-- �μ����̵�, �μ���, �ش�μ� ������ ���̵� ��ȸ�ϱ�
-- ������ ���̵� null�� ��� 100�������� �����ڷ� ��ȸ�ϱ�
select department_id
    , department_name
    , nvl(manager_id, 100)
from departments
order by department_id;

-- NVL2() �Լ� ����ϱ�
select nvl2(10, 1, 0)       -- �������� 1�̴�.
    , nvl2(null, 1, 0)      -- �������� 0�̴�.
from dual;

-- �������̵�, �̸�, Ŀ�̼� ���ɿ��θ� 'YES', 'NO'�� ��ȸ�ϱ�
select 
    employee_id ���̵�
    , first_name �̸�
    , nvl2(commission_pct, 'YES', 'NO') ���ɿ���
from employees
order by employee_id;

-- CASE ~ WHEN
-- �������̵�, �̸�, �޿�, �޿���� ��ȸ�ϱ�
-- �޿� ����� 
-- 20000�޷� �̻�   A���
-- 10000�޷� �̻�   B���
-- 5000�޷� �̻�    C���
-- �׿�
select 
    employee_id
    , first_name
    , salary
    , case
        when salary >= 20000 then 'A'
        when salary >= 10000 then 'B'
        when salary >= 5000 then 'C'
        else 'D'
     end salary_grade
from employees
order by employee_id;

-- CASE ~ WHEN
-- �������̵�, �̸�, �޿�, �λ�� �޿� ��ȸ�ϱ�
-- �޿� ����� 
-- 20000�޷� �̻�   10%�λ�
-- 10000�޷� �̻�   15%�λ�
-- 5000�޷� �̻�    20%�λ�
-- �׿�             25%�λ�
select
    employee_id
    , first_name
    , salary
    , case
        when salary >= 20000 then salary*1.1
        when salary >= 10000 then salary*1.15
        when salary >= 5000 then salary*1.2
        else salary*0.25
     end incresed_salary
from employees
order by employee_id;

-- �������̵�, �̸�, �޿�, �λ�� �޿��� ��ȸ�ϱ�
-- �λ����
-- �ҼӺμ��� 50�� �μ��� 10%�λ�
-- �ҼӺμ��� 80�� �μ��� 15%�λ�
-- �׿� �μ� 5%�λ�
select
    employee_id
    , first_name
    , salary
    , case
        when department_id = 50 then salary*1.1
        when department_id = 80 then salary*1.15
        else salary*1.05
     end incresed_salary
from employees
order by employee_id;

select
    employee_id
    , first_name
    , salary
    , case department_id
        when 50 then salary*1.1
        when 80 then salary*1.15
        else salary*1.05
     end incresed_salary
from employees
order by employee_id;

-- decode()�� equal �񱳸� �����ϴ�!
select 
    employee_id
    , first_name
    , salary
    , decode(department_id, 50, salary*1.1,
                            80, salary*1.15,
                            salary*1.05) incresed_salary
from employees
order by employee_id;

-- DECODE() �Լ��� ����ؼ� ��ȸ�ϱ�
-- �������̵�, �̸�, �޿�, �λ�� �޿� ��ȸ�ϱ�
-- �޿� ����� 
-- 20000�޷� �̻�   A
-- 10000�޷� �̻�   B
-- 5000�޷� �̻�    C
-- �׿�             D
select 
    employee_id
    , first_name
    , salary
    , decode(trunc(salary, -4), 20000, 'A'
                              , 10000, 'B'
                              , decode(round(salary, -4), 10000, 'C'
                                                               , 'D')) salary_grade
from employees
order by employee_id;

select 
    employee_id
    , first_name
    , salary
    , decode(trunc(salary, -4), 20000, 'A'
                              , 10000, 'B'
                              , decode(trunc(salary/5000)*5000, 5000, 'C'
                                                                    , 'D')) salary_grade
from employees
order by employee_id;