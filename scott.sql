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
		WHEN COMM IS NULL THEN '해당사항 없음',
		WHEN COMM = 0 THEN '수당 없음',
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






SELECT EMPNO , ENAME, MGR, 
CASE 
		WHEN MGR IS NULL THEN '0000'
		WHEN MGR = '75__' THEN '5555'
		WHEN MGR =  '76__' THEN '6666'
	END AS COMM_TEXT
FROM EMP e 


실습 3 풀이 
MGR은 숫자함수니까 SUBSTR 사용 위해 TO_CHAR로 변환 후 DECODE 함수 


SELECT
FROM EMP e 


SELECT
	EMPNO ,
	ENAME ,
	MGR,
	DECODE(SUBSTR(TO_CHAR(MGR),1,2), NULL, '0000', '75','5555','76','6666','77','7777','78','8888'
	,SUBSTR(TO_CHAR(MGR),1)) AS CHG_MGR 
FROM
	EMP e 




SELECT
	EMPNO ,
	ENAME ,
	MGR,
CASE 
	WHEN MGR IS NULL THEN '0000'
	WHEN SUBSTR(TO_CHAR(MGR),1,2) = '75' THEN '5555'
	WHEN SUBSTR(TO_CHAR(MGR),1,2) = '76' THEN '6666'
	WHEN SUBSTR(TO_CHAR(MGR),1,2) = '77' THEN '7777'
	WHEN SUBSTR(TO_CHAR(MGR),1,2) = '78' THEN '8888'
	ELSE TO_CHAR(MGR)
END AS CHR_MGR
	FROM
	EMP e; 


NULL을 0으로 변환 후 CASE문 간단하게 

SELECT
	EMPNO ,
	ENAME ,
	MGR,
CASE SUBSTR(TO_CHAR(NVL(MGR,0)),1,2)
	WHEN '0' THEN '0000'
	WHEN '75' THEN '5555'
	WHEN '76' THEN '6666'
	WHEN '77' THEN '7777'
	WHEN '78' THEN '8888'
	ELSE TO_CHAR(MGR)
END AS CHR_MGR
	FROM
	EMP e; 


다중행 함수 

-- sum() , avg() , count() , max() , min()

SUM

-- 동일한 급여 제외 선택해서 합계 DISTINCT

SELECT 
SUM(DISTINCT SAL) 
FROM EMP e 

--단일 그룹의 그룹 함수가 아닙니다 9 (여러 행이 나올 수 있는 컬럼을 추가 한 경우 )
SELECT SUM(SAL), AVG(SAL), COUNT(SAL), MAX(SAL), MIN(SAL), ENAME ★ 
FROM EMP e 


COUNT

SELECT 
COUNT(*) FROM EMP e 


-- 부서번호가 30인 사원 수 조회  WHERE 절 추가 

SELECT COUNT(*)  
FROM EMP e 
WHERE DEPTNO = 30

-- 부서번호가 30인 사원 중 최대 급여

SELECT MAX(SAL)  
FROM EMP e 
WHERE DEPTNO = 30

-- 부서번호가 20인 사원의 입사일 중에서 제일 최근 입사일 조회 

SELECT MAX(HIREDATE)  
FROM EMP e 
WHERE DEPTNO = 20

-- 부서번호가 20인 사원의 입사일 중에서 제일 오래된 입사일 조회 


SELECT MIN(HIREDATE)  
FROM EMP e 
WHERE DEPTNO = 20


-- 부서번호가 30인 사원 중 SAL 중복 값 제거 후 평균 구하기 

SELECT AVG(DISTINCT(SAL)) FROM EMP e
WHERE DEPTNO = 30;


-- 부서별 급여 합계 구하기 

SELECT SUM(SAL) 
FROM EMP e
WHERE DEPTNO = 10 
UNION 
SELECT SUM(SAL) 
FROM EMP e
WHERE DEPTNO = 20 
UNION
SELECT SUM(SAL) 
FROM EMP e
WHERE DEPTNO = 30


GROUP BY : 결과 값을 원하는 열로 묶기

GROUP BY 표현식이 아닙니다. 
-- GROUP BY 옆에 오는 컬럼만 SELECT 절에 사용 가능. 

