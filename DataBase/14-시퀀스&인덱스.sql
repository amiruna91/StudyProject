-- 새로운 일련번호 조회
select sample_order_seq.nextval from dual;
-- 현재 시퀀스의 일련번호 조회
select sample_order_seq.currval from dual;

-- 인덱스 만들기(계획 설명을 실행시켜 보면 cost 사용량이 다르다) 이걸 줄여주는게 SQL 튜닝이다.
create index sample_user_name_idx
on sample_book_users (user_name);

create index sample_order_total_price_idx
on sample_book_orders (order_price*order_amount); -- 함수기반 인덱스

-- 인덱스 지우기
drop index sample_order_total_price_idx;

create index sample_order_date_idx
on sample_book_orders (to_char(order_registered_date, 'yyyy-mm-dd'));

select *
from sample_book_users
where user_name = '홍길동';

select *
from employees
where last_name ='King';

select *
from sample_book_orders
where to_char(order_registered_date, 'yyyy-mm-dd') = '2020-04-27';