-- scott

-- select(데이터 조회)
-- e : 별칭 (임의지정 가능 / 없어도 됨)
-- * : 전체 필드(컬럼)를 의미
SELECT * FROM EMP e ;

-- 특정 컬럼에 해당하는 내용 보기 

SELECT
	EMPNO,
	ENAME,
	JOB
FROM
	EMP ;
--	컨트롤 + 시프트 + f  (DBeaver 국룰)

-- emp 테이블에서 부서번호만(중복 데이터 제거 후) 조회

SELECT DISTINCT 
	deptno
FROM
	EMP e;


-- emp 테이블
-- empno(사원번호), ename(사원명), job(직책), mgr(매니저번호)
hiredate(고용일), sal(급여), comm(보너스),deptno(부서번호)

-- emp 테이블에서 사원번호, 매니저번호, 부서번호만 조회
SELECT EMPNO, MGR, DEPTNO FROM emp;


-- 필드명 별칭 부여
-- "" 필수일 때, 별칭에 공백이 있는 경우
-- as 생략 가능
SELECT
	EMPNO AS 사원번호,
	MGR 매니저번호,
	DEPTNO "부서 번호"
FROM
	emp;

-- 연봉 계산
-- 월급 * 12 + 수당

SELECT empno 사원번호, sal 월급, sal * 12 + COMM AS "연봉"
FROM EMP e;

-- 정렬 
-- order by 정렬기준 컬럼명 DESC(내림차순) or ASC (오름차순 - 디폴트)
SELECT
	*
FROM
	EMP e 
ORDER BY SAL DESC ;

-- emp 테이블에서 empno, ename, sal 조회 (단, empno 내림차순)

SELECT
	empno,
	ename,
	sal
FROM
	EMP e
ORDER BY
	EMPNO DESC ;

-- ASC - 디폴트
SELECT
	empno,
	ename,
	sal
FROM
	EMP e
ORDER BY
	SAL ;

-- 전체 조회, 부서번호 오름차순, sal 내림차순

SELECT
	*
FROM
	EMP e
ORDER BY
	DEPTNO ASC ,
	SAL DESC;

-- 조건 부여 
-- 부서번호가 30번인 사원 조회

SELECT
	*
FROM
	EMP e
WHERE
	DEPTNO = 30;

-- sal > 1000 이상인 사원 조회

SELECT
	*
FROM
	EMP e
WHERE
	SAL >= 1000
ORDER BY
	SAL DESC;

-- empno가 7782인 사원 조회

SELECT * FROM EMP e 
WHERE e.EMPNO = 7782;

-- = (같다) 산술연산자 (>, <, >=, =<)

-- deptno가 30이고, job이 salesman인 사원 조회

SELECT * FROM  emp
WHERE DEPTNO = 30 AND JOB = 'SALESMAN';

-- 사원번호가 7499 부서번호가 30인 사원 조회

SELECT * FROM EMP e 
WHERE EMPNO = 7499 AND DEPTNO = 30;

-- 이거나(혹은) = OR
-- 부서번호가 30 이거나 직무가 세일즈맨인것

SELECT * FROM EMP e 
WHERE DEPTNO = 30 OR JOB = 'SALESMAN';


-- 연봉이 36000인 사원 조회
-- 연봉 SAL*12*COMM

SELECT * FROM EMP e 
WHERE SAL*12*COMM = 36000;


-- 문자도 크다 작다 적용이 됨.

SELECT * FROM EMP e 
WHERE ENAME >= 'F';

-- SAL이 3000이아닌 사원 조회

SELECT * FROM EMP e 
WHERE SAL !=3000; (가장 많이 씀.)

SELECT * FROM EMP e 
WHERE SAL <>3000;

SELECT * FROM EMP e 
WHERE SAL ^=3000;


-- job이 MANAGER OR SALEMAN OR CLERK

SELECT * FROM EMP e 
WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';

-- IN 키워드

SELECT * FROM EMP e 
WHERE JOB IN ('MANAGER','SALESMAN','CLERK');

