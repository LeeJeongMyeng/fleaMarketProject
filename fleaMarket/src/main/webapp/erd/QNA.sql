CREATE TABLE FLEAMARKETQNA
(
	qnaNo varchar2(100) NOT NULL,
	title varchar2(100),
	content varchar2(2000),
	regDate  date,
	uptDate date,
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
FLEAMARKETQNA_seq.nextval(),
#{title},#{content},
sysdate,sysdate,
#{email},#{method},
#{category});