SELECT 보고싶은 컬럼
⑴
FROM 테이블명 
⑵
WHERE 조건 나열 
⑶
GROUP BY 그룹화 할 열이름 . . . (HAVING - GROUP BY 절에 조건을 사용할 때)
⑷
ORDER BY 정렬 조건 
⑸

-- 순서 ⑵ -> ⑴ -> GROUP BY -> HAVING -> ⑴ -> ⑸



SELECT DEPTNO, SUM(SAL) 
FROM EMP e 
GROUP BY DEPTNO;


-- 부서별 급여 평균 


SELECT 
DEPTNO , AVG(ROUND() SAL) 
FROM EMP e 
GROUP BY DEPTNO
ORDER BY DEPTNO;
 

-- 부서번호, 직무별 급여 평균 

SELECT
DEPTNO , JOB ,AVG(SAL) 
FROM
	EMP e 
	GROUP BY DEPTNO ,JOB 
ORDER BY DEPTNO ;



-- 부서별 직책의 평균 급여가 500 이상인 사원들의 부서번호, 직책, 부서별 직책 평균 급여 


SELECT
DEPTNO , JOB ,AVG(SAL) 
FROM
	EMP e 
	GROUP BY DEPTNO ,JOB HAVING AVG(SAL) >= 500
ORDER BY DEPTNO, JOB;





SELECT
DEPTNO , JOB ,AVG(SAL) 
FROM
	EMP e 
WHERE SAL <= 3000
	GROUP BY DEPTNO ,JOB HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;




-- 같은 직무에 종사하는 사원이 3명 이상인 직무와 인원수 출력

SELECT
 JOB, COUNT(JOB) 
FROM EMP e
 GROUP BY JOB HAVING COUNT(JOB) >= 3
 
 
-- 사원들의 입사연도를 기준으로 부서별 몇명이 입사했는지 조회 

 
 SELECT
 TO_CHAR(SYSDATE , YYYY.MM.D),HIREDATE, COUNT(DEPTNO)  
FROM
GROUP BY HIREDATE
	EMP e 
 


SELECT TO_CHAR(HIREDATE ,'YYYY') AS 연도, DEPTNO AS 부서번호 , COUNT(*)  AS 인원수
FROM EMP e
GROUP BY TO_CHAR(HIREDATE ,'YYYY') , DEPTNO






JOIN - 여러 테이블을 하나의 테이블 처럼 사용


내부조인 (일치하는 값이 있는 경우)


SELECT * FROM EMP e ,DEPT d 
WHERE E.DEPTNO = D.DEPTNO ;



SELECT
	D.DEPTNO ,E.ENAME ,E.SAL,D.DNAME ,D.LOC 
FROM
	EMP e ,
	DEPT d
WHERE
	E.DEPTNO = D.DEPTNO ;


-- 조인 조건이 없을 때 나올 수 있는 모든 조합이 반환 (WHERE 없을 때 )

SELECT
	D.DEPTNO ,E.ENAME ,E.SAL,D.DNAME ,D.LOC 
FROM
	EMP e ,
	DEPT d


	

SELECT
	D.DEPTNO ,E.ENAME ,E.SAL,D.DNAME ,D.LOC 
FROM
	EMP e ,
	DEPT d
WHERE
	E.DEPTNO = D.DEPTNO  AND e.SAL >= 3000;



-- 표준 구문 ( A  (INNER) JOIN B ON A = B)

SELECT
	D.DEPTNO ,E.ENAME ,E.SAL,D.DNAME ,D.LOC 
FROM
	EMP e JOIN DEPT d ON E.DEPTNO = D.DEPTNO 
WHERE
	e.SAL >= 3000;


SELECT
	D.DEPTNO ,E.ENAME ,E.SAL,D.DNAME ,D.LOC 
FROM
	EMP e INNER JOIN DEPT d ON E.DEPTNO = D.DEPTNO 
WHERE
	e.SAL >= 3000;




EMP, SALGRADE 조인

SELECT S.GRADE ,E.ENAME ,E.SAL  FROM EMP e ,SALGRADE s 
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL 




EMP , EMP 조인 (SELF 조인 )



