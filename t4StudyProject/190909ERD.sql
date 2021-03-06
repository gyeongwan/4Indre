/* Drop Tables */

DROP TABLE LIKES CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE STDHIST CASCADE CONSTRAINTS;
DROP TABLE CONTENT CASCADE CONSTRAINTS;
DROP TABLE DONATION CASCADE CONSTRAINTS;
DROP TABLE POINTHIST CASCADE CONSTRAINTS;
DROP TABLE MBR CASCADE CONSTRAINTS;
DROP TABLE NMBR CASCADE CONSTRAINTS;
DROP TABLE PAYMENT CASCADE CONSTRAINTS;
DROP TABLE SITEUSER CASCADE CONSTRAINTS;


/* Create Tables */

-- 게시글
CREATE TABLE BOARD
(
   -- 글번호
   POSTNUM varchar2(8) NOT NULL,
   -- 회원코드
   MBRCODE varchar2(10) NOT NULL,
   -- 카테고리분류
   CTG char(1) NOT NULL,
   -- 작성자
   WRITER varchar2(20) NOT NULL,
   -- 제목
   TITLE varchar2(100) NOT NULL,
   -- 등록일
   REGDATE date NOT NULL,
   -- 조회수
   READCNT number(4,0) NOT NULL,
   -- 추천수
   LIKECNT number(3) NOT NULL,
   -- 내용경로
   ARTICPATH varchar2(300) NOT NULL,
   -- 이미지경로
   ARTICIMGPATH varchar2(300),
   PRIMARY KEY (POSTNUM)
);


-- 컨텐츠
CREATE TABLE CONTENT
(
   -- 컨텐츠코드
   CTNCODE varchar2(3) NOT NULL,
   -- 컨텐츠명
   CTNNAME varchar2(100) NOT NULL UNIQUE,
   -- 등록일자
   CTNDATE varchar2(8) NOT NULL,
   -- 이미지경로
   CTNPATH varchar2(500) NOT NULL,
   -- 컨텐츠포인트
   CTNPOINT number(7,0) NOT NULL,
   PRIMARY KEY (CTNCODE)
);


-- 후원
CREATE TABLE DONATION
(
   -- 후원번호
   DNTNUM varchar2(10) NOT NULL,
   -- 금액
   DNTMNY number(6) NOT NULL,
   -- 종류
   DNTCODE varchar2(1) NOT NULL,
   PRIMARY KEY (DNTNUM)
);


-- 추천
CREATE TABLE LIKES
(
   -- 글번호
   POSTNUM varchar2(8) NOT NULL,
   -- 회원코드
   MBRCODE varchar2(10) NOT NULL,
   PRIMARY KEY (POSTNUM, MBRCODE)
);


-- 회원
CREATE TABLE MBR
(
   -- 회원코드
   MBRCODE varchar2(10) NOT NULL,
   -- 아이디
   ID varchar2(16) NOT NULL UNIQUE,
   -- 비밀번호
   PASSWORD varchar2(20) NOT NULL,
   -- 성명
   NAME varchar2(15) NOT NULL,
   -- 별명
   NICKNAME varchar2(18) NOT NULL UNIQUE,
   -- 이메일
   EMAIL varchar2(100),
   -- 연락처
   TEL varchar2(11),
   -- 포인트
   POINT number(7,0) NOT NULL,
   -- 회원상태
   MBRSTATE char(1) NOT NULL,
   PRIMARY KEY (MBRCODE)
);


-- 비회원
CREATE TABLE NMBR
(
   -- 비회원코드
   NMBRCODE varchar2(10) NOT NULL,
   -- 성명
   NMNAME varchar2(18),
   -- 연락처
   NMTEL varchar2(11),
   PRIMARY KEY (NMBRCODE)
);


-- 결제
CREATE TABLE PAYMENT
(
   -- 후원번호
   DNTNUM varchar2(10) NOT NULL,
   -- 유저코드
   USERCODE varchar2(10) NOT NULL,
   -- 결제일시
   PAYDATE varchar2(20) NOT NULL,
   -- 금액
   DNTMNY number(6) NOT NULL,
   -- 결제방식
   PAYMTHD char(1) NOT NULL,
   -- 결제상태
   PAYLV  char(1) NOT NULL,
   PRIMARY KEY (DNTNUM)
);


-- 포인트기록
CREATE TABLE POINTHIST
(
   -- 회원코드
   MBRCODE varchar2(10) NOT NULL,
   -- 포인트시퀀스
   PTSEQ varchar2(4) NOT NULL,
   -- 이력날짜
   PTDATE  varchar2(8) NOT NULL,
   -- 포인트이력
   PTLOG varchar2(100) NOT NULL,
   -- 사용포인트
   USEPT number(7,0) NOT NULL,
   -- 적립포인트
   SAVEPT number(7,0) NOT NULL,
   PRIMARY KEY (MBRCODE, PTSEQ)
);


