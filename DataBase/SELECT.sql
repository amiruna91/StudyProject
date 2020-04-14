-- ��� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM employees;

-- �μ����̵�, �μ����� ��ȸ�ϱ�
SELECT department_id, department_name 
FROM departments;

-- ����̵�, ��Ÿ��Ʋ ��ȸ�ϱ�
SELECT job_id, job_title
FROM jobs;

-- �����̸� ��ȸ�ϱ�
SELECT country_name
FROM countries;

-- ������̵�, �̸�, �޿�, ������ ��ȸ�ϱ�
-- ������̵��� ��Ī�� ID, �̸��� NAME, �޿��� SAL, ������ ANN_SAL�� �����ϱ�
SELECT employee_id ID, first_name NAME, salary SAL, salary*12 ANN_SAL 
FROM employees;

-- ������̵�, �̸�, �޿�, 10%�λ�� �޿��� ��ȸ�ϱ�
-- ������̵��� ��Ī�� ID, �̸��� NAME, �޿��� SAL, 10%�λ�� �޿��� INCREMENT SALARY�� �����ϱ�
SELECT employee_id ID, first_name NAME, salary SAL, salary*1.1 "INCREMENT SALARY"
FROM employees;

-- �μ����̵�, �μ���, �μ������ ���̵� ��ȸ�ϱ�
SELECT department_id, department_name, manager_id
FROM departments;

-- ������̵�, �̸�, �޿�, Ŀ�̼�, Ŀ�̼��� ���Ե� �޿� ��ȸ�ϱ�
-- Ŀ�̼��� ���Ե� �޿��� �޿� + �޿�*Ŀ�̼�
SELECT employee_id, first_name, salary, commission_pct, commission_pct * salary + salary 
FROM employees;

-- �ߺ������ ��ȸ�ϱ�
-- ������� �����ϰ� �ִ� ������ ���� ��ȸ�ϱ�
SELECT DISTINCT job_id
FROM employees;

-- 60�� �μ��� �ٹ��ϴ� ����� ���̵�, �̸�, ����, �޿�, �μ����̵� ��ȸ�ϱ�
SELECT employee_id, first_name, job_id, salary, department_id
FROM employees
WHERE DEPARTMENT_ID = 60;

-- �޿��� 15000�޷� �̻� �޴� ����� ���̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
SELECT employee_id, first_name, job_id, salary 
FROM employees
WHERE salary >= 15000;