-- 트리거 만들기
-- SAMPLE_BOOK_LIKES에 행이 추가될 때마다 SAMPLE_BOOKS에 BOOK_LIKES컬럼의 값이 1증가시킨다.
create or replace TRIGGER INCREASE_BOOK_LIKES_TRIGGER
    AFTER
    INSERT ON SAMPLE_BOOK_LIKES
    FOR EACH ROW
    
    BEGIN
        UPDATE SAMPLE_BOOKS
        SET
            BOOK_LIKES = BOOK_LIKES + 1
        WHERE BOOK_NO = :NEW.BOOK_NO;
    END;
    
-- SAMPLE_BOOK_ORDERS에 새로운 주문이 추가될 때마다 SAMPLE_BOOK_ORDERS의 포인트를 증가시킨다
CREATE OR REPLACE TRIGGER INCREASE_USER_POINT_TRIGGER
    AFTER
    INSERT ON SAMPLE_BOOK_ORDERS
    FOR EACH ROW
    
    DECLARE
        v_price             sample_book_orders.order_price%type;
        v_amount            sample_book_orders.order_amount%type;
        v_deposit_point     sample_book_users.user_point%type;
        
    BEGIN
    
        v_price         := :NEW.ORDER_PRICE;
        v_amount        := :NEW.ORDER_AMOUNT;
        v_deposit_point := trunc(v_price*v_amount*0.02);
    
        UPDATE SAMPLE_BOOK_USERS
        SET
            USER_POINT = USER_POINT + v_deposit_point
        WHERE 
            USER_ID = :NEW.USER_ID;
    END;

-- 리뷰에 평점에 따라 book에 총 평점을 바꿔보자.
create or replace TRIGGER UPDATE_REVIEW_POINT_TRIGGER
    BEFORE
    INSERT ON SAMPLE_BOOK_REVIEWS
    FOR EACH ROW
    
    DECLARE
        v_current_point         number(2, 1);
        v_current_row_count     number;
        v_temp_point            number;    
        v_point                 number(2, 1);       
    BEGIN
        SELECT BOOK_POINT
        INTO v_current_point
        FROM SAMPLE_BOOKS
        WHERE BOOK_NO = :NEW.BOOK_NO;
        
        SELECT COUNT(*) 
        INTO v_current_row_count
        FROM SAMPLE_BOOK_REVIEWS
        WHERE BOOK_NO = :NEW.BOOK_NO;
        
        v_temp_point := (v_current_point*v_current_row_count + :NEW.REVIEW_POINT)/(v_current_row_count + 1);
        v_point := trunc(v_temp_point, 1);
        
        UPDATE SAMPLE_BOOKS
        SET 
            BOOK_POINT = v_point
        WHERE 
            BOOK_NO = :NEW.BOOK_NO;
    END;