-- 댓글
CREATE TABLE REPLY
(
   -- 글번호
   POSTNUM varchar2(8) NOT NULL,
   -- 댓글번호
   RENUM varchar2(8) NOT NULL,
   -- 회원코드
   MBRCODE varchar2(10) NOT NULL,
   -- 댓글참조
   REREF number(4,0) NOT NULL,
   -- 댓글순서
   REORDER number(4,0) NOT NULL,
   -- 댓글깊이
   REDEPT number(4,0) NOT NULL,
   -- 댓글작성자
   REWRITER varchar2(18) NOT NULL,
   -- 댓글작성일
   REDATE date NOT NULL,
   -- 댓글내용경로
   REPATH varchar2(300) NOT NULL,
   -- 댓글이미지경로
   REIMGPATH varchar2(300),
   PRIMARY KEY (POSTNUM, RENUM)
);


-- 유저
CREATE TABLE SITEUSER
(
   -- 유저코드
   USERCODE varchar2(10) NOT NULL,
   -- 회원여부
   USERCHK char(1),
   PRIMARY KEY (USERCODE)
);


-- 학습기록
CREATE TABLE STDHIST
(
   -- 회원코드
   MBRCODE varchar2(10) NOT NULL,
   -- 학습시퀀스
   STDSEQ varchar2(10) NOT NULL,
   -- 컨텐츠코드
   CTNCODE varchar2(3) NOT NULL,
   -- 학습일자
   STDDATE varchar2(8) NOT NULL,
   -- 학습포인트
   STDPOINT number(7,0) NOT NULL,
   PRIMARY KEY (MBRCODE, STDSEQ)
);



/* Create Foreign Keys */

ALTER TABLE LIKES
   ADD FOREIGN KEY (POSTNUM)
   REFERENCES BOARD (POSTNUM)
;


ALTER TABLE REPLY
   ADD FOREIGN KEY (POSTNUM)
   REFERENCES BOARD (POSTNUM)
;


ALTER TABLE STDHIST
   ADD FOREIGN KEY (CTNCODE)
   REFERENCES CONTENT (CTNCODE)
;


ALTER TABLE BOARD
   ADD FOREIGN KEY (MBRCODE)
   REFERENCES MBR (MBRCODE)
;


ALTER TABLE LIKES
   ADD FOREIGN KEY (MBRCODE)
   REFERENCES MBR (MBRCODE)
;


ALTER TABLE POINTHIST
   ADD FOREIGN KEY (MBRCODE)
   REFERENCES MBR (MBRCODE)
;


ALTER TABLE REPLY
   ADD FOREIGN KEY (MBRCODE)
   REFERENCES MBR (MBRCODE)
;


ALTER TABLE STDHIST
   ADD FOREIGN KEY (MBRCODE)
   REFERENCES MBR (MBRCODE)
;


ALTER TABLE DONATION
   ADD FOREIGN KEY (DNTNUM)
   REFERENCES PAYMENT (DNTNUM)
;


ALTER TABLE MBR
   ADD FOREIGN KEY (MBRCODE)
   REFERENCES SITEUSER (USERCODE)
;


ALTER TABLE NMBR
   ADD FOREIGN KEY (NMBRCODE)
   REFERENCES SITEUSER (USERCODE)
;


ALTER TABLE PAYMENT
   ADD FOREIGN KEY (USERCODE)
   REFERENCES SITEUSER (USERCODE)
;



/* Comments */

