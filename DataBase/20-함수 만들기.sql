-- 1.
-- 직원아이디를 전달받아서 그 직원의 연봉을 반환하는 함수(커미션이 포함된)
CREATE OR REPLACE FUNCTION GET_ANNUAL_SALARY
    (i_emp_id   IN number)      -- 직원아이디를 매개변수로 전달받는다.
    RETURN NUMBER               -- 이 함수의 반환값은 숫자값이다.
    
    IS
        v_salary        employees.salary%type;           -- 급여
        v_comm          employees.commission_pct%type;   -- 커미션
        v_annual_salary employees.salary%type;           -- 연봉
        
    BEGIN
        -- 직원아이디에 해당하는 직원의 급여와 커미션을 조회해서 v_salary와 v_comm에 저장한다.
        select salary, nvl(commission_pct, 0)
        into v_salary, v_comm
        from employees
        where employee_id = i_emp_id;
        
        -- 커미션이 반영된 연봉을 계산해서 변수에 대입한다.
        v_annual_salary := v_salary * 12 + trunc(v_salary * v_comm);
        
        -- 변수에 저장된 값을 반환한다.
        return v_annual_salary;
    END;
    
    
-- 2.
-- 지정된 부서에 소속된 사원수를 반환하는 함수
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

-- 부서아이디, 부서명, 사원수 조회하기
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
-- 사원들의 전체 연봉 총액을 계산하는 함수
CREATE OR REPLACE FUNCTION GET_TOTAL_SALARY
    RETURN NUMBER
IS
    v_total_salary  number := 0;
    v_salary        employees.salary%type;
    v_comm          employees.commission_pct%type;
    v_annual_salary employees.salary%type;
    
    -- 반복문에 필요한 커서 선언하기
    CURSOR emp_list IS
    SELECT SALARY, NVL(COMMISSION_PCT, 0) COMM
    FROM EMPLOYEES;
    
BEGIN
    -- 커서를 FOR문에서 실행시킨다.
    -- FOR 변수명 IN 커서명 LOOP
    --     수행문;
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
-- 지정된 부서의 연봉 총액을 반환하는 함수
CREATE OR REPLACE FUNCTION GET_DEPT_TOTAL_SALARY
    (i_dept_id  IN NUMBER)
    
    RETURN NUMBER
    
    IS
        v_salary        employees.salary%type;
        v_comm          employees.commission_pct%type;
        v_annual_salary employees.salary%type;
        v_total_salary  number := 0;
        
        -- 파라미터가 필요한 커서 선언
        -- 커서 실행에 필요한 파라미터를 정의한다.
        CURSOR emp_list(param_dept_id number) IS
        select salary, nvl(commission_pct, 0) comm
        from employees
        where department_id = param_dept_id;
        
    BEGIN
        -- FOR문을 사용해서 커서 실행하기
        FOR emp IN emp_list(i_dept_id) LOOP
            v_salary        := emp.salary;
            v_comm          := emp.comm;
            v_annual_salary := v_salary * 12 + trunc(v_salary * v_comm) *12;
            v_total_salary  := v_total_salary + v_annual_salary;
        END LOOP;
        
        RETURN v_total_salary;
    END;

-- 부서아이디, 부서명, 부서에 소속된 사원수, 부서의 총 연봉
select department_id, department_name, get_emp_count(department_id), get_dept_total_salary(department_id)
from departments;



-- 책번호에 해당하는 책의 총수량 구하는 함수
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