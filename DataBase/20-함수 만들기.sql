-- 1.
-- �������̵� ���޹޾Ƽ� �� ������ ������ ��ȯ�ϴ� �Լ�(Ŀ�̼��� ���Ե�)
CREATE OR REPLACE FUNCTION GET_ANNUAL_SALARY
    (i_emp_id   IN number)      -- �������̵� �Ű������� ���޹޴´�.
    RETURN NUMBER               -- �� �Լ��� ��ȯ���� ���ڰ��̴�.
    
    IS
        v_salary        employees.salary%type;           -- �޿�
        v_comm          employees.commission_pct%type;   -- Ŀ�̼�
        v_annual_salary employees.salary%type;           -- ����
        
    BEGIN
        -- �������̵� �ش��ϴ� ������ �޿��� Ŀ�̼��� ��ȸ�ؼ� v_salary�� v_comm�� �����Ѵ�.
        select salary, nvl(commission_pct, 0)
        into v_salary, v_comm
        from employees
        where employee_id = i_emp_id;
        
        -- Ŀ�̼��� �ݿ��� ������ ����ؼ� ������ �����Ѵ�.
        v_annual_salary := v_salary * 12 + trunc(v_salary * v_comm);
        
        -- ������ ����� ���� ��ȯ�Ѵ�.
        return v_annual_salary;
    END;
    
    
-- 2.
-- ������ �μ��� �Ҽӵ� ������� ��ȯ�ϴ� �Լ�
CREATE OR REPLACE FUNCTION GET_EMP_COUNT
    (i_dept_id  in number)
    RETURN number
IS
    v_emp_count number(3, 0);
BEGIN
    select count(*)
    into v_emp_count
    from employees
    where department_id = i_dept_id;
    
    RETURN v_emp_count;
END;

-- �μ����̵�, �μ���, ����� ��ȸ�ϱ�
select department_id, count(*)
from employees
group by department_id;

select A.department_id, B.department_name, A.cnt
from (select department_id, count(*) cnt
      from employees
      group by department_id) A, departments B
where A.department_id = B.department_id
order by 1;

select department_id, department_name, get_emp_count(department_id)
from departments;



-- 3.
-- ������� ��ü ���� �Ѿ��� ����ϴ� �Լ�
CREATE OR REPLACE FUNCTION GET_TOTAL_SALARY
    RETURN NUMBER
IS
    v_total_salary  number := 0;
    v_salary        employees.salary%type;
    v_comm          employees.commission_pct%type;
    v_annual_salary employees.salary%type;
    
    -- �ݺ����� �ʿ��� Ŀ�� �����ϱ�
    CURSOR emp_list IS
    SELECT SALARY, NVL(COMMISSION_PCT, 0) COMM
    FROM EMPLOYEES;
    
BEGIN
    -- Ŀ���� FOR������ �����Ų��.
    -- FOR ������ IN Ŀ���� LOOP
    --     ���๮;
    -- END LOOP;
    FOR emp IN emp_list LOOP
        v_salary := emp.salary;
        v_comm := emp.comm;
        v_annual_salary := v_salary * 12 + trunc(v_salary * v_comm) *12;
        v_total_salary := v_total_salary + v_annual_salary;
    END LOOP;
    
    RETURN v_total_salary;
END;


-- 4.
-- ������ �μ��� ���� �Ѿ��� ��ȯ�ϴ� �Լ�
CREATE OR REPLACE FUNCTION GET_DEPT_TOTAL_SALARY
    (i_dept_id  IN NUMBER)
    
    RETURN NUMBER
    
    IS
        v_salary        employees.salary%type;
        v_comm          employees.commission_pct%type;
        v_annual_salary employees.salary%type;
        v_total_salary  number := 0;
        
        -- �Ķ���Ͱ� �ʿ��� Ŀ�� ����
        -- Ŀ�� ���࿡ �ʿ��� �Ķ���͸� �����Ѵ�.
        CURSOR emp_list(param_dept_id number) IS
        select salary, nvl(commission_pct, 0) comm
        from employees
        where department_id = param_dept_id;
        
    BEGIN
        -- FOR���� ����ؼ� Ŀ�� �����ϱ�
        FOR emp IN emp_list(i_dept_id) LOOP
            v_salary        := emp.salary;
            v_comm          := emp.comm;
            v_annual_salary := v_salary * 12 + trunc(v_salary * v_comm) *12;
            v_total_salary  := v_total_salary + v_annual_salary;
        END LOOP;
        
        RETURN v_total_salary;
    END;

-- �μ����̵�, �μ���, �μ��� �Ҽӵ� �����, �μ��� �� ����
select department_id, department_name, get_emp_count(department_id), get_dept_total_salary(department_id)
from departments;



-- å��ȣ�� �ش��ϴ� å�� �Ѽ��� ���ϴ� �Լ�
CREATE OR REPLACE FUNCTION GET_TOTAL_ORDER_AMOUNT
    (i_book_no sample_books.book_no%type)
    RETURN NUMBER
    
    IS
        v_total_amount  number := 0;
        
        CURSOR book_list(param_book_no sample_books.book_no%type) IS
        SELECT ORDER_AMOUNT
        FROM SAMPLE_BOOK_ORDERS
        WHERE BOOK_NO = param_book_no;
    BEGIN
        FOR cnt IN book_list(i_book_no) LOOP
            v_total_amount := v_total_amount + cnt.ORDER_AMOUNT;
        END LOOP;
        
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