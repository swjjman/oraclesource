-- scott 권한 부여
GRANT CONNECT, resource TO scott;

GRANT CREATE VIEW TO scott;



-- 데이터를 저장할 수 있는 저장공간 할당
ALTER USER SCOTT DEFAULT TABLESPACE USERS;
ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;
ALTER USER SCOTT QUOTA 10M ON USERS;

alter session set "_oracle_script"=true;



SYSTEM.SQL 

-- DBA 권한을 가진 사용자만 사용자를 생성하고 권한 부여 
-- SYSTEM , sys as sysdba


CREATE USER 아이디 IDENTIFIED BY 비밀번호;


-- TEST 유저 생성


CREATE USER c##test IDENTIFIED BY test;

공통 사용자 또는 롤 이름이 부적합합니다.
-- 오라클 21c XE 요구사항 c##
CREATE USER test IDENTIFIED BY test;



-- 비밀번호 변경
ALTER USER 아이디 IDENTIFIED BY 변경 비밀번호;


----------------------------------------------------------


CREATE SESSION에 권한을 가지고 있지 않음;  로그온 거절 

-- 권한부여 : 
--SESSION, CREATE(USER, TABLE, SEQUENCE, VIEW ...... )

-- 권한그룹(롤) : 
--CONNECT(SESSION, CREATE TABLE, CREATE VIEW.....)
--RESOURCE(SEQUENCE, 프로시저, 테이블............)


1) GRANT 권한이름 . . . TO 사용자 아이디 
 
2) GRANT 권한그룹 . . . TO 사용자 아이디 


GRANT CONNECT, RESOURCE TO c##test;


--인서트까지 가능 (사용공간, 크기 )

CREATE USER c##test2 IDENTIFIED BY test
DEFAULT TABLESPACE users
temporary TABLESPACE temp
QUOTA 10M ON USERS;

GRANT CONNECT, RESOURCE TO c##test2;



--권한 삭제 
-- REVOKE 

1) REVOKE 취소할 권한이름 . . . .

2) REVOKE 취소할 권한이름 FROM ID 





