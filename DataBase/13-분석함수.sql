-- Top-N �м�

-- 50�� �μ��� �Ҽӵ� ���� �߿��� �޿��� ���� ���� �޴� ���� 3���� ��ȸ�ϱ�
select rownum, salary, first_name
from (select salary, first_name
      from employees
      where department_id = 50
      order by salary desc)
where rownum <= 3;

-- �μ��� �������� ������� �� �������� ���� ���� �μ� 3���� ��ȸ�ϱ�
select rownum, department_id, cnt
from (select department_id, count(*) cnt
      from employees
      where department_id is not null
      group by department_id
      order by cnt desc)
where rownum <= 3;

-- �μ��� ������� ������� �� ������� ���� ���� �μ� 3���� ��ȸ�ϱ�
-- �μ����̵�, �μ���, ������� ��µǾ�� ��.
select B.ranking, A.department_id, A.department_name, B.cnt
from departments A, (select rownum ranking, department_id, cnt
                     from (select department_id, count(*) cnt
                           from employees
                           where department_id is not null
                           group by department_id
                           order by cnt desc)
                     where rownum <= 3) B
where A.department_id = b.department_id
order by 1;

-- ������ ���� ��� å 3���� ��ȸ�ϱ�
-- ����, ����, ������ ��µǾ�� ��.
select book_price, book_title
from sample_books
order by 1 desc;

select rownum ranking, book_title, book_price
from (select book_price, book_title
      from sample_books
      order by 1 desc)
where rownum <= 3;

-- ������ ���� ��� å 3���� ��ȸ���� ��
-- �ֱ� 1���� �̳��� ��å�� �� ����ڸ� ��ȸ�ϱ�
-- ����ھ��̵�, ����ڸ�, å����, ���ż���, ���� ��¥ ��µǾ�� ��
select rownum ranking, book_title, book_price, book_no
from (select book_price, book_title, book_no
      from sample_books
      order by 1 desc)
where rownum <= 3;

select C.user_id, C.user_name, B.book_title, a.order_price, a.order_amount, a.order_registered_date
from sample_book_orders A, (select rownum ranking, book_title, book_price, book_no
                            from (select book_price, book_title, book_no
                                  from sample_books
                                  order by 1 desc)
                            where rownum <= 3) B, sample_book_users C
where A.order_registered_date >= sysdate - 7
and A.book_no = B.book_no
and A.user_id = C.user_id
order by 1;

-- �����Ѿ��� ������� �� �����Ѿ��� ���� ���� ������� 
-- ���̵�, �̸�, �ѱ��űݾ��� ��ȸ�ϱ�
select user_id, sum(order_price * order_amount) total_price
from sample_book_orders
group by user_id
order by 2 desc;

select rownum ranking, user_id, total_price
from (select user_id, sum(order_price * order_amount) total_price
      from sample_book_orders
      group by user_id
      order by 2 desc)
where rownum = 1;

select A.user_id, A.user_name, b.total_price
from sample_book_users A, (select user_id, total_price
                           from (select user_id, sum(order_price * order_amount) total_price
                                 from sample_book_orders
                                 group by user_id
                                 order by 2 desc)
                            where rownum = 1) B
where A.user_id = B.user_id;

-- �м��Լ� ����ϱ�
-- �޿��� �������� �����ؼ� ���� �ο��ϱ�
select row_number() over(order by salary desc) num, salary, first_name
from employees;

-- �޿��� �������� �������� �����ؼ� ������ �ο������� �޿������� 11~20���� �ش��ϴ� ������
-- ���̵�, �̸�, �޿��� ��ȸ�ϱ�
select num, employee_id, first_name, salary
from (select row_number() over(order by salary desc) num, salary, first_name, employee_id
      from employees)
where num >= 11 and num <= 20;

-- �μ����� �޿��� �������� �������� �����ؼ� ������ �ο��ϱ�
select row_number() over(partition by department_id order by salary desc) num
    , department_id, salary, first_name
from employees;

-- �μ����� �޿��� �������� �������� �����ؼ� ������ �ο����� ��
-- �ش� �μ����� ���� �޿��� ���� �޴� ������ 
-- �̸�, �޿�, �μ����̵� ��ȸ�ϱ�
select first_name, salary, department_id
from (select row_number() over(partition by department_id order by salary desc) num
           , department_id, salary, first_name
      from employees)
where num = 1;

-- row_number(), rank(), dense_rank()���� ������ Ȯ���غ���
select row_number() over(order by salary desc) row_number
     , rank()       over(order by salary desc) rank
     , dense_rank() over(order by salary desc) dense_rank
     , salary
from employees;

-- row_number() over()�� Ȱ���ؼ� �����͸� Ư�� �÷����� �������� �������� ������ ��ȸ�ϱ�
select *
from (select row_number() over(order by employee_id asc) num, employee_id, first_name
      from employees)
where num >= 1 and num <= 10;

select *
from (select row_number() over(order by employee_id asc) num, employee_id, first_name
      from employees)
where num >= 11 and num <= 20;

select first_value(salary) over(partition by department_id order by salary desc) sal
     , department_id , salary, first_name
from employees
order by 1;