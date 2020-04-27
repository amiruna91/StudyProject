-- 북스토어 문의 게시판
-- 번호,  제목,      작성자아이디, 내용,     조회수, 작성일, 상태(답변완료여부), 질문유형
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

-- 북스토어 답변 게시판
-- 번호,   내용,     작성일, 문의글 번호
-- number, varchqr2, date,   number
create table sample_book_answers (
    answer_no               number(7, 0)    primary key,
    answer_count            varchar2(4000)  not null,
    answer_registered_date  date            default sysdate,
    question_no             number(7, 0)    references sample_book_questions (question_no)
);

-- 테이블 이름 변경하기
rename sample_book_answers to sample_book;
rename sample_book to sample_book_answers;

-- 문의/답변 게시판용 일련번호 생성기 만들기
create sequence sample_question_seq start with 1000000 nocache;     -- nocache는 미리 일정한 갯수를 뽑아내는 시스템을 안쓴다는 의미다.
create sequence sample_answer_seq start with 1000000 nocache;