SELECT
	E.EMPNO, E.ENAME, E.MGR ,E2.ENAME AS MGR_NAME
FROM
	EMP e ,
	EMP e2
WHERE
	E.MGR = E2.EMPNO ;



외부조인 
-- 일치하지 않는 데이터를 화면에 반환시킬 수 있음. 


-- 왼쪽 외부조인

SELECT
	E.EMPNO, E.ENAME, E.MGR ,E2.ENAME AS MGR_NAME
FROM
	EMP e LEFT OUTER JOIN 
	EMP e2
ON
	E.MGR = E2.EMPNO ;


-- 오른쪽 외부조인

SELECT
	E.EMPNO, E.ENAME, E.MGR ,E2.ENAME AS MGR_NAME
FROM
	EMP e RIGHT OUTER JOIN 
	EMP e2
ON
	E.MGR = E2.EMPNO ;



-- 각 부서별 평균 급여, 최대 급여 최소 급여, 사원 수
-- 부서번호, 부서명, 평균 급여, 최대 급여 최소 급여, 사원 수

SELECT E.DEPTNO ,D.DNAME ,ROUND( AVG(SAL),0), MAX(SAL), MIN(SAL),COUNT(SAL)  
FROM EMP e JOIN DEPT d ON E.DEPTNO = D.DEPTNO 
GROUP BY E.DEPTNO,D.DNAME  



-- 3개 테이블 조인하기.

SELECT
	*
FROM
	EMP e 
JOIN EMP e2 ON
	e1.empno = e2.EMPNO
JOIN EMP e3 ON
	e2.EMPNO = E3.EMPNO 
	
	
-- 모든 부서 정보와 사원 정보를 출력 
--	부서번호(DEPTNO), 사원 이름 순으로 정렬, DEPT 테이블이 기준  
-- 부서번호, 부서명, 사원번호, 사원명, 직무명 급여 

	
SELECT D.DEPTNO, D.DNAME, E.EMPNO ,E.ENAME ,E.JOB, E.SAL  
FROM
	DEPT d
LEFT OUTER JOIN EMP e ON
	D.DEPTNO = E.DEPTNO
	ORDER BY D.DEPTNO , E.ENAME ;



SELECT D.DEPTNO, D.DNAME, E.EMPNO ,E.ENAME ,E.JOB, E.SAL  
FROM
	EMP e 
RIGHT OUTER JOIN DEPT d  ON
	D.DEPTNO = E.DEPTNO
	ORDER BY D.DEPTNO , E.ENAME ;

-- 모든 부서 정보와 사원 정보를 출력 
--	부서번호(DEPTNO), 사원 이름 순으로 정렬, DEPT 테이블이 기준  
-- 부서번호, 부서명, 사원번호, 사원명, 직무명 급여, LOSAL, HISAL, GRADE 


SELECT
	D.DEPTNO,
	D.DNAME,
	E.EMPNO ,
	E.ENAME ,
	E.JOB,
	E.SAL,
	S.LOSAL ,
	S.HISAL, 
	S.GRADE 
FROM
	DEPT d
LEFT OUTER JOIN EMP e ON
	D.DEPTNO = E.DEPTNO
LEFT OUTER JOIN SALGRADE s ON E.SAL BETWEEN S.LOSAL AND S.HISAL 
	ORDER BY
	D.DEPTNO ,
	E.ENAME ;




1/26 



서브 쿼리 
-- SQL 문 안에 내부에서 SELECT 문을 사용 
-- 괄호로 묶어서 사용 
-- 메인쿼리의 비교 대상과 같은 자료형과 같은 개수로 지정 


-- JONES 사원의 급여보다 높은 급여를 받는 사원 조회 

1.SELECT SAL
  FROM
  EMP e 
  WHERE ENAME = 'JONES';

SELECT
	*
FROM
	EMP e
WHERE
	SAL > (
	SELECT
		SAL
	FROM
		EMP e
	WHERE
		ENAME = 'JONES');

	
	
--	ALLEN이 받는 COMM 보다 많은 추가수당을 받는 사원 조회 
	
	SELECT COMM 
	FROM EMP e 
WHERE ENAME = 'ALLEN'



SELECT
	*
FROM
	EMP e
