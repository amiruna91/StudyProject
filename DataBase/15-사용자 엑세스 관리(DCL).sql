create table contacts (
    contact_name    varchar2(100)   not null,
    contact_tel     varchar2(50)    not null,
    contact_email   varchar2(256),
    contact_create_date date    default sysdate
);

insert into contacts 
(contact_name, contact_tel, contact_email)
values
('ȫ�浿', '010-1234-5678', 'hong@gmail.com');

insert into contacts
(contact_name, contact_tel, contact_email)
values
('������', '010-5122-1512', 'kim@naver.com');

commit;

select *
from contacts;

-- HR ����ڿ��� CONTACTS�� ���� ��ü���� �ο��ϱ�
grant select
on contacts
to hr;

-- HR ����ڿ��� CONTACTS�� ���� ��ü���� �ο��ϱ�
GRANT UPDATE (CONTACT_TEL, CONTACT_EMAIL)
ON CONTACTS
TO HR;

SELECT *
FROM ROLE_SYS_PRIVS;

-- �����ͺ��̽� �������̺� Ȯ���غ���(distionary ���̺�)
-- ������� ��� ���̺� ������ȸ
select *
from user_tables;

-- ������� ��� �� ���� ��ȸ
select *
from user_views;

-- ������� ��� ������ ���� ��ȸ
select *
from user_sequences;

-- ����� ���� ��ȸ
select *
from user_users;

-- ����� / ���� ����ϱ�
-- ����ڸ� scott
-- ��й�ȣ tiger
create user scott identified by tiger;

-- ������ ����ڿ��� �����׺��̽� ���� ���� �ο��ϱ�
grant create session to scott;

-- �Ϲ� ����ڿ��� �ο��Ǵ� �ý��۱����� �׷�ȭ �س��� ���� �̿��ؼ� ���� �ο��ϱ�
grant connect, resource to scott;

-- ���� �ο��ϱ�
-- ��ȭ��ȣ ��ȸ�ϱ�, ���� ����
select *
from scott.contacts;

-- ��ȭ��ȣ �����ϱ�, ���� ����
UPDATE SCOTT.CONTACTS
SET
    CONTACT_TEL = '010-1111-2222'
WHERE 
    CONTACT_NAME = 'ȫ�浿';
    
-- �̸� �����ϱ�, ��ü���� �������� ���� ����
UPDATE SCOTT.CONTACTS
SET
    CONTACT_TEL = '������'
WHERE 
    CONTACT_NAME = '������';
    

-- SCOTT.CONTACTS�� ���� ���̺��� ���Ǿ �����ϱ�
CREATE SYNONYM CONTACTS FOR SCOTT.CONTACTS;

SELECT *
FROM CONTACTS;