-- 아닌것 

SELECT * FROM EMP e 
WHERE JOB NOT IN ('MANAGER','SALESMAN','CLERK');



-- HIREDATE 가 1981-10-31 이후에 고용된 사원 조회
날짜 데이터도 ''로 처리

SELECT * FROM EMP e 
WHERE HIREDATE > '1981-10-31'
ORDER BY HIREDATE;

-- BETWEEN A AND B
-- SAL 2000이상 3000이하인 사원 조회

SELECT * FROM EMP e
WHERE SAL BETWEEN 2000 AND 3000;

SELECT * FROM EMP e 
WHERE SAL IN (2975,2850)
ORDER BY SAL DESC;

SELECT * FROM EMP e 
WHERE SAL >=2000 AND SAL <=3000;

SELECT * FROM EMP e 
WHERE SAL BETWEEN 2000 AND 3000;

SELECT * FROM EMP e 
WHERE SAL NOT BETWEEN 2000 AND 3000;


-- LIKE 연산자와 와일드 카드 ( _ , % ) 

-- _ 문자 하나를 의미   
-- % 문자 개수는 무한대 


-- 사원이름이 S로 시작하는 사원 조회 

SELECT * FROM EMP e 
WHERE ENAME LIKE 'S%';

-- 사원이름의 두번째 글자가 L인 사원 조회

SELECT * FROM EMP e 
WHERE ENAME LIKE '_L%';

-- 사원 이름에 AM 문자가 포함된 사원 조회

SELECT * FROM EMP e 
WHERE ENAME LIKE '%AM%';

-- 사원 이름에 AM 문자가 포함되지 않은 사원 조회

SELECT * FROM EMP e 
WHERE ENAME NOT LIKE '%AM%';		

-- NULL : 값이 없는 상태 (0은 아님)
-- NULL 비교 : IS 

-- '' : 빈값 
-- ' ' : 스페이스 바도 문자임. 


-- 커미션이 NULL 인 사원 

SELECT * FROM EMP e 
WHERE COMM IS NULL ;

-- MGR이 NULL인 사원 조회

SELECT * FROM EMP e 
WHERE MGR IS NULL ;

-- MGR이 NULL인 아닌 사원 조회

SELECT * FROM EMP e 
WHERE MGR IS NOT NULL ;

-- COMMISSION_PCT가 NULL이 아닌 사원들 중에서 COMMISSION = SALARY * COMMISSION_PCT를 구하여
EMPLOYEE_ID, FIRST_NAME, JOB_ID, COMMISSON을 조회

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, COMMISSION_PCT *SALARY AS COMMISSION
FROM EMPLOYEES e 
WHERE COMMISSION_PCT IS NOT NULL;

-- NULL * 숫자 = NULL 

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID,SALARY,COMMISSION_PCT , COMMISSION_PCT *SALARY AS COMMISSION
FROM EMPLOYEES e 


-- FIRST_NAME 이 'curtis' 인 사원의 first_name, last_name, email, phone_number, job_id를 조회 
(단 job-id 결과는 소문자로 출력)

SELECT first_name, last_name, email, phone_number, LOWER(JOB_ID)
FROM EMPLOYEES e
WHERE FIRST_NAME = 'Steven';




-- 부서번호가 60,70,80,90인 사원들의 employee_id, first_name, hire_date, job id 조회
(단, job_id가 IT_PROG인 사원의 경우 프로그래머로 변경하여 출력한다.)

SELECT employee_id, first_name, hire_date, REPLACE (job_id, 'IT PROG', '프로그래머') 
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID IN (60,70,80,90)




SELECT employee_id, first_name, hire_date, REPLACE(JOB_ID,'IT PROG','프로그래머') 
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID IN (60,70,80,90)



-- JOB_ID 가 AD_PRES, PU_CLERK 인 사원들의 EMPLOYEE_ID, FIRST_NAME, JOB_ID 조회
(단, 사원명은 FIRST_NAME과 LAST_NAME 공백을 포함하여 연결)

SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME AS NAME , JOB_ID
FROM EMPLOYEES e 
WHERE JOB_ID IN ('AD_PRES', 'PU_CLERK');



SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME AS NAME, JOB_ID
FROM EMPLOYEES e 
WHERE JOB_ID IN ( 'AD_PRES', 'PU_CLERK');




-- 집합연산자 

합집합 (UNION, UNION ALL) - 출력 열 개수, 타입 동일해야함. 
교집합 (INTERSECT)
차집합 (MINUS) 

-- 부서번호가 10번 혹은 20번인 사원 조회 

SELECT EMPNO, ENAME ,SAL, DEPTNO  FROM
EMP e 
WHERE DEPTNO = 10
UNION 
SELECT EMPNO, ENAME ,SAL, DEPTNO  FROM
EMP e 
WHERE DEPTNO = 20




SELECT EMPNO, ENAME ,SAL, DEPTNO  FROM
EMP e 
WHERE DEPTNO = 10
UNION 
SELECT SAL , JOB ,DEPTNO , SAL  FROM
EMP e 
WHERE DEPTNO = 20


SELECT EMPNO, ENAME ,SAL, DEPTNO  FROM
EMP e 
WHERE DEPTNO = 10
UNION ALL 
SELECT EMPNO, ENAME ,SAL, DEPTNO  FROM
EMP e 
WHERE DEPTNO = 10;




-- MINUS

SELECT EMPNO, ENAME ,SAL, DEPTNO  FROM
EMP e 
MINUS 
SELECT EMPNO, ENAME ,SAL, DEPTNO  FROM
EMP e 
WHERE DEPTNO = 10;

-- INTERSECT 

SELECT EMPNO, ENAME ,SAL, DEPTNO  FROM
EMP e 
INTERSECT 
SELECT EMPNO, ENAME ,SAL, DEPTNO  FROM
EMP e 
WHERE DEPTNO = 10;




-- 오라클 함수 (내장 함수)  
-- 함수는 사용하는 DBMS에 따라 다르게 제공 

1. 문자 함수 
-- 대소문자 변경 
UPPER - 괄호 안 문자를 모두 대문자로 변환하여 반환
LOWER - 괄호 안 문자를 모두 소문자로 변환하여 반환
INTICAP - 괄호 안 첫번째 문자를 대문자로 변환하여 반환 

SELECT * FROM EMP e 
WHERE ename = upper('clark');

SELECT * FROM EMP e 
WHERE lower(ename) = 'clark';


SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP e;


-- 문자열 길이 
LENGTH - 괄호 안 문자의 길이를 숫자로 반환 .
LENGTHB - 괄호 안 문자의 바이트수 반환 (한글은 1글자당 3바이트 = XE버전)


SELECT ENAME, LENGTH (ENAME), LENGTHB(ENAME) 
FROM EMP e ;

-- 함수 결과를 보고 싶은데 테이블이 없을 경우 DUAL 테이블 사용. 
SELECT LENGTH ('한글'),LENGTHB ('한글')
FROM DUAL;



-- 직책 이름이 6글자 이상인 사원 조회 

SELECT * FROM EMP e 
WHERE LENGTH (JOB) >= 6;




-- 문자열 일부 추출 
SUBSTR (문자열 데이터, 시작위치, 추출길이)
음수라면 오른쪽 끝부터 시작. 

SELECT JOB, SUBSTR(JOB,1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5)  
FROM EMP e;


SELECT JOB, SUBSTR(JOB,-1,2), SUBSTR(JOB,-3,2), SUBSTR(JOB,5)  
FROM EMP e;



INSTR (문자열 데이터, 위치를 찾으려는 문자, 시작위치)
문자열 데이터 안에서 특정 문자 위치 찾기

SELECT INSTR('HELLO, ORACLE!','L') AS INSTR_1
FROM DUAL ;

