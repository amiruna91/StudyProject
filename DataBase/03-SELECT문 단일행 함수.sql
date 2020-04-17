-- 단일행 함수 중 문자함수 사용하기
-- 사원의 아이디, 이름을 조회하기(이름을 대문자로 표시)
select employee_id
    , upper(first_name)
    , lower(first_name)
    , length(first_name) 길이
    , concat(first_name, last_name)
    , lpad(first_name, 10, '#')
    , rpad(first_name, 10, '@')
    , first_name|| ' ' ||last_name
from employees;

-- 문자 자르기
select substr('201231', 3, 2)
from dual;

-- dual 더미 테이블
select *
from dual;

-- instr 원하는 문자 인덱스 알아내기
select instr('010-1111-2222', '-')
from dual;

-- instr를 사용하여 원하는 문자까지 잘라내기
select substr('서울시 서대문구', 1, instr('서울시 서대문구', ' ')-1)
from dual;

select street_address, substr(street_address, 1, instr(street_address, ' ')-1)
from locations;

-- replace 지정한 문자를 바꾸기
select replace(first_name,'a','A')
from employees;

-- 숫자 함수
SELECT
    ROUND(1265.737, 2) "2",     -- 소수점 2자리로 반올림해라
    ROUND(1265.737, 1) "1",     -- 소수점 1자리로 반올림해라
    ROUND(1265.737, 0) "0",     -- 일의 자리로 반올림해라
    ROUND(1265.737) " ",        -- 일의 자리로 반올림해라
    ROUND(1265.737, -1) "-1",   -- 심의 자리로 반올림해라
    ROUND(1265.737, -2) "-2"    -- 백의 자리로 반올림해라
FROM DUAL;

-- 숫자값 버리기
SELECT
    trunc(1265.737, 2) "2",     -- 소수점 2자리까지만 남기고 버려라
    trunc(1265.737, 1) "1",     -- 소수점 1자리까지만 남기고 버려라
    trunc(1265.737, 0) "0",     -- 일의 자리까지만 남기고 버려라
    trunc(1265.737) " ",        -- 일의 자리까지만 남기고 버려라
    trunc(1265.737, -1) "-1",   -- 심의 자리까지만 남기고 버려라
    trunc(1265.737, -2) "-2"    -- 백의 자리까지만 남기고 버려라
FROM DUAL;

-- 직원들의 시급을 조회하기
-- 직원아이디, 이름, 직종아이디, 급여, 시급
-- 시급 = (급여*환율)/(5*8) 시급은 원단위까지만 표시한다.
select employee_id
    , first_name
    , job_id
    , salary
    , trunc((salary*1220.40)/(5*8)) PAY_FOR_HOUR
from employees
order by pay_for_hour desc;

-- 나머지값 구하기
SELECT MOD(32, 5) 
FROM DUAL;

-- 날짜 함수
-- 현재 날짜와 시간정보 조회하기
SELECT SYSDATE
FROM DUAL;

-- 직원아이디, 직워명, 입사일, 오늘까지 근무한 날짜 조회하기
SELECT EMPLOYEE_ID
    , FIRST_NAME
    , HIRE_DATE
    , TRUNC(SYSDATE-HIRE_DATE)
FROM EMPLOYEES;

-- 오늘, 3일전, 1주일전, 1개월전
SELECT SYSDATE "지금"
    , SYSDATE - 3 "3일전"
    , SYSDATE - 7 "1주일 전"
    , SYSDATE - 30 " 1달 전"
FROM DUAL;

-- 60번 부서에 소속된 사원들의 아이디, 이름, 입사일, 근무한 개월수를 조회하기
-- 개월수는 소숫점부분은 버린다.
select employee_id
    , first_name
    , hire_date
    , trunc(months_between(sysdate, hire_date))
from employees
where department_id = 60;

-- 오늘부터 3개월 후에 날짜는?
select add_months(sysdate, 3), add_months(sysdate, -3)
from dual;

-- 날짜 반올림하기, 버리기
select sysdate , round(sysdate), trunc(sysdate)
from dual;

-- 두 날짜간의 일 수 계산하기
-- 현재 날자에 대해 TRUNC()함수로 시분초를 전부 0으로 만든 후 날짜 연산을 했다.
select employee_id
    , first_name
    , hire_date
    , sysdate - hire_date
    , trunc(sysdate) - hire_date
