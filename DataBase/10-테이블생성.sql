-- �Ͻ���� ���� �Խ���
-- ��ȣ,  ����,      �ۼ��ھ��̵�, ����,     ��ȸ��, �ۼ���, ����(�亯�ϷῩ��), ��������
-- number, varchar2, varchar2,     varchar2, number, date,   char,               varchar2
create table sample_book_questions (
    question_no                 number(7, 0)    PRIMARY key, 
    question_title              varchar2(500)   not null,
    user_id                     varchar2(50)    REFERENCES sample_book_users (user_id),
    question_content            varchar2(4000)  not null,
    question_view_count         number(7, 0)    default 0,
    question_registered_date    date            default sysdate,
    question_status             char(1)         default 'N',
    question_type               varchar2(200)   not null
);

-- �Ͻ���� �亯 �Խ���
-- ��ȣ,   ����,     �ۼ���, ���Ǳ� ��ȣ
-- number, varchqr2, date,   number
create table sample_book_answers (
    answer_no               number(7, 0)    primary key,
    answer_count            varchar2(4000)  not null,
    answer_registered_date  date            default sysdate,
    question_no             number(7, 0)    references sample_book_questions (question_no)
);

-- ���̺� �̸� �����ϱ�
rename sample_book_answers to sample_book;
rename sample_book to sample_book_answers;

-- ����/�亯 �Խ��ǿ� �Ϸù�ȣ ������ �����
create sequence sample_question_seq start with 1000000 nocache;     -- nocache�� �̸� ������ ������ �̾Ƴ��� �ý����� �Ⱦ��ٴ� �ǹ̴�.
create sequence sample_answer_seq start with 1000000 nocache;


