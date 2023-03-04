-- 회원
SELECT * FROM fleamarketmember;

-- 플리마켓
SELECT * FROM fleamarket;
SELECT fm.*, TO_CHAR(registDate, 'YYYY.MM.DD') registDate
FROM fleamarket fm;

CREATE TABLE FleaMarket
(
	postingNumber varchar2(100) NOT NULL,
	title varchar2(100),
	registDate date, 
	content varchar2(500),
	bisenessNumber varchar2(100),
	email varchar2(50) NOT NULL,
	approvalMaxCnt number,
	recruitmentStartDate date,
	recruitmentEndDate date,
	openDate date,
	closeDate date,
	-- N,P,C 
	checkForm varchar2(10),
	viewCnt number,
	address varchar2(200),
	PRIMARY KEY (postingNumber)
);

CREATE SEQUENCE fleaMarket_seq
      INCREMENT BY 1
      START WITH 1
      MINVALUE 0
      MAXVALUE 100000;
     
DROP SEQUENCE fleaMarket_seq;

INSERT INTO fleaMarket VALUES (fleaMarket_seq.nextval,'소상공인 행복마켓',sysdate,'주최 : 중소벤처기업부, 소상공인연합회<br>지역별 우수 소상공인 상품의 전시와 판매를 중심으로 플리마켓, 푸드트럭, 체험존 운영 예정<br>소상공인 업체의 지역 제품 판매','3762801384','28888wjdaud@naver.com',30,'20230101','20230131','20230301','20230307','P',NULL,NULL);

-- 신청
SELECT * FROM FApplication;

SELECT fa.*, fm.title, fm.email, m.nickname
FROM FApplication fa, fleaMarket fm, fleamarketmember m
WHERE fa.postingNumber = fm.postingNumber
AND fa.email = m.email
ORDER BY fa.applicationDate DESC;

CREATE TABLE FApplication
(
	postingNumber varchar2(100) NOT NULL,
	email varchar2(50) NOT NULL,
	applicationNo number NOT NULL,
	applicationDate DATE,
	approvalWhether char,
	PRIMARY KEY (applicationNo)
);

CREATE SEQUENCE FApplication_seq
	INCREMENT BY 1
    START WITH 1
    MINVALUE 0
    MAXVALUE 100000
	nocache;
     
DROP SEQUENCE FApplication_seq;

INSERT INTO FApplication VALUES (1,'aoddl56@nate.com',FApplication_seq.nextval,sysdate,null);
INSERT INTO FApplication VALUES (2,'aoddl56@nate.com',FApplication_seq.nextval,sysdate,null);
INSERT INTO FApplication VALUES (11,'ehddms2909@naver.com',FApplication_seq.nextval,sysdate,null);
INSERT INTO FApplication VALUES (11,'pucoca@naver.com',FApplication_seq.nextval,sysdate,'a');

UPDATE FApplication
SET approvalWhether = 'r'
WHERE applicationNo = 3;

DROP TABLE FApplication;

-- 신청 파일
SELECT * FROM ApplicationFile;

SELECT *
FROM ApplicationFile
WHERE applicationNo = 3;
		
CREATE TABLE ApplicationFile
(
	filename varchar2(100),
	filePath varchar2(100),
	applicationNo number NOT NULL
);

INSERT INTO ApplicationFile VALUES ('','',3);

UPDATE ApplicationFile
SET applicationDate = '230302'
WHERE applicationNo = 3;
