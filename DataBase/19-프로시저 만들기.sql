-- 직원 번호와 인상률을 전달받아서 그 직원의 급여를 인상시키는 프로시저 작성하기
create or replace procedure update_salary
(i_emp_id in number)
IS
    -- 변수 정의한다.
    -- 변수명       변수의 데이터타입
    --              employees의 salary 컬럼의 데이터타입과 동일한 데이터타입으로 변수선언
    v_emp_salary    employees.salary%type;  -- 사원의 급여
    v_update_rate    number(3, 2);           -- 금여 인상률
    
BEGIN
    -- SQL문장, PL/SQL 구문을 작성
    
    -- 전달받은 직원아이디에 해당하는 직원의 급여를 조회한다.
    -- 조회된 직원의 급여를 위에서 선언한 v_emp_salary에 대입한다.
    select salary
    into  v_emp_salary
    from employees
    where employee_id = i_emp_id;
    
    -- 직원의 급여에 따라서 인상률을 결정하기
    -- 20000달러 이상 10%, 10000달러 이상 15%, 그외 20% 인상
    if v_emp_salary >= 20000 then v_update_rate := 0.1;
    elsif v_emp_salary >= 10000 then v_update_rate := 0.15;
    else v_update_rate := 0.2;
    end if;
    
    -- 급여를 인상시키기
    update employees
    set
        salary = salary + trunc(salary*v_update_rate)
    where 
        employee_id = i_emp_id;
        
    -- DB에 영구적으로 반영시키기
    commit;
    
END;


-- 책주문하는 프로시저
CREATE OR REPLACE PROCEDURE ADD_BOOK_ORDER
    (i_user_id      sample_book_orders.user_id%type,
     i_book_no      sample_book_orders.book_no%type,
     i_order_amount sample_book_orders.order_amount%type)
     
    IS
        v_book_stock    sample_books.book_stock%type;
        v_order_price   sample_book_orders.order_price%type;
        
    BEGIN
        SELECT book_discount_price, book_stock
        INTO v_order_price, v_book_stock
        from sample_books
        where book_no = i_book_no;
        
        IF v_book_stock >= i_order_amount THEN 
        INSERT INTO sample_book_orders
        (order_no, user_id, book_no, order_price, order_amount)
        values
        (sample_order_seq.nextval, i_user_id, i_book_no, v_order_price, i_order_amount);
        
        UPDATE SAMPLE_BOOKS
        SET
            BOOK_STOCK = BOOK_STOCK - i_order_amount
        WHERE 
            BOOK_NO = i_book_no;
        END IF; 
    END;