-- Ʈ����� ó��
insert into sample_book_users                       -- Ʈ����� ����
(user_id, user_password, user_name, user_email)
values
('peter', '123456789', '����', 'peter@gmail.com');

update sample_book_users
set user_point = 1000
where user_id = 'peter';

savepoint add_new_user;                             -- �������� ����

insert into sample_book_orders
(order_no, user_id, book_no, order_price, order_amount)
values
(sample_order_seq.nextval, 'peter', 10028, 16650, 3);

update sample_book_users
set user_point = user_point + trunc(16650*3*0.03)
where user_id = 'peter';

commit;                     -- ���� Ʈ������� ���泻���� ����, ���� Ʈ����� ����, �� Ʈ����� ����

-- DML1 �۾�
-- DML2 �۾�
-- DML3 �۾�

rollback;                   -- ���� ���۵� Ʈ������� ���泻��(DMl1~3)�� ����, Ʈ����� ����, �� Ʈ����� ����.