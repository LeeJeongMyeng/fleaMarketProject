--where email 

SELECT * FROM FLEAMARKET;
SELECT * FROM FFILE;

SELECT * FROM FAPPLICATION;
SELECT * FROM APPLICATIONFILE;

SELECT ff.filename fleamarket, a.FILENAME application
FROM FLEAMARKET f , ffile ff, APPLICATIONFILE a, FAPPLICATION f2
WHERE f.POSTINGNUMBER = FF.POSTINGNUMBER
AND a.APPLICATIONNO = f2.APPLICATIONNO 
AN
AND email LIKE '%'||''||'%';