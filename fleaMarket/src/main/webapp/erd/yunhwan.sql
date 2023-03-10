CREATE TABLE CommunityHeart
(
    communityNumber NUMBER NOT NULL,
    email varchar2(50) NOT NULL
);
--좋아요 fk 설정 
ALTER TABLE CommunityHeart
    ADD FOREIGN KEY (communityNumber)
	REFERENCES CAPPLICAION(communityNumber)
	ADD FOREIGN KEY (email)
	REFERENCES fleaMarketMember(email)
;
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
--게시물 상세 조회 
SELECT c.COMMUNITYNUMBER,c.TITLE,c.CONTENT,c.REGISTDATE,c.UPDATEDATE,f.NICKNAME,p.PROFILEIMG,c.EMAIL FROM CAPPLICAION c ,FLEAMARKETMEMBER f,BOARDIMG b
,PROFILE p
WHERE f.EMAIL = c.EMAIL AND c.COMMUNITYNUMBER = b.COMMUNITYNUMBER AND f.EMAIL = p.EMAIL
AND c.COMMUNITYNUMBER = 'comBoard1';

-- 게시물 사진 조회 
SELECT b.IMGNAME FROM CAPPLICAION c,BOARDIMG b 
WHERE c.COMMUNITYNUMBER = b.COMMUNITYNUMBER 
AND c.COMMUNITYNUMBER = 'comBoard26';

-- 게시물 글쓴이 팔로우 
SELECT count(*) FROM FRIEND f, CAPPLICAION c
WHERE f.FOLLOWING  = c.EMAIL 
AND c.COMMUNITYNUMBER = 'comBoard1'
AND f.MYEMAIL = 'pucoca@naver.com';

SELECT*FROM FRIEND;
-- 게시물 팔로우 처리 
INSERT INTO FRIEND VALUES(,);
-- 게시물 팔로우 삭제 처리 
DELETE FROM FRIEND WHERE MYEMAIL = 'pucoca@naver.com';

--좋아요 count 확인 
SELECT count(*) FROM communityHeart
WHERE communityNumber = 'comboard1';

--좋아요 유무 확인 
SELECT count(*) FROM CAPPLICAION c , COMMUNITYHEART h 
WHERE c.COMMUNITYNUMBER = h.COMMUNITYNUMBER
AND communityNumber = 'comboard1'
AND email = 'pucoca@naver.com';
-- 댓글 테이블 
CREATE TABLE REPLY (
  replyNo NUMBER, -- 댓글번호 
  communityNumber NUMBER, -- 게시물 번호 fk 
  email varchar2(50), -- 이메일 번호 fk    
  repcontent varchar2(1000), -- 작성 내용
  repclass NUMBER, -- 댓글 부모 0 자식 1 
  groupOrderid NUMBER, -- 순서 NUMBER
  groupid NUMBER, -- 그룹 나누기.(모 댓글과 대댓글은 같은값)
  repDate DATE,
  PRIMARY KEY(replyNo)
);
ALTER TABLE REPLY
    ADD FOREIGN KEY (communityNumber)
	REFERENCES CAPPLICAION(communityNumber)
	ADD FOREIGN KEY (email)
	REFERENCES fleaMarketMember(email)
;