WHERE
	COMM < (
	SELECT
		COMM
	FROM
		EMP e
	WHERE
		ENAME = 'ALLEN'
)



-- WARD 사원의 입사일보다 빠른 입사자 조회 



SELECT HIREDATE FROM EMP e 
WHERE ENAME = 'WARD'



SELECT
	*
FROM
	EMP e
WHERE
	HIREDATE < (
	SELECT
		HIREDATE
	FROM
		EMP e
	WHERE
		ENAME = 'WARD'
)




-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원 조회 
-- 사번 , 사원명, 직무, 급여, 부서번호, 부서명 , 지역 


SELECT
	EMPNO ,
	ENAME ,
	JOB,
	SAL,
	D.DNAME ,
	D.LOC
FROM
	EMP e
JOIN DEPT d ON
	E.DEPTNO = D.DEPTNO
WHERE
	E.DEPTNO = 20
	AND E.SAL > (
	SELECT
		AVG(SAL)
	FROM
		EMP e) ;



단일행 서브쿼리

-- 서브쿼리 실행 결과가 단 하나의 행으로 나오는 서브 쿼리 
-- 사용 가능 연산자 :  >  ,  < , >= , <= , <> , ^=, != 

다중행 서브쿼리 
	
-- 서브쿼리 실행 결과가 여러 행으로 나오는 서브 쿼리 
-- 사용 가능 연산자 : IN , = ANY(SOME) ,  ALL , EXISTS

-- IN , = ANY(SOME) : 메인 쿼리의 조건식을 만족하는 서브쿼리가 하나 이상  
-- ALL : 메인 쿼리의 조건식을 서브쿼리의 결과 모두가 만족
-- EXISTS : 서브쿼리의 결과가 존재하면 		

SELECT
	*
FROM
	EMP e
WHERE
	SAL IN  (
	SELECT
		MAX(SAL)
	FROM
		EMP e2
	GROUP BY
		DEPTNO) ;	
	
		
SELECT
	*
FROM
	EMP e
WHERE
	SAL = ANY  (
	SELECT
		MAX(SAL)
	FROM
		EMP e2
	GROUP BY
		DEPTNO) ;	
	
	

	
--	30번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원 조회 
	
SELECT
	*
FROM
	EMP e
WHERE
	SAL < ANY  (
	SELECT
		SAL
	FROM
		EMP e2
	WHERE DEPTNO = 30 ) ;	

--	30번 부서 사원들의 최소 급여보다 적은 급여를 받는 사원 조회 
	
SELECT
	*
FROM
	EMP e
WHERE
	SAL < ALL  (
	SELECT
		SAL
	FROM
		EMP e2
	WHERE DEPTNO = 30 ) ;	

	
	
	
	--	EXIST 상관 X 
	
	
SELECT
	*
FROM
	EMP e
WHERE
	EXISTS  (
	SELECT
		DNAME
	FROM
		DEPT d 
	WHERE DEPTNO = 20 ) ;	

		
실습	

SELECT
	job,
	EMPNO ,
	ENAME ,
	sal,
	DEPTNO ,
	d.DNAME
FROM
	EMP e
JOIN DEPT d ON
	e.DEPTNO = d.DEPTNO
WHERE JOB  
	IN 
	( SELECT JOB  FROM EMP 
	WHERE ENAME = 'ALEEN')
	
	
	
	
	
SELECT
	E.EMPNO ,
	E.ENAME ,
	D.DNAME ,
	E.HIREDATE ,
	D.LOC ,
	E.SAL ,
	S.GRADE
FROM
	EMP e
JOIN DEPT d ON
	E.DEPTNO = D.DEPTNO
JOIN SALGRADE s ON
E.SAL BETWEEN S.LOSAL AND S.HISAL H
WHERE
	 E.SAL > (
	SELECT
		AVG(E.SAL)
	FROM
		EMP e
		) 

	
	
	
다중 열 서브쿼리 

-- 부서별 급여 최대값 


SELECT
	*
FROM
	EMP e
WHERE
	(DEPTNO ,
	SAL) IN 
