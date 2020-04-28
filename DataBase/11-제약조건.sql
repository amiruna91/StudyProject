-- 책에 대한 리뷰와 평점을 담는 테이블
create table sample_book_reviews (
    review_no               number(7, 0) constraint review_no_pk PRIMARY KEY,
    review_content          varchar2(2000) constraint review_content_nn NOT NULL,
    review_point            number(1, 0) constraint review_point_ck CHECK (review_point >= 0 and review_point <= 5),
    review_registered_date  date         default sysdate,
    book_no                 number(7, 0) CONSTRAINT review_bookno_fk REFERENCES sample_books (book_no),
    user_id                 varchar2(50) CONSTRAINT review_userid_fk REFERENCES sample_book_users (user_id),
    constraint reviews_uk UNIQUE (book_no, user_id)
);

create sequence sample_review_seq nocache;

insert into sample_book_reviews
(review_no, review_content, review_point, book_no, user_id)
values
(sample_review_seq.nextval, '아주 좋은 내용이었습니다.', 5, 10026, 'hong');

insert into sample_book_reviews
(review_no, review_content, review_point, book_no, user_id)
values
(sample_review_seq.nextval, '아주 좋은 내용이었습니다.', 5, 10026, 'peter');

insert into sample_book_reviews
(review_no, review_content, review_point, book_no, user_id)
values
(sample_review_seq.nextval, '잘 읽었습니다.', 5, 10028, 'peter');

insert into sample_book_reviews
(review_no, review_content, review_point, book_no, user_id)
values
(sample_review_seq.nextval, '잘 읽었습니다.', 2, 10028, 'hong');

commit;

create table sample_book_likes (
    book_no     number(7, 0)    not null,
    user_id     varchar2(50)    not null,
    constraint likes_bookno_fk FOREIGN key (book_no) references sample_books (book_no),
    constraint likes_userid_fk foreign key (user_id) references sample_book_users (user_id),
    constraint likes_uk unique (book_no, user_id)
);