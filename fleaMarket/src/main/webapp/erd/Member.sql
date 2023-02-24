
CREATE TABLE fleamarketmember(
	email varchar2(50) NOT NULL,
	password varchar2(50),
	nickname varchar2(100),
	personalNumber varchar2(100),
	phoneNumber varchar2(100),
	address varchar2(300),
	authority char,
	businessNumber varchar2(20),
	kakaoemail varchar2(100),
	naveremail varchar2(100),
	-- 셀러들이 주로 판매하는 상품주제
	category varchar2(100),
	name varchar2(100),
	PRIMARY KEY (email)
);

SELECT * FROM FLEAMARKETMEMBER;
