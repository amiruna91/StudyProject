-- Top-N 분석

-- 50번 부서에 소속된 직원 중에서 급여를 가장 많이 받는 직원 3명을 조회하기
select rownum, salary, first_name
from (select salary, first_name
      from employees
      where department_id = 50
      order by salary desc)
where rownum <= 3;

-- 부서별 직원수를 계산했을 때 직원수가 가장 많은 부서 3곳을 조회하기
select rownum, department_id, cnt
from (select department_id, count(*) cnt
      from employees
      where department_id is not null
      group by department_id
      order by cnt desc)
where rownum <= 3;

-- 부서별 사원수를 계산했을 때 사원수가 가장 많은 부서 3곳을 조회하기
-- 부서아이디, 부서명, 사원수가 출력되어야 함.
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

-- 가격이 가장 비싼 책 3권을 조회하기
-- 순위, 제목, 가격이 출력되어야 함.
select book_price, book_title
from sample_books
order by 1 desc;

select rownum ranking, book_title, book_price
from (select book_price, book_title
      from sample_books
      order by 1 desc)
where rownum <= 3;

-- 가격이 가장 비싼 책 3권을 조회했을 때
-- 최근 1주일 이내에 이책을 산 사용자를 조회하기
-- 사용자아이디, 사용자명, 책제목, 구매수량, 구매 날짜 출력되어야 함
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

-- 구매총액을 계산했을 때 구매총액이 가장 많은 사용자의 
-- 아이디, 이름, 총구매금액을 조회하기
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

-- 분석함수 사용하기
-- 급여를 기준으로 정렬해서 순번 부여하기
select row_number() over(order by salary desc) num, salary, first_name
from employees;

-- 급여를 기준으로 내림차순 정렬해서 순번을 부여했을때 급여순위가 11~20위에 해당하는 직원의
-- 아이디, 이름, 급여를 조회하기
select num, employee_id, first_name, salary
from (select row_number() over(order by salary desc) num, salary, first_name, employee_id
      from employees)
where num >= 11 and num <= 20;

-- 부서별로 급여를 기준으로 내림차순 정렬해서 순번을 부여하기
select row_number() over(partition by department_id order by salary desc) num
    , department_id, salary, first_name
from employees;

-- 부서별로 급여를 기준으로 내림차순 정렬해서 순번을 부여했을 때
-- 해당 부서에서 가장 급여를 많이 받는 직원의 
-- 이름, 급여, 부서아이디를 조회하기
select first_name, salary, department_id
from (select row_number() over(partition by department_id order by salary desc) num
           , department_id, salary, first_name
      from employees)
where num = 1;

-- row_number(), rank(), dense_rank()값의 차이점 확인해보기
select row_number() over(order by salary desc) row_number
     , rank()       over(order by salary desc) rank
     , dense_rank() over(order by salary desc) dense_rank
     , salary
from employees;

-- row_number() over()를 활용해서 데이터를 특정 컬럼값을 기준으로 범위별로 나눠서 조회하기
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