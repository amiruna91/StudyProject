create table contacts (
    contact_name    varchar2(100)   not null,
    contact_tel     varchar2(50)    not null,
    contact_email   varchar2(256),
    contact_create_date date    default sysdate
);

insert into contacts 
(contact_name, contact_tel, contact_email)
values
('홍길동', '010-1234-5678', 'hong@gmail.com');

insert into contacts
(contact_name, contact_tel, contact_email)
values
('김유신', '010-5122-1512', 'kim@naver.com');

commit;

select *
from contacts;

-- HR 사용자에게 CONTACTS에 대한 객체권한 부여하기
grant select
on contacts
to hr;

-- HR 사용자에게 CONTACTS에 대한 객체권한 부여하기
GRANT UPDATE (CONTACT_TEL, CONTACT_EMAIL)
ON CONTACTS
TO HR;

SELECT *
FROM ROLE_SYS_PRIVS;

-- 데이터베이스 사전테이블 확인해보기(distionary 테이블)
-- 사용자의 모든 테이블 정보조회
select *
from user_tables;

-- 사용자의 모든 뷰 정보 조회
select *
from user_views;

-- 사용자의 모든 시퀀스 정보 조회
select *
from user_sequences;

-- 사용자 정보 조회
select *
from user_users;

-- 사용자 / 유저 등록하기
-- 사용자명 scott
-- 비밀번호 tiger
create user scott identified by tiger;

-- 생성된 사용자에게 데이테베이스 연결 권한 부여하기
grant create session to scott;

-- 일반 사용자에게 부여되는 시스템권한을 그룹화 해놓은 롤을 이용해서 권한 부여하기
grant connect, resource to scott;

-- 권한 부여하기
-- 전화번호 조회하기, 실행 성공
select *
from scott.contacts;

-- 전화번호 변경하기, 실행 성공
UPDATE SCOTT.CONTACTS
SET
    CONTACT_TEL = '010-1111-2222'
WHERE 
    CONTACT_NAME = '홍길동';
    
-- 이름 변경하기, 객체권한 부족으로 실행 오류
UPDATE SCOTT.CONTACTS
SET
    CONTACT_TEL = '강감찬'
WHERE 
    CONTACT_NAME = '김유신';
    

-- SCOTT.CONTACTS에 대한 테이블의 동의어를 생성하기
CREATE SYNONYM CONTACTS FOR SCOTT.CONTACTS;

SELECT *
FROM CONTACTS;