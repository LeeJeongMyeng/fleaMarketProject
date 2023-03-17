--FLEAMARKETMEMBER 회원
--PROFILE 회원이미지
--FLEAMARKETQNA 문의/공지글
--QNAFILE 문의공지 파일

--FLEAMARKET 플마홍보글
--FFILE 홍보글파일
--FAPPLICATION 신청글
--APPLICATIONFILE 신청글파일

--capplicaion 커뮤니티게시글
--BoardImg 커뮤니티게시글파일
SELECT * FROM PROFILE;




DELETE qnafile;

ALTER TABLE QNAFILE 
ADD FOREIGN KEY (qnano)
REFERENCES FLEAMARKETqna (qnano)
ON DELETE CASCADE;

SELECT * FROM FLEAMARKETQNA f ;

-- 1.
 
SELECT profileimg FROM profile WHERE email='28888wjdaud@naver.com';
SELECT * FROM QNAFILE
WHERE qnano in (SELECT qnano FROM FLEAMARKETQNA WHERE email = '28888wjdaud@naver.com');


SELECT qna.* FROM
(SELECT level,f.* FROM fleamarketqna f
WHERE 1=1
AND f.METHOD != 'n'
and email ='28888wjdaud@naver.com'
START with refno=0
CONNECT BY PRIOR qnano=refno
ORDER siblings BY qnano DESC) qna;

-- refno가 qnano인것