COMMENT ON TABLE BOARD IS '게시글';
COMMENT ON COLUMN BOARD.POSTNUM IS '글번호';
COMMENT ON COLUMN BOARD.MBRCODE IS '회원코드';
COMMENT ON COLUMN BOARD.CTG IS '카테고리분류';
COMMENT ON COLUMN BOARD.WRITER IS '작성자';
COMMENT ON COLUMN BOARD.TITLE IS '제목';
COMMENT ON COLUMN BOARD.REGDATE IS '등록일';
COMMENT ON COLUMN BOARD.READCNT IS '조회수';
COMMENT ON COLUMN BOARD.LIKECNT IS '추천수';
COMMENT ON COLUMN BOARD.ARTICPATH IS '내용경로';
COMMENT ON COLUMN BOARD.ARTICIMGPATH IS '이미지경로';
COMMENT ON TABLE CONTENT IS '컨텐츠';
COMMENT ON COLUMN CONTENT.CTNCODE IS '컨텐츠코드';
COMMENT ON COLUMN CONTENT.CTNNAME IS '컨텐츠명';
COMMENT ON COLUMN CONTENT.CTNDATE IS '등록일자';
COMMENT ON COLUMN CONTENT.CTNPATH IS '이미지경로';
COMMENT ON COLUMN CONTENT.CTNPOINT IS '컨텐츠포인트';
COMMENT ON TABLE DONATION IS '후원';
COMMENT ON COLUMN DONATION.DNTNUM IS '후원번호';
COMMENT ON COLUMN DONATION.DNTMNY IS '금액';
COMMENT ON COLUMN DONATION.DNTCODE IS '종류';
COMMENT ON TABLE LIKES IS '추천';
COMMENT ON COLUMN LIKES.POSTNUM IS '글번호';
COMMENT ON COLUMN LIKES.MBRCODE IS '회원코드';
COMMENT ON TABLE MBR IS '회원';
COMMENT ON COLUMN MBR.MBRCODE IS '회원코드';
COMMENT ON COLUMN MBR.ID IS '아이디';
COMMENT ON COLUMN MBR.PASSWORD IS '비밀번호';
COMMENT ON COLUMN MBR.NAME IS '성명';
COMMENT ON COLUMN MBR.NICKNAME IS '별명';
COMMENT ON COLUMN MBR.EMAIL IS '이메일';
COMMENT ON COLUMN MBR.TEL IS '연락처';
COMMENT ON COLUMN MBR.POINT IS '포인트';
COMMENT ON COLUMN MBR.MBRSTATE IS '회원상태';
COMMENT ON TABLE NMBR IS '비회원';
COMMENT ON COLUMN NMBR.NMBRCODE IS '비회원코드';
COMMENT ON COLUMN NMBR.NMNAME IS '성명';
COMMENT ON COLUMN NMBR.NMTEL IS '연락처';
COMMENT ON TABLE PAYMENT IS '결제';
COMMENT ON COLUMN PAYMENT.DNTNUM IS '후원번호';
COMMENT ON COLUMN PAYMENT.USERCODE IS '유저코드';
COMMENT ON COLUMN PAYMENT.PAYDATE IS '결제일시';
COMMENT ON COLUMN PAYMENT.DNTMNY IS '금액';
COMMENT ON COLUMN PAYMENT.PAYMTHD IS '결제방식';
COMMENT ON COLUMN PAYMENT.PAYLV  IS '결제상태';
COMMENT ON TABLE POINTHIST IS '포인트기록';
COMMENT ON COLUMN POINTHIST.MBRCODE IS '회원코드';
COMMENT ON COLUMN POINTHIST.PTSEQ IS '포인트시퀀스';
COMMENT ON COLUMN POINTHIST.PTDATE  IS '이력날짜';
COMMENT ON COLUMN POINTHIST.PTLOG IS '포인트이력';
COMMENT ON COLUMN POINTHIST.USEPT IS '사용포인트';
COMMENT ON COLUMN POINTHIST.SAVEPT IS '적립포인트';
COMMENT ON TABLE REPLY IS '댓글';
COMMENT ON COLUMN REPLY.POSTNUM IS '글번호';
COMMENT ON COLUMN REPLY.RENUM IS '댓글번호';
COMMENT ON COLUMN REPLY.MBRCODE IS '회원코드';
COMMENT ON COLUMN REPLY.REREF IS '댓글참조';
COMMENT ON COLUMN REPLY.REORDER IS '댓글순서';
COMMENT ON COLUMN REPLY.REDEPT IS '댓글깊이';
COMMENT ON COLUMN REPLY.REWRITER IS '댓글작성자';
COMMENT ON COLUMN REPLY.REDATE IS '댓글작성일';
COMMENT ON COLUMN REPLY.REPATH IS '댓글내용경로';
COMMENT ON COLUMN REPLY.REIMGPATH IS '댓글이미지경로';
COMMENT ON TABLE SITEUSER IS '유저';
COMMENT ON COLUMN SITEUSER.USERCODE IS '유저코드';
COMMENT ON COLUMN SITEUSER.USERCHK IS '회원여부';
COMMENT ON TABLE STDHIST IS '학습기록';
COMMENT ON COLUMN STDHIST.MBRCODE IS '회원코드';
COMMENT ON COLUMN STDHIST.STDSEQ IS '학습시퀀스';
COMMENT ON COLUMN STDHIST.CTNCODE IS '컨텐츠코드';
COMMENT ON COLUMN STDHIST.STDDATE IS '학습일자';
COMMENT ON COLUMN STDHIST.STDPOINT IS '학습포인트';


select * from mbr;
insert INTO content
values('ST1', '손쉽게 배우는 PC 자가정비', '20190907', 
'https://c.pxhere.com/photos/71/85/apple_macbook_laptop_technology_table_mixer_dj_equipment-1079002.jpg!d', 0);
insert INTO content
values('ST2', '어르신을 위한 스마트폰 첫걸음', '20190908', 
'https://c.pxhere.com/photos/b8/58/smartphone_movie_taking_pictures_audience_photography_filming_camera_fans-948921.jpg!d', 0);
insert INTO content
values('KO1', '키오스크로 음식점에서 주문하기', '20190907', 
'http://db.kookje.co.kr/news2000/photo/2018/0719/L20180719.22013008683i1.jpg', 2000);
insert INTO content
values('KO2', '키오스크로 주차 요금 정산하기', '20190908', 
'https://t1.daumcdn.net/cfile/tistory/99E8AD385CB6AADA09', 2500);

commit;
