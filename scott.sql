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
WHERE e.JOB = MANAGER,SALEMAN,CLERK;

