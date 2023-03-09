------------------------------------------------------ 회원
SELECT * FROM fleamarketmember;

------------------------------------------------------ 플리마켓
SELECT * FROM fleamarket;
SELECT * FROM ffile;
INSERT INTO ffile VALUES ('플리마켓 신청 양식.docx','C:/Users/gram/git/fleaMarketProject/fleaMarket/src/main/webapp/resource/img/fleaMarket/',6);
INSERT INTO ffile VALUES ('양식 작성 방법.txt','C:/Users/gram/git/fleaMarketProject/fleaMarket/src/main/webapp/resource/img/fleaMarket/',6);
INSERT INTO ffile VALUES ('m02.jpg','C:/Users/gram/git/fleaMarketProject/fleaMarket/src/main/webapp/resource/img/fleaMarket/',6);
INSERT INTO ffile VALUES ('market.jpg','C:/Users/gram/git/fleaMarketProject/fleaMarket/src/main/webapp/resource/img/fleaMarket/',6);
INSERT INTO ffile VALUES ('fleaMarket.jpg','C:/Users/gram/git/fleaMarketProject/fleaMarket/src/main/webapp/resource/img/fleaMarket/',6);
DELETE FROM ffile WHERE filename = '6 최종 프로젝트 공지.txt';

CREATE TABLE FleaMarket
(
	postingNumber varchar2(100) NOT NULL,
	title varchar2(100),
	registDate varchar2(100), 
	content varchar2(500),
	bisenessNumber varchar2(100),
	email varchar2(50) NOT NULL,
	approvalMaxCnt number,
	recruitmentStartDate varchar2(100),
	recruitmentEndDate varchar2(100),
	openDate varchar2(100),
	closeDate varchar2(100),
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

INSERT INTO fleaMarket VALUES (fleaMarket_seq.nextval,'댕댕이마켓',to_CHAR(sysdate,'YYYY-MM-DD'),'이 세상 모든 댕댕이들을 위한 플리마켓에 참여해주세요!<br>강아지용품이라면 어떤 분이든 환영합니다 ^-^','3762801384','ehddms2909@naver.com',30,'2023-03-01','2023-03-31','2023-07-01','2023-07-07','P',0,'서울 강남구 삼성동 135-4');

------------------------------------------------------ 신청
SELECT * FROM FApplication;
SELECT * FROM fleamarket;

SELECT fa.*, fm.title, fm.email, m.nickname
FROM FApplication fa, fleaMarket fm, fleamarketmember m
WHERE fa.postingNumber = fm.postingNumber(+)
AND fa.email = m.email(+)
ORDER BY fa.applicationno DESC;
------------------------------------------------------ 총 페이지 수
SELECT count(*)
FROM (
	SELECT rownum cnt, fa.applicationno applicationno, fa.applicationdate applicationdate, fa.approvalwhether approvalwhether, fm.title title, fm.email email, m.nickname nickname
	FROM FApplication fa, fleaMarket fm, fleamarketmember m
	WHERE fa.postingNumber = fm.postingNumber(+)
	AND fa.email = m.email(+)
	);

SELECT count(*)
FROM FApplication fa, fleaMarket fm
WHERE fa.postingNumber = fm.postingNumber(+)
AND fm.title like '%'||#{title}||'%';
------------------------------------------------------ 페이징 + 검색 연습
select *
from (
	select rownum cnt, fa.*
	from FApplication fa
	)	
where cnt between 1 and 5;
------------------------------------------------------ 페이징 + 검색
SELECT rownum cnt, applicationno, applicationdate, approvalwhether, title, email, nickname
FROM (
	SELECT rownum cnt, fa.applicationno applicationno, fa.applicationdate applicationdate, fa.approvalwhether approvalwhether, fm.title title, fm.email email, m.nickname nickname
	FROM FApplication fa, fleaMarket fm, fleamarketmember m
	WHERE fa.postingNumber = fm.postingNumber(+)
	AND fa.email = m.email(+)
	AND fm.title like '%'||''||'%'
	ORDER BY fa.applicationno DESC
	)	
WHERE cnt BETWEEN 1 AND 50;

-- 수정
SELECT *
FROM (
	SELECT rownum cnt, fa.*
	FROM FApplication fa
	ORDER BY fa.applicationDate DESC
	)	
WHERE cnt BETWEEN 1 AND 10;

-- AND fm.title like '%'||#{title}||'%'

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
INSERT INTO FApplication VALUES (6,'pucoca@naver.com',FApplication_seq.nextval,sysdate,'a');
INSERT INTO FApplication VALUES (#{postingNumber},#{email},FApplication_seq.nextval,sysdate,null);

UPDATE FApplication
SET approvalWhether = 'r'
WHERE applicationNo = 3;

DROP TABLE FApplication;

------------------------------------------------------ 신청 파일
SELECT *
FROM ApplicationFile
ORDER BY applicationno;

SELECT filename
FROM ApplicationFile
WHERE applicationNo = #{applicationNo}
		
CREATE TABLE ApplicationFile
(
	filename varchar2(100),
	applicationNo number NOT NULL
);

INSERT INTO ApplicationFile VALUES ('',3);
INSERT INTO ApplicationFile VALUES (#{filename},FApplication_seq.currval);

UPDATE ApplicationFile
SET applicationDate = '230302'
WHERE applicationNo = 3;

