-- 커뮤니티 게시글
CREATE TABLE capplicaion
(
	communityNumber number NOT NULL, -- 커뮤니티번호
	title varchar2(100), -- 제목
	content varchar2(2000), -- 커뮤니티 내용
	registDate date, -- 등록날짜
	updateDate date, -- 수정날짜 
	category varchar2(50), -- 카테고리
	email varchar2(50) NOT NULL, -- 이메일(FK)
	-- 구분자 #
	hashtag varchar2(100), -- 해시태그
	viewCnt number, -- 조회수
	PRIMARY KEY (communityNumber)
);
CREATE SEQUENCE communityNumber_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE communityNumber_seq;

SELECT communityNumber_seq.nextval FROM dual;
SELECT communityNumber_seq.currval FROM dual;
	
DROP TABLE capplicaion CASCADE CONSTRAINTS;
SELECT * FROM capplicaion;


UPDATE capplicaion 
SET likecnt='5'
WHERE communityNumber='comBoard20';

UPDATE capplicaion 
SET title='',
	content='',
	hashtag='#태그할수 있을까?',
	updatedate=sysdate
WHERE communityNumber='comBoard23';

SELECT * FROM capplicaion;
WHERE communityNumber='comBoard23';
INSERT INTO capplicaion values(communityNumber_seq.nextval, '제목','내용',sysdate,NULL,'사는이야기','yujin@gmail.com','#태그1 #태그2',0);
INSERT INTO capplicaion values(communityNumber_seq.nextval, '제목','내용',sysdate,NULL,'사는이야기','dbwls8382@gmail.com','#태그1 #태그2',0);
-- 커뮤니티 게시글 이미지
CREATE TABLE BoardImg
(
	imgName varchar2(1000), -- 파일명
	imgPath varchar2(1000), -- 파일경로
	communityNumber number NOT NULL -- 커뮤니티 번호(FK)
);
DROP TABLE BoardImg CASCADE CONSTRAINTS;

INSERT INTO BoardImg values('파일명','파일경로',communityNumber_seq.currval);

SELECT * FROM BoardImg;

UPDATE BoardImg
SET imgname=''
WHERE communitynumber ='69';

SELECT DISTINCT *
FROM BoardImg i,capplicaion c
WHERE i.communitynumber=c.communitynumber
AND c.email='yujin@gmail.com'
ORDER BY registdate;

SELECT *
FROM BoardImg i,capplicaion c
WHERE i.communitynumber=c.communitynumber
AND c.communitynumber ='68';

AND c.email='yujin@gmail.com'
ORDER BY registdate;



SELECT DISTINCT c.communitynumber, imgpath, title, content, registdate, updatedate, category, email, hashtag, viewcnt
FROM BoardImg i,capplicaion c
WHERE i.communityNumber=c.communityNumber
AND c.email='yujin@gmail.com';

-- 커뮤니티 게시글 좋아요
CREATE TABLE communityHeart(
   communityNumber varchar2(100) CONSTRAINT Heart_cnum_fk REFERENCES capplication(communitynumber) ON DELETE CASCADE,
   email varchar2(50) CONSTRAINT Heart_email_fk REFERENCES fleamarketmember(email) ON DELETE CASCADE
);

DROP TABLE communityHeart;

SELECT* FROM communityHeart;

-- 채팅
CREATE TABLE chat
(
	room_id number NOT NULL,
	message varchar2(2000),
	sendTime varchar2(500),
	senderemail varchar2(50) NOT NULL,
	communityNumber varchar2(100) NOT NULL,
	PRIMARY KEY (room_id)
);
DROP TABLE chat CASCADE CONSTRAINTS;

-- 채팅파일
CREATE TABLE chattingFile
(
	fileName varchar2(200),
	filePath varchar2(200),
	room_id number NOT NULL
);
DROP TABLE chattingFile CASCADE CONSTRAINTS;

-- 댓글
CREATE TABLE reply
(
	repNo number NOT NULL,	-- 댓글번호
	repContent varchar2(2000), -- 댓글내용
	repDate date, --등록날짜
	communityNumber varchar2(100) NOT NULL, --커뮤니티번호
	email varchar2(50) NOT NULL, --이메일
	reReport number, -- 댓글신고수
	PRIMARY KEY (repNo)
);
DROP TABLE reply CASCADE CONSTRAINTS;

CREATE SEQUENCE reply_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE reply_seq;

SELECT reply_seq.nextval FROM dual;
SELECT reply_seq.currval FROM dual;

SELECT * FROM reply ;
WHERE email='yujin@gmail.com';
SELECT * FROM capplicaion;

SELECT * 
FROM capplicaion c, reply r
WHERE c.COMMUNITYNUMBER = r.COMMUNITYNUMBER
AND c.email='yujin@gmail.com';
--AND r.email='yujin@gmail.com';

SELECT * FROM capplicaion c
WHERE email='yujin@gmail.com'
AND category='사는이야기';


