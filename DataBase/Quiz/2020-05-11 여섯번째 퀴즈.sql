-- ����� ���̵�, å��ȣ, �ֹ����� ���� �޾Ƽ� �ֹ����� �����ϴ� ���ν���
CREATE OR REPLACE PROCEDURE ADD_BOOK_ORDER
    (i_user_id      sample_book_orders.user_id%type,
     i_book_no      sample_book_orders.book_no%type,
     i_order_amount sample_book_orders.order_amount%type)
     
    IS
        v_book_stock    sample_books.book_stock%type;
        v_order_price   sample_book_orders.order_price%type;
        
        -- ��������� ���� �̸� ����
        book_application_error exception;
    BEGIN
        SELECT book_discount_price, book_stock
        INTO v_order_price, v_book_stock
        from sample_books
        where book_no = i_book_no;
        
        IF v_book_stock >= i_order_amount THEN 
        -- �ֹ����� ����
        INSERT INTO sample_book_orders
        (order_no, user_id, book_no, order_price, order_amount)
        values
        (sample_order_seq.nextval, i_user_id, i_book_no, v_order_price, i_order_amount);
        
        -- å��� ����
        UPDATE SAMPLE_BOOKS
        SET
            BOOK_STOCK = BOOK_STOCK - i_order_amount
        WHERE 
            BOOK_NO = i_book_no;
            
        ELSE
            -- å�� ��� �ֹ������� ������ ��� ���� �߻�
            RAISE book_application_error;
        END IF; 
        
        -- ����ó��
        EXCEPTION
            -- ��������� ���ܰ� �߻��ߴٸ� ����Ŭ�� RAISE_APPLICATION_ERROR(�����ڵ�, �����޼���)�� �����Ų��.
            WHEN book_application_error THEN
                -- �����ڵ�� -20000 ~ -20999 ������ ���� ����Ѵ�.
                RAISE_APPLICATION_ERROR(-20000, '��� �����մϴ�.');
    END;
    
    
-- å��ȣ�� �ش��ϴ� å�� �� ���ż����� ��ȯ�ϴ� �Լ�
CREATE OR REPLACE FUNCTION GET_TOTAL_ORDER_AMOUNT
    (i_book_no sample_books.book_no%type)
    
    -- ��ȯŸ�� ����
    RETURN NUMBER
    
    IS
        -- �� ���ż����� ������ ����
        v_total_amount  number := 0;
    BEGIN
    
        -- �ѱ��ż����� ��ȸ�ؼ� ������ ���
       SELECT nvl(sum(order_amount), 0)
       INTO v_total_amount
       FROM sample_book_orders
       WHERE book_no = i_book_no;
        
        RETURN v_total_amount;
    END;
    

 -- å��ȣ�� �ش��ϴ� å�� �� �ǸŰ����� ���ϴ� �Լ�
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