SELECT INSTR('HELLO, ORACLE!','L') AS INSTR_1
      ,INSTR('HELLO, ORACLE!','L',5) AS INSTR_2
      ,INSTR('HELLO, ORACLE!','L',2,2) AS INSTR_3
FROM DUAL ;



-- 사원 이름에 S가 들어있는 사원 조회

SELECT * FROM EMP e 
WHERE INSTR(ENAME, 'S') > 0 ;


REPLACE (문자열 데이터, 찾는 문자, 변경할 문자) 
특정 문자를 다른 문자로 변경 

SELECT REPLACE ('HELLO','L','A')
FROM DUAL ;


SELECT '010-1234-1234' AS REPLACE-BEFORE,
REPLACE ('010-1234-1234') AS REPLACE-1,
REPLACE ('010-1234-1234','-',' ') AS REPLACE-2,
REPLACE ('010-1234-1234',' ') AS REPLACE-3
FROM DUAL;  



CONCAT (문자열 데이터1, 문자열 데이터2 )
두 문자열 데이터를 합하는 함수 


SELECT 
CONCAT(EMPNO,ENAME) 
FROM EMP e 
WHERE ENAME = 'SMITH';

--3개 합치고 싶음 
-- 7369 - SMITH


SELECT 
CONCAT(EMPNO,ENAME), CONCAT(EMPNO,CONCAT(' : ', ENAME)) 
FROM EMP e 
WHERE ENAME = 'SMITH';

-- 더 간단하게 

SELECT 
EMPNO  || ' : '|| ENAME 
FROM EMP e 
WHERE ENAME = 'SMITH';


TRIM 
공백제거 

-- 'SMITH' = 'SMITH '


SELECT '['|| ' __ORACLE__ ' || ']' AS TRIM_BEFORE
      ,'['|| TRIM(' __ORACLE__ ') || ']' AS TRIM
      ,'['|| LTRIM(' __ORACLE__ ') || ']' AS LTRIM
      ,'['|| RTRIM(' __ORACLE__ ') || ']' AS RTRIM
            FROM DUAL  ;

           
         SELECT  '['|| ' 임수원 ' ||']' AS 이름 
           FROM DUAL;


SELECT '['|| ' __ORACLE__ ' || ']' AS TRIM_BEFORE
      ,'['|| TRIM(LEADING '_' FROM '__ORACLE__') || ']' AS TRIM_LEADING
      ,'['|| TRIM(TRAILING '_' FROM '__ORACLE__') || ']' AS TRIM_TRAILING
      ,'['|| TRIM(BOTH '_' FROM '__ORACLE__') || ']' AS TRIM_BOTH
      FROM DUAL  ;

     
'[' || '__LWS__' ||']'





숫자 함수 
-- 숫자 데이터에 적용하는 함수 
-- (반올림, 올림, 버림, 나머지 값 구하기)
-- (ROUND,CEIL,FLOOR,TRUNC,MOD)

ROUND (숫자, 반올림 위치)

--        -4-3-2-1 0123
SELECT ROUND(1234.5678) AS ROUND, 
       ROUND(1234.5678,0) AS ROUND1,
       ROUND(1234.5678,1) AS ROUND2,
       ROUND(1234.5678,2) AS ROUND3,
       ROUND(1234.5678,-1) AS ROUND_MINUS1,
       ROUND(1234.5678,-2) AS ROUND_MINUS2
FROM DUAL;


TRUNC (숫자, 버림 위치)

SELECT
	TRUNC(1234.5678) AS TRUNC, 
	TRUNC(1234.5678,0) AS TRUNC 1, 
	TRUNC(1234.5678,1) AS TRUNC 2,
	TRUNC(1234.5678,2) AS TRUNC 3,
	TRUNC(1234.5678,-1) AS TRUNC MINUS1,
	TRUNC(1234.5678, -2) AS TRUNC MINUS2
FROM DUAL ;	


