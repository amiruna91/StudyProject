-- 트랜잭션 처리
insert into sample_book_users                       -- 트랜잭션 시작
(user_id, user_password, user_name, user_email)
values
('peter', '123456789', '피터', 'peter@gmail.com');

update sample_book_users
set user_point = 1000
where user_id = 'peter';

savepoint add_new_user;                             -- 저장지점 지정

insert into sample_book_orders
(order_no, user_id, book_no, order_price, order_amount)
values
(sample_order_seq.nextval, 'peter', 10028, 16650, 3);

update sample_book_users
set user_point = user_point + trunc(16650*3*0.03)
where user_id = 'peter';

commit;                     -- 현재 트랜잭션의 변경내용을 저장, 현재 트랜잭션 종료, 새 트랜잭션 시작

-- DML1 작업
-- DML2 작업
-- DML3 작업

rollback;                   -- 새로 시작된 트랜잭션의 변경내용(DMl1~3)을 버림, 트랜잭션 종료, 새 트랜잭션 시작.