from employees;

-- 이번 달의 마지막날 조회하기
select last_day(trunc(sysdate))
from dual;

-- 오늘을 기준으로 다음번 토요일
select next_day(trunc(sysdate), 7)
from dual;

-- 오늘을 기준으로 다음 번 금요일
select next_day(trunc(sysdate), 6)
from dual;

-- 오늘을 기준으로 다음 번 일요일
select next_day(trunc(sysdate), 1)
from dual;

-- 변환 함수
-- 날짜를 문자로 변환하기
select to_char(sysdate, 'yyyy') 년
    , to_char(sysdate, 'mm') 월
    , to_char(sysdate, 'dd') 일
    , to_char(sysdate, 'day') 요일
    , to_char(sysdate, 'am') "오전/오후"
    , to_char(sysdate, 'hh') 시간
    , to_char(sysdate, 'hh24') 시간 
    , to_char(sysdate, 'mi') 분
    , to_char(sysdate, 'ss') 초
from dual;

-- 2003년도에 입사한 사원의 아이디, 이름, 입사한 달을 조회하기
select employee_id, first_name, to_char(hire_date, 'mm') 월
from employees
where to_char(hire_date, 'yyyy') = '2003';

-- 입사일이 오늘 날짜와 같은 날짜에 입사한 직원의 아이디, 이름, 입사일을 조회하기
select employee_id, first_name, hire_date
from employees
where to_char(hire_date, 'mmdd') = to_char(sysdate, 'mmdd');

-- 특정날짜를 나타내는 문자를 날짜(DATE 타입)로 변환하기
select to_date('2018-12-31', 'yyyy-mm-dd') + 1000
from dual;

-- 특정날짜를 나타내는 문자를 날짜로 변환해서 오늘까지의 일수, 개월수를 조회하기
select trunc(sysdate) - to_date('2016-04-17', 'yyyy-mm-dd')
    , months_between(trunc(sysdate), to_date('2016-04-17', 'yyyy-mm-dd'))
from dual;

-- 2005-01-01 ~ 2005-03-31 사이에 입사한 사원의 아이디, 이름, 입사일, 직종아이디 조회하기
select employee_id
    , first_name
    , hire_date
    , job_id
from employees
where hire_date between to_date('2005-01-01', 'yyyy-mm-dd') 
                    and to_date('2005-03-31', 'yyyy-mm-dd')
order by hire_date;

-- 2003년에 입사한 직원의 아이디, 이름, 입사일 조회하기
select employee_id, first_name, hire_date   -- 좌변을 가공하지 말라!! 
from employees
where to_char(hire_date, 'yyyy') = '2003'
order by hire_date;

select employee_id, first_name, hire_date
from employees
where hire_date >= to_date('20030101', 'yyyymmdd')
and hire_date < to_date('20040101', 'yyyymmdd')
order by hire_date;

-- 묵시적인 형변환
select employee_id, first_name, hire_date
from employees
where hire_date >= '20030101'
and hire_date < '20040101'
order by hire_date;

select employee_id, first_name, hire_date
from employees
where hire_date >= '2003/01/01'
and hire_date < '2004/01/01'
order by hire_date;

-- 숫자를 천단위 마다 구분자가 포함된 텍스트로 변환해서 조회하기
select to_char(10000, '0,000,000')
    , to_char(10000, '9,999,999')
from dual;

-- 숫자를 소숫점 2자리에서 반올림한 후 텍스트로 변환해서 조회하기
select to_char(123.456, '000.00')
    , to_char(123.456, '999.99')
from dual;

-- 문자를 숫자로 변환해서 사용하기
-- 급여가 15000달러 이상인 직원의 아이디, 이름, 급여를 조회하기
select employee_id, first_name, salary
from employees
where salary >= '15000';

select employee_id, first_name, salary
from employees
where salary >= to_number('15000');

-- TO_NUMBER() 함수를 반드시 사용해야 하는 경우
select employee_id, first_name, salary
from employees
where salary >= to_number('15,000', '99,999');

-- NVL() 함수
select nvl(10, 1)   -- 10이 최종값이다
    , nvl(null, 1)  -- 1이 최종값이다
from dual;

