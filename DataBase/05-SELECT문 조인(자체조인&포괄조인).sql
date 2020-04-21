-- ��������(��ü����)
-- 101�� ����� �̸�, ����, �ڽ��� ����̸��� ��ȸ�ϱ�
select EMP.first_name ������, EMP.job_id "������ ����", MGR.first_name "����� �̸�"
from employees EMP, employees MGR
where EMP.employee_id = 101
and EMP.manager_id = MGR.employee_id;

-- 60�� �μ��� �ٹ����� ������ ���̵� �̸�, ������ ����, ����� �̸�, ����� ����,
-- ������ �μ� ���̵�, ������ �Ҽ� �μ���, �μ������� ���̵�, �μ������� �̸��� ��ȸ�ϱ�
select EMP.employee_id �������̵�
    , EMP.first_name �����̸�
    , EMP.job_id "������ ����"
    , MGR.first_name "����� �̸�"
    , MGR.job_id "����� ����"
    , EMP.department_id "�ҼӺμ� ���̵�"
    , DPT.department_name "�ҼӺμ� �̸�"
    , DPT.manager_id "������ ���̵�"
    , DPTMGR.first_name "������ �̸�"
from employees EMP, employees MGR, departments DPT, employees DPTMGR
where EMP.department_id = 60
and EMP.manager_id = MGR.employee_id        -- ������ ��簣�� ��������
and EMP.department_id = DPT.department_id   -- ������ �ҼӺμ����� ��������
and DPT.manager_id = DPTMGR.employee_id     -- �μ��� �μ������ڰ��� ��������
order by EMP.employee_id;

-- ��������
-- �μ����̵�, �μ���, �μ������ھ��̵�, �μ������� �̸� ��ȸ�ϱ�
select A.department_id, A.department_name, A.manager_id, B.first_name
from departments A, employees B
where A.manager_id = B.employee_id(+)
order by A.department_id;

-- ��� ������ �̸�, �޿�, �������̵�, �ҼӺμ����� ��ȸ�ϱ�
select *
from employees A, departments B
where A.department_id = B.department_id(+)
order by A.employee_id;