CEIL, FLOOR
-- 지정한 숫자와 가까운 정수 찾기
-- CEIL : 지정한 숫자보다 큰 정수 중 가장 작은 정수 반환
-- FLOOR : 지정한 숫자보다 작은 정수 중 가장 큰 정수 반환 

SELECT CEIL (3.14) , FLOOR (3.14), CEIL (-3.14) , FLOOR (-3.14)
FROM DUAL;
 

MOD 
-- 나머지 값 

SELECT 11/5, MOD(11,5)
FROM DUAL;



날짜 함수 

-- 오늘 날짜 구하기 

SELECT SYSDATE, CURRENT_DATE , CURRENT_TIMESTAMP  
FROM DUAL;

-- 날짜 데이터 + 숫자 = 날짜 데이터보다 숫자만큼 이후의 날짜

SELECT SYSDATE +1, SYSDATE -1 
FROM DUAL;

-- 월 데이터, ADD_MONTHS( ) = 월 데이터보다 숫자만큼 이후의 날짜

SELECT SYSDATE, ADD_MONTHS(SYSDATE,3) 
FROM DUAL;


-- ex) 입사 30주년이 되는 날짜 구하기

SELECT EMPNO, ENAME, HIREDATE,ADD_MONTHS(HIREDATE,360) 
 FROM EMP e 

 MONTHS_BETWEEN(날짜1, 날짜2)
-- 두개의 날짜 데이터를 입력하고 두 날짜간의 개월 수 차이 구하기 
 
 
-- EX) 고용일과 오늘날짜 차이 구하기
 
 SELECT
	EMPNO,
	ENAME,
	HIREDATE ,
	SYSDATE,
	MONTHS_BETWEEN(HIREDATE, SYSDATE),
	MONTHS_BETWEEN(SYSDATE, HIREDATE),
	TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE),15)
    FROM EMP e 
 
 
    NEXT_DAY (날짜, 요일 ) 
--    특정 날짜를 기준으로 돌아오는 요일 날짜 출력
    LAST_DAY (날짜)
--    특정 날짜가 속한 달의 마지막 날짜 출력
    
    SELECT SYSDATE , NEXT_DAY(SYSDATE,'월요일'), LAST_DAY(SYSDATE)  
 FROM DUAL;
 
 자료형 변환 숫자 -> 문자 문자 -> 숫자
 
-- NUMBER + 문자 숫자 : 자동형 변환으로 계산처리 
 SELECT empno, ENAME, EMPNO + '500' 
 FROM EMP e 
 WHERE ename = 'FORD';


-- 수치 부적합 예재 

 SELECT empno, ENAME, EMPNO + 'ABCD' 
 FROM EMP e 
 WHERE ename = 'FORD';

명시적 형변환 

TO_CHAR(날짜(숫자) 데이터, '출력되기를 원하는 문자 형태 ' )
-- 숫자,날짜 데이터를 문자로 변환
-- Y = 연   M = 월   D = 일 HH = 시 HH24 = 24시간으로 MI = 분  SS  = 초 / AM & PM = 오전 & 오후 

SELECT TO_CHAR(SYSDATE, 'YYYYDDMM')  ,SYSDATE, TO_CHAR(SYSDATE, 'YYYY.DD.MM.HH.MI.SS AM')
FROM DUAL;


TO_NUMBER()
-- 문자 데이터를 숫자로 변환


SELECT 1300 - '1500', '1300' + 1500
FROM DUAL;

-- 9는 숫자의 한자리를 의미 
-- 0은 빈자리를 0으로 채움 / 0은 웬만하면 안씀 

SELECT TO_NUMBER('1,300', '999,999') + TO_NUMBER('1,500','999,999')
FROM DUAL;


-- 0은 빈자리를 0으로 채움 / 0은 웬만하면 안씀 

SELECT
	TO_CHAR(SAL, '999,999,000') AS SALL,
TO_CHAR(SAL, '000,999,999') AS SALL2
FROM
	EMP e ;


TO_DATE(문자, '인식될 날짜 형태')
-- 문자 데이터를 날짜로 변환