INSERT INTO reply values(reply_seq.nextval,'멍청해요', sysdate,'comBoard1','yujin@gmail.com',0);
INSERT INTO reply values(reply_seq.nextval,'ㅇㅇ너도', sysdate,'comBoard1','ehddms2909@naver.com',0);
select * FROM FLEAMARKETMEMBER;
-- 대댓글
CREATE TABLE rereply
(
	rereplyNo number NOT NULL, -- 대댓글 번호
	rereplyContent varchar2(2000),	-- 대댓글 내용
	rereplyDate date,	-- 대댓글 등록날짜
	email varchar2(50) NOT NULL,	-- 이메일
	rereReportcnt number,	-- 대댓글 신고수
	repNo number NOT NULL,
	PRIMARY KEY (rereplyNo)
);
DROP TABLE rereply CASCADE CONSTRAINTS;

CREATE SEQUENCE rereply_seq
		increment by 1
		start with 0
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE rereply_seq;

SELECT rereply_seq.nextval FROM dual;
SELECT rereply_seq.currval FROM dual;

SELECT * FROM rereply;
SELECT * FROM capplicaion;

INSERT INTO rereply values(rereply_seq.nextval, '멍청이의 멍청이', sysdate, 'yujin@gmail.com','0', 0);


--  댓글 좋아요
CREATE TABLE reLike
(
	repNo number NOT NULL,	-- 댓글번호
	email varchar2(50) NOT NULL	--이메일
);
DROP TABLE reLike CASCADE CONSTRAINTS;

SELECT * FROM reply;
SELECT * FROM reLike;
select * FROM FLEAMARKETMEMBER;
INSERT INTO reLike values('0','pucoca@naver.com');

-- 대댓글 좋아요
CREATE TABLE rereLike
(
	rereplyNo number NOT NULL,	-- 대댓글번호
	email varchar2(50) NOT NULL	-- 이메일
);
DROP TABLE rereLike CASCADE CONSTRAINTS;

SELECT * FROM rereply;
SELECT * FROM rereLike;
select * FROM FLEAMARKETMEMBER;
INSERT INTO rereLike values('0','28888wjdaud@naver.com');
--팔로우/팔로잉
CREATE TABLE friend
(
	myemail varchar2(50) NOT NULL, -- 회원 이메일(FK 처리) 세션값
	following varchar2(50) NOT NULL -- 내가 팔로우 한사람
);
DROP TABLE friend CASCADE CONSTRAINTS;

INSERT INTO friend VALUES('yujin@gmail.com','ehddms2909@naver.com');
INSERT INTO friend VALUES('yujin@gmail.com','janexagnes@gmail.com');
INSERT INTO friend VALUES('yujin@gmail.com','28888wjdaud@naver.com');
INSERT INTO friend VALUES('yujin@gmail.com','pucoca@naver.com');
INSERT INTO friend VALUES('yujin@gmail.com','aoddl56@nate.com');
INSERT INTO friend VALUES('pucoca@naver.com','yujin@gmail.com');
INSERT INTO friend VALUES('two__yoon@naver.com','yujin@gmail.com');

SELECT * FROM friend;
select * FROM FLEAMARKETMEMBER;
SELECT * FROM profile;


select *
FROM FLEAMARKETMEMBER m,friend f,profile pro
WHERE f.following=m.email
AND f.following=pro.email
AND myemail='yujin@gmail.com';

SELECT * FROM friend;

select *
FROM FLEAMARKETMEMBER m,friend f,profile pro
WHERE f.following=m.email
AND f.following=pro.email
AND 1=1
AND (m.email LIKE '%'||''||'%'
OR m.nickname LIKE '%'||''||'%')
--AND myemail='yujin@gmail.com'
AND following='yujin@gmail.com';

select pro.profileimg,m.nickname,m.email
FROM FLEAMARKETMEMBER m,friend f,profile pro
WHERE f.following=m.email
AND f.following=pro.email
AND myemail='yujin@gmail.com'
AND (m.email LIKE '%'||''||'%'
OR m.nickname LIKE '%'||''||'%');

DELETE FROM friend
WHERE myemail='dbwls8382@naver.com'
AND FOLLOWING='222@naver.com';

select*
FROM FLEAMARKETMEMBER m,profile pro
WHERE f.myemail= m.email
AND m.email='dbwls8382@naver.com';

SELECT * FROM capplicaion;
SELECT * FROM BoardImg;
SELECT * FROM profile;
SELECT * FROM FLEAMARKETMEMBER m;

SELECT * 
FROM capplicaion c, BoardImg bi, fleamarketmember m, profile p
WHERE c.email=m.email -- 회원/게시글
AND m.email=p.email -- 회원/프로필
AND c.communitynumber=bi.communitynumber -- 게시글커뮤니티번호/게시글사진카뮤니티번호
and m.email='yujin@gmail.com';

SELECT * 
FROM fleamarketmember m, profile p
WHERE m.email=p.email -- 회원/프로필
and m.email='yujin@gmail.com';

UPDATE fleamarketmember SET businessnumber='1234567891'
WHERE email='janexagnes@gmail.com';