-- 직원아이디, 이름, 급여, 커미션을 조회하기
-- 커미션값이 null인 경우 0으로 조회한다.
select employee_id, first_name, salary, nvl(commission_pct, 0) comm
from employees
order by employee_id;

-- 직원아이디, 이름, 실급여를 조회하기
-- 실급여 = 급여 + 급여*커미션이다.
select employee_id
    , first_name
    , salary + salary*commission_pct salary1
    , salary + salary*nvl(commission_pct, 0) salary2
from employees
order by employee_id;

-- 부서아이디, 부서명, 해당부서 관리자 아이디를 조회하기
-- 관리자 아이디가 null인 경우 '지정된 관리자 없음'으로 조회하기
select department_id
    , department_name
    , nvl(to_char(manager_id), '지정된 관리자 없음')
from departments
order by department_id;

-- 부서아이디, 부서명, 해당부서 관리자 아이디를 조회하기
-- 관리자 아이디가 null인 경우 100번직원을 관지자로 조회하기
select department_id
    , department_name
    , nvl(manager_id, 100)
from departments
order by department_id;

-- NVL2() 함수 사용하기
select nvl2(10, 1, 0)       -- 최종값은 1이다.
    , nvl2(null, 1, 0)      -- 최종값은 0이다.
from dual;

-- 직원아이디, 이름, 커미션 수령여부를 'YES', 'NO'로 조회하기
select 
    employee_id 아이디
    , first_name 이름
    , nvl2(commission_pct, 'YES', 'NO') 수령여부
from employees
order by employee_id;

-- CASE ~ WHEN
-- 직원아이디, 이름, 급여, 급여등급 조회하기
-- 급여 등급은 
-- 20000달러 이상   A등급
-- 10000달러 이상   B등급
-- 5000달러 이상    C등급
-- 그외
select 
    employee_id
    , first_name
    , salary
    , case
        when salary >= 20000 then 'A'
        when salary >= 10000 then 'B'
        when salary >= 5000 then 'C'
        else 'D'
     end salary_grade
from employees
order by employee_id;

-- CASE ~ WHEN
-- 직원아이디, 이름, 급여, 인상된 급여 조회하기
-- 급여 등급은 
-- 20000달러 이상   10%인상
-- 10000달러 이상   15%인상
-- 5000달러 이상    20%인상
-- 그외             25%인상
select
    employee_id
    , first_name
    , salary
    , case
        when salary >= 20000 then salary*1.1
        when salary >= 10000 then salary*1.15
        when salary >= 5000 then salary*1.2
        else salary*0.25
     end incresed_salary
from employees
order by employee_id;

-- 직원아이디, 이름, 급여, 인상된 급여를 조회하기
-- 인상률은
-- 소속부서가 50번 부서면 10%인상
-- 소속부서가 80번 부서면 15%인상
-- 그외 부서 5%인상
select
    employee_id
    , first_name
    , salary
    , case
        when department_id = 50 then salary*1.1
        when department_id = 80 then salary*1.15
        else salary*1.05
     end incresed_salary
from employees
order by employee_id;

select
    employee_id
    , first_name
    , salary
    , case department_id
        when 50 then salary*1.1
        when 80 then salary*1.15
        else salary*1.05
     end incresed_salary
from employees
order by employee_id;

-- decode()는 equal 비교만 가능하다!
select 
    employee_id
    , first_name
    , salary
    , decode(department_id, 50, salary*1.1,
                            80, salary*1.15,
                            salary*1.05) incresed_salary
from employees
order by employee_id;

-- DECODE() 함수를 사용해서 조회하기
-- 직원아이디, 이름, 급여, 인상된 급여 조회하기
-- 급여 등급은 
-- 20000달러 이상   A
-- 10000달러 이상   B
-- 5000달러 이상    C
-- 그외             D
select 
    employee_id
    , first_name
    , salary
    , decode(trunc(salary, -4), 20000, 'A'
                              , 10000, 'B'
                              , decode(round(salary, -4), 10000, 'C'
                                                               , 'D')) salary_grade
from employees
order by employee_id;

select 
    employee_id
    , first_name
    , salary
    , decode(trunc(salary, -4), 20000, 'A'
                              , 10000, 'B'
                              , decode(trunc(salary/5000)*5000, 5000, 'C'
                                                                    , 'D')) salary_grade
from employees
order by employee_id;