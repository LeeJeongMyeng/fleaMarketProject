DROP TABLE FFile CASCADE CONSTRAINTS;
DROP TABLE FleaMarket CASCADE CONSTRAINTS;


--플리마켓 db
CREATE TABLE FleaMarket
(
	postingNumber varchar2(100) NOT NULL,--게시글 번호: 시퀀스
	title varchar2(100),
	registDate date, 
	content varchar2(500),
	bisenessNumber varchar2(100),
	email varchar2(50) NOT NULL, -- 회원 테이블
	approvalMaxCnt number,
	recruitmentStartDate date,
	recruitmentEndDate date,
	openDate date,
	closeDate date,
	-- N,P,C check 제약조건 넣기
	checkForm varchar2(10),
	viewCnt number,
	address varchar2(200),
	PRIMARY KEY (postingNumber)
);


SELECT * FROM FleaMarket;

DROP SEQUENCE fleaMarket_seq;
--파일 시퀀스 번호
CREATE SEQUENCE fleaMarket_seq
      INCREMENT BY 1
      START WITH 1
      MINVALUE 0
      MAXVALUE 100000
      nocache;
       
--플리마켓 파일
CREATE TABLE FFile
(
	filename varchar2(100),
	filePath varchar2(100),
	postingNumber varchar2(100) NOT NULL
);
SELECT * FROM ffile;       


INSERT INTO fleaMarket VALUES (fleaMarket_seq.nextval,'소상공인 행복마켓',sysdate,'주최 : 중소벤처기업부, 소상공인연합회<br>지역별 우수 소상공인 상품의 전시와 판매를 중심으로 플리마켓, 푸드트럭, 체험존 운영 예정<br>소상공인 업체의 지역 제품 판매','3762801384','28888wjdaud@naver.com',30,'20230101','20230131','20230301','20230307','P',NULL,NULL);