(
	SELECT
		DEPTNO,
		MAX(SAL)
	FROM
		EMP e
	GROUP BY
		DEPTNO )

	
	
	-- 기존의 직업을 여전히 가지고 있는 사원들의 사번 및 job_id 조회 
	

	서브쿼리 
	
		SELECT
	e.EMPLOYEE_ID ,
	e.JOB_ID
FROM
	EMPLOYEES e
WHERE
	(e.JOB_ID,
	e.EMPLOYEE_ID) IN 
	(
	SELECT
		jh.JOB_ID,
		jh.employee_id
	FROM
		JOB_HISTORY jh )


	조인
	
	SELECT
	DISTINCT e.EMPLOYEE_ID ,
	e.JOB_ID
FROM
	EMPLOYEES e
JOIN JOB_HISTORY jh ON
	e.EMPLOYEE_ID = jh.EMPLOYEE_ID
WHERE
	e.JOB_ID IN 
	(
	SELECT
		jh.JOB_ID
	FROM
		JOB_HISTORY jh )





FROM 절에 서브쿼리 사용 ( 인라인 뷰 )


SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM
	(
	SELECT
		*
	FROM
		EMP
	WHERE
		DEPTNO = 10 ) E10,
	(
	SELECT
		*
	FROM
		DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;

	
SELECT 절에 사용하는 서브쿼리 (스칼라 서브쿼리)	
	

SELECT
	EMPNO ,
	ENAME,
	JOB,
	SAL,
	(
	SELECT
		GRADE
	FROM
		SALGRADE s
	WHERE
		E.SAL BETWEEN S.LOSAL AND S.HISAL) AS SALGRADE
FROM
	EMP e 




DML
-- Data Manipulation Language : 데이터 조작언어 

SELECT (조회) 
INSERT (삽입)
UPDATE (수정)
DELETE (삭제)

	
	

-- 기존 테이블을 복제해서 새로운 테이블 생성 
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT d ;


-- 새로운 부서 생성 

INSERT
INTO 테이블명 (열이름 1 ~~)
VALUES (데이터 ~~)



INSERT
	INTO
	DEPT_TEMP dt (DEPTNO,
	DNAME,
	LOC)
VALUES(60,
'DATABASE',
'BUSAN');

-- 열이름 안넣어도 되긴함 근데 웬만하면 넣음 

INSERT
	INTO
	DEPT_TEMP dt 
VALUES(70,
'DATABASE',
'BUSAN');



 값의 수가 충분하지 않습니다
INSERT
	INTO
	DEPT_TEMP dt 
VALUES(80,
'DATABASE');



이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다. Properties 글자 수 확인.

INSERT
	INTO
	DEPT_TEMP dt (DEPTNO, DNAME)
VALUES(800,
'DATABASE');


 INSERT
	INTO
	DEPT_TEMP dt (DEPTNO, DNAME, LOC)
VALUES(80, 'DATABASE', NULL);





CREATE TABLE EMP_TEMP AS SELECT * FROM EMP e  




INSERT INTO 
EMP_TEMP et (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(8000, 'HONG', 'MANAGER', 7902,'2015-03-15',1000, NULL,50 );



INSERT INTO 
EMP_TEMP et (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(9000, 'SONG', 'MANAGER', 7782,SYSDATE,1200, 800,50 );


-- 테이블의 구조만 복사 ( 데이터 복사 X ) 

CREATE TABLE EMP_TEMP2 AS SELECT * FROM EMP e WHERE 1<>1;  




UPDATE (수정)

UPDATE 테이블명
SET 수정 내용 , , , , ;


UPDATE DEPT_TEMP 
SET LOC = 'BUSAN';



UPDATE 테이블명
SET 수정 내용 , , , , 
WHERE 조건 ;


UPDATE DEPT_TEMP 
SET LOC = 'SEOUL'
WHERE DEPTNO = 50

UPDATE DEPT_TEMP 
SET LOC = 'POHANG', DNAME = 'NETWORK'
WHERE DEPTNO = 40




DELETE (삭제)

DELETE 테이블명
WHERE 조건



DELETE DEPT_TEMP
WHERE DEPTNO = 20;



DELETE 
FROM 테이블명
WHERE 조건



DELETE FROM DEPT_TEMP
WHERE DEPTNO = 30;

DELETE FROM EXAM_EMP ee 
WHERE EMPNO = 7201;


서브쿼리 + DELETE 

-- 급여 등급이 3등급이고, 30번 부서에 사원 삭제 



DELETE
FROM
	EMP_TEMP et
WHERE
	EMPNO IN 
(SELECT EMPNO 
	FROM
		EMP_TEMP et
	JOIN SALGRADE s ON
		ET.SAL BETWEEN S.LOSAL AND S.HISAL
		AND S.GRADE = 3
		AND ET.DEPTNO = 30)


서브쿼리 + UPDATE


UPDATE DEPT_TEMP 
SET (DNAME,LOC) = SELECT DNAME, LOC FROM DEPT d WHERE DEPTNO = 40)
WHERE DEPTNO = 40;




서브쿼리 + INSERT 


INSERT
	INTO
	EMP_TEMP et (EMPNO,
	ENAME,
	JOB,
	MGR,
	HIREDATE,
	SAL,
	COMM,
	DEPTNO)
SELECT
	E1.EMPNO ,
	E1.ENAME,
	E1.JOB,
	E1,
	MGR ,
	E1.HIREDATE,
	E1.SAL ,
	E1.COMM ,
	E1.DEPTNO
FROM
	EMP e E1
JOIN SALGRADE s ON
	E1.SAL BETWEEN S.LOSAL AND S.HISAL
	AND S.GRADE = 1 




CREATE TABLE EXAM_EMP AS SELECT * FROM EMP e  WHERE 1<>1;  

CREATE TABLE EXAM_DEPT AS SELECT * FROM DEPT d  WHERE  1<>1;  


CREATE TABLE EXAM_SALGRADE AS SELECT * FROM  SALGRADE s WHERE 1<>1;  






DELETE FROM EXAM_EMP ee 
WHERE EMPNO = 7101;


INSERT INTO 
EXAM_EMP ee  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7201, 'TEST_USER1', 'MANAGER', 7788,'2016-01-02',4500, 0 ,50 );

INSERT INTO 
EXAM_EMP ee  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7202, 'TEST_USER2', 'CLERK', 7201,'2016-02-21',1800, 0 ,50 );