SELECT TO_DATE('2024-01-24') AS TODATE1
,TO_DATE('20240124') AS TODATE2
FROM DUAL;


SELECT TO_DATE('2024-01-24') - TO_DATE(' 2023-12-31')
FROM  DUAL;



NULL 처리 함수 
-- NULL을 다른 값으로 변경하는 함수 .

NVL ( NULL 인지 검사할 데이터 + 대체할 데이터 )

SELECT EMPNO, ENAME, SAL, COMM, SAL + NVL( COMM,0 )
FROM EMP e;


NVL2 (NULL 인지 검사할 데이터 + NULL이 아닌 경우 반환 데이터,NULL인 경우 반환 데이터)

SELECT EMPNO, ENAME, SAL, COMM , NVL2( COMM, 'O', 'X' ) 
FROM EMP e;


-- COMM 이 NULL 이면 연봉은 = SAL *12, NULL이 아니면 연봉은 SAL * 12 + COMM


SELECT
	EMPNO,
	ENAME,
	SAL,
	COMM ,
	NVL2( COMM, SAL * 12 + COMM, 12 * SAL ) AS 연봉
FROM
	EMP e 


	
DECODE (검사대상, 조건1, 조건 1이 참일 경우 반환한 결과, ~~ 조건n 일치하지 않을 때 반환 결과 )

 
-- JOB이 MANAGER 라면 SAL * 1.1 

-- JOB이 SALESMAN 이라면 SAL * 1.05 

-- JOB이 ANALYST 라면 SAL 

--  나머지 직무는 SAL 1.03 


	SELECT
	EMPNO,
	ENAME,
	JOB,
	SAL,
	DECODE(JOB, 'MANAGER', SAL * 1.1,'SALESMAN', SAL * 1.05,'ANALYST', SAL, SAL * 1.03) AS UPSELL  
FROM
	EMP e;
	
	
CASE 문 


	SELECT 
	EMPNO,
	ENAME,
	JOB,
	SAL,
	CASE
		job WHEN 'MANAGER' THEN SAL * 1.1,
		WHEN 'SLAESMAN' THEN SAL * 1.05,
		WHEN 'ANALYST' THEN SAL,
		ELSE SAL * 1.03
	END AS UPSAL2,
	DECODE(JOB, 'MANAGER', SAL * 1.1, 'SALESMAN', SAL * 1.05, 'ANALYST', SAL, SAL * 1.03) AS UPSAL
FROM
	EMP e;

	
	
-- COMM이 NULL 일 때 해당사항 없음 
--          0 일 때 수당 없음.
--          0 보다 크다면 수당 : COMM 



SELECT 
	EMPNO,
	ENAME,
	COMM,
	CASE 
		WHEN COMM IS NULL THEN '해당사항 없음'
		WHEN COMM = 0 THEN '수당 없음'
		WHEN COMM > 0 THEN '수당 : ' || COMM
	END AS COMM_TEXT
FROM
	EMP e ;





SELECT
	EMPNO ,
	ENAME ,
	SAL,
	TRUNC( SAL / 21.5,2) AS DAY_PAY,
	ROUND(SAL / 21.5 / 8,1) AS TIME_PAY
FROM
	EMP e;

	
	
	
	SELECT 
	EMPNO,
	ENAME,
	TO_CHAR(HIREDATE, 'YY/DD/MM'), 
	TO_CHAR(ADD_MONTHS(HIREDATE, 3), 'YY/DD/MM') 
	,
	CASE 
		WHEN COMM IS NULL THEN 'N/A'
		WHEN COMM > 0 THEN ' ' || COMM
	END
FROM
	EMP e ; 
	
	
SELECT 
	EMPNO,
	ENAME,
	HIREDATE,
	NEXT_DAY(ADD_MONTHS(HIREDATE,3),'월요일') AS R_JOB,
	NVL(TO_CHAR(COMM),'N/A' ) AS COMM
FROM EMP e ;






