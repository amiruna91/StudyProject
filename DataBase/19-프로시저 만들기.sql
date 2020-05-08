-- ���� ��ȣ�� �λ���� ���޹޾Ƽ� �� ������ �޿��� �λ��Ű�� ���ν��� �ۼ��ϱ�
create or replace procedure update_salary
(i_emp_id in number)
IS
    -- ���� �����Ѵ�.
    -- ������       ������ ������Ÿ��
    --              employees�� salary �÷��� ������Ÿ�԰� ������ ������Ÿ������ ��������
    v_emp_salary    employees.salary%type;  -- ����� �޿�
    v_update_rate    number(3, 2);           -- �ݿ� �λ��
    
BEGIN
    -- SQL����, PL/SQL ������ �ۼ�
    
    -- ���޹��� �������̵� �ش��ϴ� ������ �޿��� ��ȸ�Ѵ�.
    -- ��ȸ�� ������ �޿��� ������ ������ v_emp_salary�� �����Ѵ�.
    select salary
    into  v_emp_salary
    from employees
    where employee_id = i_emp_id;
    
    -- ������ �޿��� ���� �λ���� �����ϱ�
    -- 20000�޷� �̻� 10%, 10000�޷� �̻� 15%, �׿� 20% �λ�
    if v_emp_salary >= 20000 then v_update_rate := 0.1;
    elsif v_emp_salary >= 10000 then v_update_rate := 0.15;
    else v_update_rate := 0.2;
    end if;
    
    -- �޿��� �λ��Ű��
    update employees
    set
        salary = salary + trunc(salary*v_update_rate)
    where 
        employee_id = i_emp_id;
        
    -- DB�� ���������� �ݿ���Ű��
    commit;
    
END;


-- å�ֹ��ϴ� ���ν���
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