INSERT INTO 
EXAM_EMP ee  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7203, 'TEST_USER3', 'ANALYST', 7201,'2016-04-11',3400, 0 ,60 );

INSERT INTO 
EXAM_EMP ee  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7204, 'TEST_USER4', 'SALESMAN', 7201,'2016-05-31',2700, 300 ,60 );

INSERT INTO 
EXAM_EMP ee  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7205, 'TEST_USER5', 'CLERK', 7201,'2016-07-20',2600, 0 ,70 );

INSERT INTO 
EXAM_EMP ee  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7206, 'TEST_USER6', 'CLERK', 7201,'2016-09-08',2600, 0 ,70 );

INSERT INTO 
EXAM_EMP ee  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7207, 'TEST_USER7', 'LECTURER', 7201,'2016-10-28',2300, 0 ,80 );

INSERT INTO 
EXAM_EMP ee  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7208, 'TEST_USER8', 'STUDENT', 7201,'2018-03-09',1200, 0 ,80 );

INSERT INTO 
EXAM_EMP ee  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7201, 'TEST_USER1', 'MANAGER', 7788,'2016-01-02',4500, 0 ,50 );

INSERT INTO 
EXAM_EMP ee  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7201, 'TEST_USER1', 'MANAGER', 7788,'2016-01-02',4500, 0 ,50 );


COMMIT;









실습 3 

UPDATE  EXAM_EMP 
SET DEPTNO = 70
WHERE SAL > (SELECT AVG(sal) FROM EXAM_EMP ee WHERE DEPTNO = 50);




실습 4

UPDATE EXAM_EMP SET SAL  = SAL * 1.1 , DEPTNO = 80 WHERE 
HIREDATE > (SELECT MIN(HIREDATE) FROM EXAM_EMP ee WHERE DEPTNO =60)



실습 5 

DELETE FROM EXAM_EMP  WHERE empno IN (SELECT empno fROM EXAM_EMP, SALGRADE s)
WHERE sal BETWEEN s.losal AND s.hisal AND grade = 5);





1/29 


