-- ���ο� �Ϸù�ȣ ��ȸ
select sample_order_seq.nextval from dual;
-- ���� �������� �Ϸù�ȣ ��ȸ
select sample_order_seq.currval from dual;

-- �ε��� �����(��ȹ ������ ������� ���� cost ��뷮�� �ٸ���) �̰� �ٿ��ִ°� SQL Ʃ���̴�.
create index sample_user_name_idx
on sample_book_users (user_name);

create index sample_order_total_price_idx
on sample_book_orders (order_price*order_amount); -- �Լ���� �ε���

-- �ε��� �����
drop index sample_order_total_price_idx;

create index sample_order_date_idx
on sample_book_orders (to_char(order_registered_date, 'yyyy-mm-dd'));

select *
from sample_book_users
where user_name = 'ȫ�浿';

select *
from employees
where last_name ='King';

select *
from sample_book_orders
where to_char(order_registered_date, 'yyyy-mm-dd') = '2020-04-27';