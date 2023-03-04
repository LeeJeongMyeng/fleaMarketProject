DROP TABLE FLEAMARKETQNA;
CREATE TABLE FLEAMARKETQNA
(
	qnaNo varchar2(100) NOT NULL,
	title varchar2(100),
	content varchar2(2000),
	regDate  varchar2(100),
	uptDate varchar2(100),
	email varchar2(50) NOT NULL,
	method char,
	category varchar2(100),
	PRIMARY KEY (qnaNo)
);

DROP SEQUENCE FLEAMARKETQNA_seq;
CREATE SEQUENCE FLEAMARKETQNA_seq 
      increment by 1
      start with 1
      nocache
      MINVALUE 0
      MAXVALUE 100000;

INSERT INTO FLEAMARKETQNA values(
FLEAMARKETQNA_seq.nextval,
#{title},#{content},
to_CHAR(sysdate,'YYYY-MM-DD'),
to_CHAR(sysdate,'YYYY-MM-DD'),
#{email},#{method},
#{category});

INSERT INTO FLEAMARKETQNA values(
FLEAMARKETQNA_seq.nextval,
'제목','내용',
to_CHAR(sysdate,'YYYY-MM-DD'),
to_CHAR(sysdate,'YYYY-MM-DD'),
'이메일','h',
'카테고리');



SELECT * FROM FLEAMARKETQNA;

------------------------------------------------------------------
CREATE TABLE QNAFile
(
	FileName varchar2(100),
	filePath varchar2(200),
	qnaNo varchar2(100) NOT NULL
);