Trandsaction 
-- 하나의 작업 또는 밀접하게 연관되어 있는 작업 수행을 위해 나눌 수 없는 최소 작업 단위 

-- 최종 반영 (COMMIT) , 모두 취소 (ROLLBACK)

LOCK 
-- 한 세션에서 트랜잭션 작업이 완료되지 않으면 
-- 다른 세션에서 작업을 처리할 수 없는 상태 (DML - INSERT, UPDATE, DELETE)


SQL 

DDL :  CREATE , ALTER 
DML :  SELECT , INSERT, UPDATE, delete
DCL : 권한부여 
 

데이터 정의어 (DDL) - 테이블 정의, 사용자 정의, 권한 부여(취소)


--
테이블 생성 ( CREATE )

CREATE TABLE 테이블 이름  ( 
필드명, 필드타입(크기), 제약조건, )


-- 기존 테이블을 복제해서 새로운 테이블 생성 
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT d ;


-- 테이블의 구조만 복사 ( 데이터 복사 X ) 

CREATE TABLE EMP_TEMP2 AS SELECT * FROM EMP e WHERE 1<>1;  



문자로 시작, 30BYTE 이하로 작성 , 한 테이블 안 열이름 중복 불가
열 이름은 문자, 0-9, 특수문자($, #, _) 사용가능
SQL키워드는 열 이름으로 사용 불가 (ORDER, GROUP, SELECT,,,)


문자 
-- CHAR, VACHAR2 , NCHAR , NVARCHAR2 , CLOB , NCLOB , LONG

-- CHAR , VACHAR : 열의 너비가 고정값인지 가변인지

CHAR (10)  -  10자리 고정
VARCHAR2 (10) - 10자리 이내 가변


- 사용하는 바이트 수 통일 
NCHAR (10) - 10자리 고정 유니코드  (한글 입력하기 편함 (한글은 3바이트니까))
NVARCHAR2 (10) - 10자리 가변 유니코드 



CLOB - 문자열 데이터를 외부 파일로 저장 / 많은 텍스트 데이터 입력시 사용 (4GB)

LONG - 2GB 저장 가능 



숫자 
-- NUMEBER , BINARY_FLOAT, BINARY_DOUBLE

NUMBER (전체자릿수 , 소수점 자리수)



날짜 
-- DATE, TIMESTAMP




테이블 변경 ( ALTER)

-- 열 추가 (ADD)

ALTER TABLE 테이블명 ADD 추가할 열이름 데이터타임; (10 (크기))

-- 열 이름 변경 (RENAME)

ALTER TABLE 테이블명 RENAME COLUMN 기존 열이름 TO 변경 열이름;

-- 열 자료형 변경 (MODIFY)

ALTER TABLE 테이블명 DROP 열이름 데이터타입; (10 (크기))

-- 열 제거 (DROP)

ALTER TABLE 테이블명 DROP COLUMN 열이름; 

-- 테이블명 변경

RENAME 변경 전 테이블명 TO 변경할 테이블명 


삭제 ( DROP)

-- 테이블 삭제 

DROP TABLE 테이블명; 



가상 테이블 (VIEW)

-- 편리성 : 복잡한 쿼리문 저장 용도
-- 보안성 : 작업 저장 용도 

-- 권한을 가진 사용자만 생성할 수 있음.
-- VIEW를 통해 데이터 삽입 시 원본에도 영향을 미침


CREATE VIEW 뷰 이름 AS (SELECT * FROM 원본 테이블명 )

-- VIEW를 통해 원본 수정 가능 

CREATE VIEW 뷰 이름 AS (SELECT * FROM 원본 테이블명 ) WITH READ ONLY;

-- VIEW를 통해 읽기만 가능 



권한이 불충분합니다
-- system에서 권한 부여 


확인
SELECT * FROM USER_UPDATABLE_COLUMNS 
WHERE TABLE_NAME '테이블 이름'



-----------------------------------------

INDEX - 색인, 목차 

-- 기본키, 고유키일 때 자동으로 생성됨.


CREATE INDEX 인덱스명 ON 테이블명 (인덱스로 사용할 필드명)




-- 테이블 생성 - 구조, 데이터복사 
CREATE TABLE Idx_employees AS SELECT DISTINCT first_name, last_name, hire_date FROM EMPLOYEES e ;


-- 인덱스 생성 : RANGE SCAN , 데이터가 많을수록 효력

CREATE INDEX idx_name ON idx_employees(first_name) 


-- 생성 안할 때 : FULL SCAN

SELECT * FROM EMPLOYEES e  WHERE FIRST_NAME = 'Jack';





시퀀스 
-- 오라클 객체, 하나씩 증가하는 값이 필요할 때 주로 사용
-- 다른 DB의 auto_increment 와 동일한 역할 


CREATE SEQUENCE 시퀀스명 INCREMENT BY 증감값 START WITH 시작값 MAXVALUE 최대값  MINVALUE 최소값  
NOCYCLE CACHE 숫자 ; 

--  기본시퀀스 : 1에서 시작 ~ / 1씩 증가 

CREATE SEQUENCE dept_seq;

DROP SEQUENCE dept_seq;

-- 마지막으로 생성된 시퀀스 확인
SELECT dept_seq.currval FROM dual;













CREATE SEQUENCE dept_seq INCREMENT BY 10 START WITH 10 MAXVALUE 90 MINVALUE 0 NOCYCLE CACHE 2;





CREATE TABLE DEPT_SUQUENCE AS SELECT * FROM DEPT WHERE 1<>1;

SELECT * FROM USER_SEQUENCE;

CREATE SEQUENCE dept_seq;

INSERT INTO DEPT_SEQUENCE(DEPTNO, DNAME, LOC) VALUES (DEPT_SEQ.NEXTVAL,'DATABASE','SEOUL' ); 

INSERT INTO dept_sequences(deptno,dname,loc) 
VALUES (dept_seq.nextval, 'database', 'seoul');



















CREATE INDEX IDX_EMP_SAL ON EMP(SAL);



SELECT * FROM USER_IND_COLUMNS;

DROP INDEX IDX_EMP_SAL;





























CREATE VIEW VM_EMP30 AS ( SELECT * FROM EMP WHERE DEPTNO = 30) WITH READ ONLY ;




CREATE VIEW VM_EMP20 AS ( SELECT * FROM EMP WHERE 
DEPTNO = 20);



CREATE VIEW VM_EMP20 AS ( SELECT * FROM EMP WHERE DEPTNO = 20);



SELECT * FROM vm_emp20;

DROP TABLE EMP_ALTER ;


INSERT INTO vm_emp20 
VALUES (8888,'HONG','ANALYST',7902,SYSDATE, 2500, NULL, 20);


SELECT * FROM EMP e ;


DROP VIEW VM_EMP30 ;
DROP VIEW VM_EMP30 ;


SELECT * FROM USER_UPDATABLE_COLUMNS 
WHERE TABLE_NAME = 'VM_EMP30';






RENAME EMP_DDL TO EMP_ALTER;

ALTER TABLE EMP_DDL  DROP COLUMN MOBILE; 


ALTER TABLE EMP_DDL ADD HP VARCHAR2(15); 


ALTER TABLE EMP_DDL MODIFY EMPNO NUMBER(5); 


ALTER TABLE EMP_DDL RENAME COLUMM HP TO MOBILE; 

ALTER TABLE EMP_DDL RENAME COLUMN HP TO MOBILE;






SELECT * FROM EMP_DDL ed 
































CREATE TABLE EMP_DDL (EMPNO NUMBER (4), ENAME VARCHAR (10), JOB VARCHAR(9), MGR NUMBER(4), HIREDATE DATE, SAL NUMBER(7,2) , 
COMM NUMBER(7,2) , DEPTNO NUMBER (2) );



SELECT * FROM EMP_DDL ed 



















INSERT INTO dept_temp VALUES (55, 'network', 'seoul');
UPDATE DEPT_TEMP SET LOC = 'BUSAN' WHERE DEPTNO = 55;

COMMIT;

ROLLBACK;







SELECT * FROM DEPT_TEMP dt 

DELETE FROM DEPT_TEMP dt WHERE DEPTNO = 55;
UPDATE DEPT_TEMP SET DNAME = 'WEB' WHERE DEPTNO = 10;












