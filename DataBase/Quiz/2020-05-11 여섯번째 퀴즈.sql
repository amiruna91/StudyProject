-- 사용자 아이디, 책번호, 주문량을 전달 받아서 주문정보 저장하는 프로시저
CREATE OR REPLACE PROCEDURE ADD_BOOK_ORDER
    (i_user_id      sample_book_orders.user_id%type,
     i_book_no      sample_book_orders.book_no%type,
     i_order_amount sample_book_orders.order_amount%type)
     
    IS
        v_book_stock    sample_books.book_stock%type;
        v_order_price   sample_book_orders.order_price%type;
        
        -- 사용자정의 예외 이름 선언
        book_application_error exception;
    BEGIN
        SELECT book_discount_price, book_stock
        INTO v_order_price, v_book_stock
        from sample_books
        where book_no = i_book_no;
        
        IF v_book_stock >= i_order_amount THEN 
        -- 주문정보 저장
        INSERT INTO sample_book_orders
        (order_no, user_id, book_no, order_price, order_amount)
        values
        (sample_order_seq.nextval, i_user_id, i_book_no, v_order_price, i_order_amount);
        
        -- 책재고량 수정
        UPDATE SAMPLE_BOOKS
        SET
            BOOK_STOCK = BOOK_STOCK - i_order_amount
        WHERE 
            BOOK_NO = i_book_no;
            
        ELSE
            -- 책의 재고가 주문량보다 부족한 경우 예외 발생
            RAISE book_application_error;
        END IF; 
        
        -- 예외처리
        EXCEPTION
            -- 사용자정의 예외가 발생했다면 오라클의 RAISE_APPLICATION_ERROR(예러코드, 에러메세지)를 실행시킨다.
            WHEN book_application_error THEN
                -- 오류코드는 -20000 ~ -20999 사이의 값을 사용한다.
                RAISE_APPLICATION_ERROR(-20000, '재고가 부족합니다.');
    END;
    
    
-- 책번호에 해당하는 책의 총 구매수량을 반환하는 함수
CREATE OR REPLACE FUNCTION GET_TOTAL_ORDER_AMOUNT
    (i_book_no sample_books.book_no%type)
    
    -- 반환타입 정의
    RETURN NUMBER
    
    IS
        -- 총 구매수량을 저장할 변수
        v_total_amount  number := 0;
    BEGIN
    
        -- 총구매수량을 조회해서 변수에 담기
       SELECT nvl(sum(order_amount), 0)
       INTO v_total_amount
       FROM sample_book_orders
       WHERE book_no = i_book_no;
        
        RETURN v_total_amount;
    END;
    

 -- 책번호에 해당하는 책의 총 판매각격을 구하는 함수
create or replace FUNCTION GET_TOTAL_ORDER_PRICE
    (i_book_no  sample_books.book_no%type)
    RETURN NUMBER
    
    IS
        v_total_price NUMBER := 0;

        CURSOR order_list(param_book_no sample_books.book_no%type) IS
        SELECT ORDER_PRICE, order_amount
        FROM SAMPLE_BOOK_ORDERS
        WHERE BOOK_NO = param_book_no;

    BEGIN
        FOR orders IN order_list(i_book_no) LOOP
            v_total_price := v_total_price + orders.order_price * orders.order_amount;
        END LOOP;

        RETURN v_total_price;
    END;