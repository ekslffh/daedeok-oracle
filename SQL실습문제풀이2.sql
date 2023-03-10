-- 사원관리 연습문제
-- 1. 덧셈연산자를 이용하여 모든 사원에 대해서 300만원의 급여 인상을 계산한 후 사원의 이름, 급여, 인상된 급여를 출력하시오.
SELECT ENAME 사원명, SAL 급여, (SAL + 300) 인상된급여 FROM EMP;
-- 2. 사원번호 7999 사람의 업무(JOB)를 '프로그래머'로 수정하시오.
UPDATE EMP SET JOB='프로그래머' WHERE EMPNO='7999';
-- 3. EMP 테이블 JOB 속성의 데이터타입을 VARCHAR2(20)으로 수정하시오.
ALTER TABLE EMP MODIFY JOB VARCHAR2(20);
-- 4. EMP 테이블에 사원번호로 DEPT테이블과 외래키를 생성하시오.
ALTER TABLE EMP MODIFY DEPTNO CHAR(2); -- DEPT테이블과 EMP테이블에 있는 DEPTNO 타입 맞추기
ALTER TABLE EMP ADD CONSTRAINT FK_DEPTNO FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO);
-- 5. 사원의 이름, 급여, 연간 총 수입을 총 수입이 많은 것부터 작은 순으로 출력하시오. 
--    연간 총수입은 월급에 12를 곱함후 100원의 상여금을 더해서 계산하시오.
SELECT ENAME 사원명, SAL 급여, (SAL * 12 + 100) 연간총수입 FROM EMP ORDER BY 연간총수입;
-- 6. 급여가 2000을 넘는 사원의 이름과 급여를 표현, 급여가 많은 것부터 작은 순으로 출력하시오.
SELECT ENAME 사원명, SAL 급여 FROM EMP WHERE (SAL > 2000) ORDER BY SAL DESC;
-- 7. 사원번호가 7788인 사원의 이름과 부서번호를 출력하시오.
SELECT ENAME 사원명, DEPTNO 부서번호 FROM EMP WHERE EMPNO='7788';
SELECT ENAME 사원명, DEPTNO 부서번호 FROM EMP WHERE EMPNO LIKE 7788;
-- 8. 급여가 2000에서 3000 사이에 포함되지 않는 사원의 이름과 급여를 출력하시오.
SELECT ENAME, SAL FROM EMP WHERE SAL < 2000 OR SAL > 3000;
SELECT ENAME, SAL FROM EMP WHERE NOT (2000 <= SAL AND SAL <= 3000);
SELECT ENAME 사원명, SAL 급여 FROM EMP WHERE NOT SAL BETWEEN 2000 AND 3000;
-- 9. 2020년 2월 20일부터 2023년 12월 31일 사이에 입사한 사원의 이름, 담당업무, 입사일을 출력하시오.
SELECT ENAME 사원명, JOB, HIREDATE FROM EMP WHERE HIREDATE BETWEEN '20/02/20' AND '23/12/31';
SELECT ENAME 사원명, JOB, HIREDATE FROM EMP WHERE HIREDATE NOT BETWEEN '20/02/20' AND '23/12/31';
-- 10. 부서번호가 20 및 30에 속한 사원의 이름과 부서번호를 출력, 이름을 기준(내림차순)으로 영문자순으로 출력하시오.
SELECT ENAME 사원명, DEPTNO 부서번호 FROM EMP WHERE DEPTNO BETWEEN '20' AND '30' ORDER BY ENAME DESC;
SELECT ENAME 사원명, DEPTNO 부서번호 FROM EMP WHERE DEPTNO IN('20','30') ORDER BY ENAME DESC;
-- 11. 사원의 급여가 2000에서 3000사이에 포함되고 부서번호가 20 또는 30인 사원의 이름, 급여와 부서번호를 출력, 이름순(오름차순)으로 출력하시오.
SELECT ENAME 사원명, SAL 급여, DEPTNO 부서번호 FROM EMP WHERE (SAL BETWEEN 2000 AND 3000) AND DEPTNO IN ('20','30') ORDER BY ENAME;
-- 12. 2021년도에 입사한 사원의 이름과 입사일을 출력하시오. (like 연산자와 와일드카드 사용)
SELECT ENAME 사원명, HIREDATE 사원명 FROM EMP WHERE HIREDATE LIKE '21%';
-- 13. 관리자가 없는 사원의 이름과 담당 업무를 출력하시오.
SELECT ENAME, JOB FROM EMP WHERE MGR IS NULL;
SELECT ENAME, JOB FROM EMP WHERE MGR IS NOT NULL;
-- 번외문제. 중간이름이 '민'자가 있는 사원 이름 출력하기
SELECT ENAME FROM EMP WHERE ENAME LIKE '_민_';
-- 14. 이름의 세번째 문자가 "우"인 사원의 이름을 표시하시오.
SELECT ENAME FROM EMP WHERE ENAME LIKE '%우';
SELECT ENAME FROM EMP WHERE ENAME LIKE '__우';
-- 15. 이름에 "우" 또는 "김"을 포함하고 있는 사원의 이름을 표시하시오.
SELECT ENAME FROM EMP WHERE ENAME LIKE '%우%' OR ENAME LIKE '%김%';
-- 16. 커미션을 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션을 출력하되 급여 및 커미션을 기준으로 내림차순 정렬하여 표시하시오.
SELECT ENAME 이름, SAL 급여, COMM 커미션 FROM EMP WHERE COMM IS NOT NULL ORDER BY COMM DESC;
-- 17. 담당업무가 점원, 또는 영업사원이면서 급여가 1600, 1500또는 1300이 아닌 사원의 이름, 담당업무, 급여를 출력하시오.
SELECT ENAME 사원명, JOB 담당업무, SAL 급여 FROM EMP WHERE JOB IN ('영업사원','점원') AND SAL NOT IN (1600,1500,1300);
-- 18. EMP 테이블에 SCORE VARCHAR2(2), REMARK VARCHAR2(50) 속성을 추가하시오.
ALTER TABLE EMP ADD (SCORE VARCHAR2(2), REMARK VARCHAR2(50));
-- 전체 사원 REAMRK에 값 집어넣기
ALTER TABLE EMP MODIFY REMARK VARCHAR2(1000);
UPDATE EMP SET REMARK='On a dark desert highwayCool wind in my hairWarm smell of colitasRising up through the airUp ahead in the distanceI saw a shimmering lightMy head grew heavy and my sight grew dimI had to stop for the night
There she stood in the doorwayI heard the mission bellAnd I was thinking to myself"This could be Heaven or this could be Hell"Then she lit up a candleAnd she showed me the wayThere were voices down the corridorI thought I heard them say
Welcome to the Hotel CaliforniaSuch a lovely place (such a lovely place)Such a lovely facePlenty of room at the Hotel CaliforniaAny time of year (any time of year)You can find it here';
-- UPPER, LOWER, INITCAP
SELECT LOWER('DATA MANIPUL LANG'), 
       UPPER('DATA MANIPUL LANG'), 
       INITCAP('DATA MANIPUL LANG') 
       FROM DUAL;  
-- <예외문제>
SELECT REMARK FROM EMP;
-- 1. 입력된 REMARK 속성에 저장된 영문자를 모두 대문자로 바꾸시오.
SELECT LOWER(REMARK) FROM EMP;
-- 2. 입력된 REMARK 속성에 저장된 영문자를 단어의 첫글자만 대문자로 바꾸시오.
SELECT INITCAP(REMARK) FROM EMP;
-- 19. 커미션이 500 이상인 사원의 이름과 급여 및 커미션을 출력하시오.
SELECT ENAME, SAL, COMM FROM EMP WHERE COMM >= 500;
-- 20. SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력하시오.
-- HIREDATE(시작인덱스: 1부터, 자를 문자열 길이)
SELECT SUBSTR(HIREDATE,1,5) 입사시기 FROM EMP;
SELECT SUBSTR(HIREDATE,1,2) 입사_년, SUBSTR(HIREDATE,4,2) 입사_달 FROM EMP;
-- 21. SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력하시오.
SELECT * FROM EMP WHERE SUBSTR(HIREDATE,4,2)='04';
-- 22. MOD 함수를 사용하여 사원번호가 짝수인 사람만 출력하시오.
-- MOD(A,B): A를 B로 나눈 나머지값
SELECT * FROM EMP WHERE MOD(EMPNO, 2)=0;
-- 23. 입사일을 년도는 2자리(YY), 월은 숫자(MON)로 표시하고 요일은 약어 (DD)로 지정하여 출력하시오.
SELECT SUBSTR(HIREDATE,1,2) 입사년도, SUBSTR(HIREDATE,4,2) 월, EMPNO, ENAME FROM EMP;
SELECT SUBSTR(HIREDATE,1,2)YY, SUBSTR(HIREDATE,4,2)MON, SUBSTR(HIREDATE,7,2)DD FROM EMP;
-- 24. 올해 몇일이 지났는지 출력하시오. 현재날짜에서 올해 1월 1일을 뺀 결과를 출력하고 TO_DATE 함수를 사용하여 테이터 형을 일치시키시오.
SELECT TO_DATE('2023-02-20') - TO_DATE('2023-01-01') FROM DUAL;
SELECT SYSDATE - TO_DATE('2023-01-01') FROM DUAL;
-- 입사한지 100일이되는 날짜를 출력하시오.
SELECT ENAME 회원명, HIREDATE 입사일, HIREDATE + 100 "입사한지100일째" FROM EMP;
SELECT * FROM ALL_TABLES;
SELECT SYSDATE FROM DUAL;
SELECT TO_DATE('2023-02-20','YYYY-MM-DD') FROM DUAL; -- ? 형식 안바뀜
SELECT TO_DATE(SYSDATE) - TO_DATE('2023-02-01') FROM DUAL;
SELECT ADD_MONTHS(SYSDATE,5) FROM DUAL;
-- 이번달이 몇일 남았는지 조회
SELECT SYSDATE AS 오늘날짜, LAST_DAY(SYSDATE) AS "이달 마지막 날짜", LAST_DAY(SYSDATE) - SYSDATE AS "이번달에 남은 날" FROM DUAL;
-- 사원들의 사번, 이름, 상관사번을 출력하되 상관이 없는 사원에 대해서는 NULL 값대신 0으로 출력하시오.
SELECT EMPNO 사번, ENAME 이름, NVL(MGR,'대기발령') 상관사번 FROM EMP;
-- 상관사번이 NULL이 아니면 승진대상, NULL이면 대기발령으로 출력
SELECT EMPNO 사번, ENAME 이름, NVL2(MGR,'승진대상','대기발령') 상관사번 FROM EMP;
-- 26. DECODE 함수로 직급에 따라 급여를 인상하도록 하시오. 직급이 '분석가'인 사원은 200, '영업사원'인 사원은 180, '관리자'인 사원은 150, '점원'인 사원은 130을 인상하시오.
SELECT EMPNO 사번, ENAME 이름, JOB 직무, SAL 급여, DECODE(JOB, '분석가',SAL + 200, '영업사원',SAL + 180, '관리자',SAL + 150, '점원',SAL + 130, SAL) 인상급여, DECODE(JOB, '분석가','200', '영업사원','180', '관리자','150', '점원','130','0') 인상금액 FROM EMP;
-- 27. 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하시오. 평균에 대해서는 정수로 반올림하시오.
UPDATE EMP SET SAL=1400 WHERE ENAME='박정수'; -- SAL 잘못 줌
SELECT MAX(SAL) 최고액, MIN(SAL) 최저액, SUM(SAL) 총액, ROUND(AVG(SAL),0) 평균 FROM EMP;
-- 28. 각 담당 업무 유형별로 급여 최고액, 최저액, 총액 및 평균금액을 출력하시오. 평균에 대해서는 정수로 반올림하시오.
SELECT JOB 담당업무, MAX(SAL) 최고액, MIN(SAL) 최저액, SUM(SAL) 총액, ROUND(AVG(SAL),0) 평균 FROM EMP GROUP BY JOB;
-- 29. COUNT(*) 함수를 이용하여 담당업무가 동일한 사원수를 출력
SELECT JOB 담당업무, COUNT(*) 인원수, MAX(SAL) 최고액, MIN(SAL) 최저액, SUM(SAL) 총액, ROUND(AVG(SAL),0) 평균 FROM EMP GROUP BY JOB;
-- 30. 급여 최고액, 급여 최저액의 차액을 출력하시오.
SELECT MAX(SAL) 최고액, MIN(SAL) 최저액, MAX(SAL) - MIN(SAL) 차액 FROM EMP;
UPDATE EMP SET SAL=4500 WHERE JOB='프로그래머';
-- 31. 업무를 표시한 다음 해당 업무에 대해 부서 번호별 급여 및 부서 10,20,30의 급여총액을 각각 출력하시오.
-- 별칭은 각 JOB, DNO, 부서 10, 부서 20, 부서 30, 총액으로 지정하시오
-- 부서번호별로 그룹을 만들었지만 동일한 부서번호에 부서이름이 있는지 없는지를 컴퓨터는 모른다. 따라서 동일한 결과겠지만 부서이름으로 다시 한번 그룹을 해줘야지 그룹의 이름또한 사용이 가능하다.
SELECT DEPTNO 부서번호, SUM(SAL) 급여총액 FROM EMP GROUP BY DEPTNO;
SELECT E.DEPTNO 부서번호, SUM(E.SAL) 총액, D.DNAME 부서명 FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO GROUP BY E.DEPTNO, D.DNAME;
SELECT * FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO;
-- 32. EQUI 조인을 사용하여 김민욱 사원의 부서번호와 부서 이름을 출력하시오.
SELECT E.ENAME 사원명, D.DEPTNO 부서번호, D.DNAME 부서이름 FROM DEPT D,EMP E WHERE D.DEPTNO=E.DEPTNO AND E.ENAME='김민욱'; 
-- 33. INNER JOIN과 ON 연산자를 사용하여 사원 이름과 함께 그 사원이 소속된 부서이름과 지역명을 출력하시오.
SELECT E.ENAME 사원명, D.DNAME 부서명, D.LOC 지역명 FROM EMP E INNER JOIN DEPT D ON E.DEPTNO=D.DEPTNO;
SELECT E.ENAME 사원명, D.DNAME 부서명, D.LOC 지역명 FROM EMP E INNER JOIN DEPT D USING (DEPTNO);
-- 34. INNER JOIN과 USING 연산자를 사용하여 10번 부서에 속하는 모든 담당 업무의 고유 목록(한번씩만 표시)을 부서의 지역명을 포함하여 출력하시오.
SELECT E.ENAME 사원명, D.DNAME 부서명, D.LOC 지역명 FROM EMP E INNER JOIN DEPT D USING (DEPTNO) WHERE DEPTNO='10';
SELECT EMP.EMPNO 사원번호, DEPT.LOC 지역명, EMP.JOB 담당업무 FROM EMP INNER JOIN DEPT USING (DEPTNO) WHERE DEPTNO='10';
SELECT DEPTNO, E.EMPNO 사원번호, D.LOC 지역명, E.JOB 담당업무 FROM EMP E INNER JOIN DEPT D USING (DEPTNO) WHERE DEPTNO='10';
-- 35. NATURAL JOIN을 사용하여 커미션을 받는 모든 사원의 이름, 부서이름, 지역 명을 출력하시오.
SELECT E.ENAME, D.DNAME, D.LOC FROM EMP E INNER JOIN DEPT D ON E.DEPTNO=D.DEPTNO WHERE E.COMM IS NOT NULL;
SELECT E.ENAME, D.DNAME, D.LOC FROM EMP E INNER JOIN DEPT D USING (DEPTNO) WHERE E.COMM IS NOT NULL;
-- 36. EQUI조인과 WildCARD를 사용하여 이름에 '민'이 포함된 모든 사원의 이름과 부서명을 출력하시오.
SELECT E.ENAME 사원명, D.DNAME 부서명 FROM EMP E INNER JOIN DEPT D ON E.DEPTNO=D.DEPTNO WHERE E.ENAME LIKE '%민%';
SELECT EMP.ENAME 이름, DEPT.DNAME 부서명 FROM EMP, DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO AND EMP.ENAME LIKE '%민%';
-- 37. NATURAL JOIN을 이용하여 대전에 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명을 출력하시오.
SELECT ENAME 사원명, JOB 업무, DEPTNO 부서번호, DNAME 부서명 FROM EMP NATURAL JOIN DEPT WHERE LOC='대전';
-- 38. SELF JOIN을 사용하여 사원의 이름 및 사원번호를 관리자 번호와 함께 출력하시오.
SELECT  E1.EMPNO 사원번호, E1.ENAME 사원명, E1.MGR 관리자번호, E2.ENAME 관리자명 FROM EMP E1, EMP E2 WHERE E1.MGR=E2.EMPNO ORDER BY E1.EMPNO;
-- 39. SELF JOIN을 사용하여 지정한 사원의 이름, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하시오. (고영우)
SELECT ENAME, DEPTNO FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='고영우');
SELECT E.ENAME, E.DEPTNO, E1.ENAME FROM EMP E, EMP E1 WHERE E.DEPTNO=E1.DEPTNO AND E.ENAME='고영우' AND NOT E1.ENAME='고영우';
-- 40. 사원번호가 7788인 사원과 담당업무가 같은 사원을 표시(사원이름과 담당업무)하시오.
SELECT * FROM EMP E, EMP E1 WHERE E.JOB=E1.JOB AND E.EMPNO='7788';
SELECT E1.ENAME 사원명, E1.JOB 담당업무 FROM EMP E, EMP E1 WHERE E.JOB=E1.JOB AND E.EMPNO<>'7788'; -- 중복돼서 나오는 이유
SELECT E1.ENAME 사원명, E1.JOB 담당업무 FROM EMP E, EMP E1 WHERE E.JOB=E1.JOB AND E.EMPNO='7499' AND E1.EMPNO<>'7499';

-- 45. 사원번호가 7499인 사원보다 급여가 많은 사원을 표시하시오. 사원이름과 담당 업무
SELECT ENAME, JOB, SAL FROM EMP WHERE SAL > (SELECT SAL FROM EMP WHERE EMPNO='7499');
SELECT A.ENAME 사원명, A.JOB 담당업무, A.SAL 급여 FROM EMP A, EMP B WHERE B.EMPNO='7499' AND A.SAL > B.SAL;

-- 상품가격이 17만원이 상품 조회
SELECT PROD_NAME 상품명, PROD_SALE 판매가 FROM PROD WHERE PROD_SALE = 170000;
-- 상품가격이 17만원이 아닌 상품 조회
SELECT PROD_NAME 상품명, PROD_SALE 판매가 FROM PROD WHERE PROD_SALE <> 170000;
-- 상품가격이 17만원 초과 또는 미만인 조회 (즉 17만원이 아닌 상품조회)
SELECT PROD_NAME 상품명, PROD_SALE 판매가 FROM PROD WHERE PROD_SALE > 170000 OR PROD_SALE < 170000;

-- 46. 최소급여를 받는 사원의 이름, 담당업무 및 급여를 표시하시오. (그룹함수 사용)
SELECT ENAME 사원명, JOB 담당업무, SAL 급여 FROM EMP WHERE SAL = (SELECT MIN(SAL) FROM EMP);
-- 최고급여인 직원
SELECT ENAME 사원명, JOB 담당업무, SAL 급여 FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP);
-- 최고급여, 최저급여, 평균급여 출력
SELECT MAX(SAL) 최고급여, MIN(SAL) 최저급여, ROUND(AVG(SAL),2) 평균급여 FROM EMP;
-- 47. 평균급여가 가장 적은 직급의 직급 이름과 직급의 평균을 구하시오.
-- 1단계
SELECT JOB 직무, ROUND(AVG(SAL)) 평균급여 FROM EMP GROUP BY JOB ORDER BY AVG(SAL);
-- 2단계
SELECT 직무, 평균급여 FROM (SELECT JOB 직무, ROUND(AVG(SAL)) 평균급여 FROM EMP GROUP BY JOB ORDER BY AVG(SAL));
-- 3단계
SELECT * FROM (SELECT JOB 직무, ROUND(AVG(SAL)) 평균급여 FROM EMP GROUP BY JOB ORDER BY AVG(SAL)) WHERE ROWNUM=1;

SELECT 직무, 평균급여, RANK () OVER(ORDER BY 평균급여) AS 순위
FROM (SELECT JOB 직무, ROUND(AVG(SAL)) 평균급여 FROM EMP GROUP BY JOB ORDER BY AVG(SAL));

-- 48. 각 부서의 최소 급여를 받는 사원의 이름, 급여, 부서번호를 표시하시오.
SELECT A.ENAME, A.SAL, A.DEPTNO FROM EMP A INNER JOIN (SELECT DEPTNO, MIN(SAL) SAL FROM EMP GROUP BY DEPTNO) B ON A.DEPTNO=B.DEPTNO WHERE A.SAL = B.SAL;
SELECT A.ENAME 사원명, A.SAL 급여, A.DEPTNO 부서번호 FROM EMP A, (SELECT DEPTNO, MIN(SAL) 부서최저급여 FROM EMP GROUP BY(DEPTNO)) B WHERE A.DEPTNO=B.DEPTNO AND A.SAL=B.부서최저급여;

-- 49. 담당업무가 분석가인 사원보다 급여가 적으면서 업무가 분석가가 아닌 사원들을 표시(사원번호, 이름, 담당업무, 급여)하시오.
SELECT * FROM EMP WHERE JOB='분석가';
SELECT EMPNO 사원번호, ENAME 이름, JOB 담당업무, SAL 급여 FROM EMP WHERE SAL < (SELECT MIN(SAL) FROM EMP GROUP BY JOB HAVING JOB='분석가') ORDER BY ENAME;
SELECT EMPNO 사원번호, ENAME 이름, JOB 담당업무, SAL 급여 FROM EMP WHERE SAL < ALL (SELECT SAL FROM EMP WHERE JOB='분석가');

SELECT MIN(SAL) FROM EMP GROUP BY JOB HAVING JOB='분석가';
-- 각 부서의 최소급여를 받는 사원의 이름,급여,부서번호를 표시하시오
-- 문제점
-- 30번 부서의 급여의 최소값은 1250인데 30번 부서에 1400의 급여를 갖는 사람이 있으면 출력된다. (20번 부서의 급여 최소값이 1400이기 때문에)
SELECT ENAME, SAL, DEPTNO FROM EMP WHERE SAL IN (SELECT MIN(SAL) from EMP GROUP BY(DEPTNO));

-- 50. 부하직원이 없는 사원의 이름을 표시하시오.(사원번호가 매니저로 저장되어 있지 않은 사람을 조회해야 함)
SELECT * FROM EMP;
SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL;
SELECT EMPNO 사원번호, ENAME 사원명 FROM EMP WHERE ENAME NOT IN (SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL) ORDER BY EMPNO;

--SELECT EMPNO, ENMAE FROM EMP WHERE ENAME NOT IN (SELECT E.NAME 사원이름 FROM EMP E, EMP E1 WHERE E.EMPNO=E1.MGR);

SELECT * FROM PROD;
SELECT PROD_ID 상품코드, PROD_NAME 상품명 FROM PROD WHERE PROD_NAME LIKE '%여름%';

-- INNER JOIN은 동일한 속성이 두번 나온다 _1을 붙임.
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO;

-- 맛뵈기. 상품테이블에서 상품코드, 상품명, 분류명, 거래처 명을 조회하시오.
SELECT PROD.PROD_ID "상품코드",PROD.PROD_NAME "상품명",LPROD.LPROD_NM "분류명",BUYER.BUYER_NAME "거래처명" 
FROM PROD,LPROD,BUYER
WHERE PROD.PROD_LGU=LPROD.LPROD_GU AND PROD.PROD_BUYER=BUYER.BUYER_ID;

-- C||C: 둘이상의 문자열을 연결하는 결합 연산자
SELECT 'a' || 'bcde' FROM DUAL;
SELECT MEM_ID || ' NAMEIS ' || MEM_NAME FROM MEMBER;
-- CONCAT: 두 문자열을 연결하여 반환
SELECT CONCAT('MY NAME IS ',MEM_NAME) 소개 FROM MEMBER;
-- CHR,ASCII: ASCII값을 문자로, 문자로 ASCII값으로 반환
SELECT CHR(65) "CHR", ASCII('ABC') "ASCII" FROM DUAL;
SELECT ASCII(CHR(65)) RESULT FROM DUAL;
SELECT CHR(75) CHR, ASCII('K') ASCII FROM DUAL;
-- 회원테이블의 회원 ID Column의 ASCII값을 검색하시오?
SELECT ASCII(MEM_ID) AS "회원 ASCII", CHR(ASCII(MEM_ID)) AS 회원CHR FROM MEMBER;
-- LOWER, UPPER, INITCAP
SELECT LOWER('DATA manipulation Language') LOWER, UPPER('DATA manipulation Language') UPPER, INITCAP('DATA manipulation Language') INITCAP FROM DUAL;
-- 회원테이블의 회원ID를 대문자로 변환하여 검색하시오? (Alias명은 변환 전ID, 변환 후ID)
SELECT UPPER(MEM_ID) 멤버아이디 FROM MEMBER;

UPDATE EMP 
SET REMARK='Sally called when she got the word
And she said, "I suppose you''ve heard ''bout Alice"
So I rushed to the window and I looked outside
And I could hardly believe my eyes
As a big limousine rode up into Alice''s drive
Oh, I don''t know why she''s leaving, or where she''s gonna go
I guess she''s got her reasons, but I just don''t wanna know
''Cause for 24 years I''ve been living next door to Alice
24 years just waitin'' for a chance
To tell her how I feel and maybe get a second glance
Now I gotta get used to not living next door to Alice
We grew up together, two kids in the park
Carved out initials deep in the bark, me and Alice
Now she walks through the door with her head held high
Just for a moment I caught her eye
As the big limousine pulled slowly out of Alice''s drive';

SELECT UPPER(REMARK) FROM EMP;

--  지정된 길이 n에서 c1을 채우고 남은 공간을 c2로 채워서 반환한다.
-- LPAD(c1,n,c2)
SELECT LPAD('Java',10,'*') LPAD, RPAD('Flex',12,'^') RPAD FROM DUAL;
SELECT LPAD('나성민',12,'*') FROM DUAL;

-- 상품테이블의 소비자가격과 소비자가격을 치환하여 다음과 같이 출력되게 하시오.
SELECT PROD_PRICE, LPAD(PROD_PRICE,10,'*') PROD_RESULT FROM PROD;

-- SELECT '<' || TRIM('   AAA   ') || '>' TRMI1,
--       '<' || TRIM(BOTH 'He' FROM 'Hello WorldHe') || '>' TRIM2 
--       FROM DUAL;

SELECT '<' || LTRIM('   AAA   ') || '>' LTRMI1,
       '<' || LTRIM('Hello World','He') || '>' LTRIM2 
       FROM DUAL;

SELECT '<' || RTRIM('   AAA   ') || '>' RTRMI1,
       '<' || RTRIM('Hello WorldHe','He') || '>' RTRIM2 
       FROM DUAL;
       
-- SUBSTR
SELECT SUBSTR('SQLPROJECT',1,3) RESULT1,
       SUBSTR('SQLPROJECT',5) RESULT2,
       SUBSTR('SQLPROJDCT',-7,3) RESULT3,
       SUBSTR('SQL나성민PROJDCT',-10,3) RESULT3
       FROM DUAL;
-- 회원테이블의 성씨 조회
SELECT MEM_ID, SUBSTR(MEM_NAME,1,1) 성씨 FROM MEMBER;
-- 상품테이블의 상품명의 4째 자리부터 2글자가 '칼라'인 상품의 상품코드, 상품명을 검색하시오 (Alias명은 상품코드, 상품명)
SELECT PROD_ID 상품코드, PROD_NAME 상품명 FROM PROD WHERE SUBSTR(PROD_NAME,4,2)='칼라';

-- TRANSLATE(c1,c2,c3): c1문자열에 포함된 문자 중 c2에 지정된 문자가 c3문자로 각각 변경, c3문자가 c2보다 적은경우 해당 문자는 제거
SELECT TRANSLATE('2009-02-28','0123456789-','ABCDEFGHIJK') RESULT FROM DUAL;
-- 상품테이블의 상품코드에서 왼쪽4자리, 오른쪽 6자리를 검색하시오 (Alias명은 상품코드, 대분류, 순번)
SELECT PROD_ID FROM PROD;
SELECT PROD_ID 상품코드, SUBSTR(PROD_ID,1,4) 대분류, SUBSTR(PROD_ID,-6) 순번 FROM PROD;
-- 회원테이블의 회원아이디에서 숫자를 제거하여 출력하시오? (Alias명은 회원아이디, 변환아이디)
SELECT MEM_ID 회원아이디, TRANSLATE(MEM_ID,'0123456789',' ') 변환아이디 FROM MEMBER;
SELECT MEM_ID 회원아이디, REPLACE(MEM_ID,'001') 변환아이디 FROM MEMBER;
SELECT REGEXP_REPLACE(MEM_ID, '[[:digit:]]') AS 숫자제거_회원아이디
FROM MEMBER;
select mem_id 회원아이디, translate(mem_id, '0123456789', ' ') result from member;
-- REPLACE
SELECT REPLACE('SQLPROJECT','SQL','SSQQLL') 문자치환1, 
       REPLACE('JavaFlexVia','a') 문자치환2 from dual;
-- 거래처 테이블의 거래처명 중 '삼' --> '육'으로 치환
SELECT BUYER_NAME, REPLACE(BUYER_NAME,'삼','육') "삼->육" FROM BUYER;
-- 회원테이블의 회원성명 중 '이' --> '리'로 치환검색하시오
SELECT MEM_NAME 회원명, REPLACE(MEM_NAME,'이','리') 회원명치환 FROM MEMBER;
SELECT MEM_NAME 회원명, REPLACE(MEM_NAME,'이','리') 회원명치환 FROM MEMBER WHERE MEM_NAME LIKE '이%';

-- INSTR(c1,c2,[m,[n]]): c1문자열에서 c2문자가 처음 나타나는 위치를 리턴, m은 시작위치, n은 n번째
SELECT INSTR('hello heidi', 'he') AS RESULT1,
       INSTR('hello heidi', 'he', 3) AS RESULT2 ,
       INSTR('hello heidi', 'he', 1, 2) AS RESULT23
       FROM DUAL;
       
SELECT ABS(-365) FROM DUAL;
SELECT SIGN(12), SIGN(0), SIGN(-55) FROM DUAL;
SELECT POWER(3,2), POWER(2,10) FROM DUAL;
SELECT SQRT(2), SQRT(9) FROM DUAL;

SELECT GREATEST(10,20,30) 큰값, LEAST(10,20,30) 작은값 FROM DUAL;
SELECT GREATEST('강아지',256,'송아지') 큰값, LEAST('강아지',256,'송아지') 작은값 FROM DUAL;
-- 회원 테이블에서 회원이름, 마일리지를 출력하시오. (단, 마일리지가 1000보다 작은 경우 1000으로 변경)
SELECT MEM_NAME 회원이름, (MEM_MILEAGE + 1000) 마일리지 FROM MEMBER WHERE TO_NUMBER(MEM_MILEAGE) < 1000;
SELECT MEM_NAME 회원이름, CASE WHEN MEM_MILEAGE < 1000 THEN MEM_MILEAGE + 1000 ELSE MEM_MILEAGE END AS 마일리지 FROM MEMBER;

-- ROUND, TRUNC
SELECT ROUND(345.123,0) 결과 FROM DUAL;
SELECT ROUND(345.123,-1) 결과2 FROM DUAL;
-- 회원 테이블의 마일리지를 12로 나눈 값을 검색 (소수3번째 자리 반올림, 절삭)
SELECT MEM_MILEAGE FROM MEMBER;

-- MOD(c,n): c를 n으로 나눈 나머지
SELECT MOD(10.45645615154564646,1) FROM DUAL;

-- FLLOR(n): 올림, CEIL(n): 내림
SELECT FLOOR(1332.69), CEIL(1332.22) FROM DUAL; 
SELECT FLOOR(-1332.69), CEIL(-1332.69) FROM DUAL; 

-- REMAINDER(c,n): n으로 나눈 나머지, MOD함수와 유사
SELECT MOD(10,3), REMAINDER(10,3) FROM DUAL;
SELECT MOD(10,3.7), REMAINDER(10,3.7) FROM DUAL;

-- 23-02-27
-- WIDTH_BUCKET(c, min, max, b): min에서 max의 범위로 설정하고 b구간으로 나누어 c가 어느 구간에 속하는지 리턴
SELECT WIDTH_BUCKET(88,0,100,10) FROM DUAL;
SELECT WIDTH_BUCKET(20,0,100,10) FROM DUAL;
-- 회원 테이블에서 회원이름, 마일리지, 등급을 출력하시오.
--  (단, 등급은 마일리지를 500부터 3000까지 5등급으로 한다.)
SELECT MEM_NAME 회원이름, MEM_MILEAGE 마일리지, WIDTH_BUCKET(MEM_MILEAGE,500,3000,5) 등급 FROM MEMBER ORDER BY 등급;
SELECT MEM_NAME 회원이름, MEM_MILEAGE 마일리지, WIDTH_BUCKET(MEM_MILEAGE,500,3000,10) 등급 FROM MEMBER ORDER BY 등급;

-- 숫자의 절사: 지정된 자리 수까지 나타내고 그 밑은 버림(TRUNC)
-- 버림함수 구현
-- 버림할 위치의 값에 5를 뺀 후에 반올림하면 버림의 효과를 얻는다.
SELECT ROUND(345.123 - 0.05, 1) RESULT1,
       ROUND(345.123 - 0.5, 0) RESULT2,
       ROUND(345.123 - 5, -1) RESULT3 FROM DUAL;

-- 100 / 9 결과값을 십의 자리까지 나타내고 일의 자리는 버리시오
SELECT ROUND((100 / 9) - 5, -1) RESULT FROM DUAL;
-- FLOOR함수 활용
SELECT 10000 / 7 FROM DUAL;
SELECT FLOOR(10000 / 7 * 1000) / 1000 FROM DUAL; -- 소수점 3째자리
SELECT FLOOR(10000 / 7 * 100) / 100 FROM DUAL; -- 소수점 2째자리
SELECT FLOOR(10000 / 7 * 10) / 10 FROM DUAL; -- 소수점 1째자리
SELECT FLOOR(10000 / 7) FROM DUAL; -- 자연수
SELECT FLOOR(10000 / 7 / 10) * 10 FROM DUAL; -- 10째자리

-- TRUNC: 반올림이 아닌 절삭
SELECT PROD_NAME AS 상품명, PROD_COST AS 원가, PROD_SALE AS 판매가,
       PROD_COST/PROD_SALE*100 AS 원가율,
       TRUNC(PROD_COST/PROD_SALE*100,1) AS 원가율2,
       (FLOOR(PROD_COST/PROD_SALE*100*10)/10) AS 원가율3
       FROM PROD;

-- SYSDATE: 시스템에서 제공하는 현재 날짜와 시간값
SELECT SYSDATE "현재시간", SYSDATE - 1 "어제 이시간", SYSDATE + 1 "내일 이시간" FROM DUAL;
SELECT MEM_NAME AS 회원명, MEM_BIR AS 생일, (MEM_BIR + 12000) AS "12000일째" FROM MEMBER;
-- ADD_MONTHS(date,n): date에 월을 더한 날짜
SELECT ADD_MONTHS(SYSDATE,5) FROM DUAL;
SELECT NEXT_DAY(SYSDATE,'월요일'), LAST_DAY(SYSDATE) FROM DUAL;

-- 이번달이 며칠이 남았는지 검색하시오
SELECT LAST_DAY(SYSDATE) - SYSDATE AS "이번달 남은 날" FROM DUAL;

SELECT ROUND(SYSDATE,'MM'), TRUNC(SYSDATE,'MM') FROM DUAL;

-- MONTHS_BETWEEN(date1,date2): 두 날짜 사이의 달수를 숫자로 리턴
SELECT MONTHS_BETWEEN(SYSDATE,'2000-01-01') FROM DUAL; 

SELECT EXTRACT(YEAR FROM SYSDATE) AS "년도",
       EXTRACT(MONTH FROM SYSDATE) AS "월",
       EXTRACT(DAY FROM SYSDATE) AS "일"
       FROM DUAL;

SELECT MEM_ID AS "회원ID", MEM_NAME AS "회원명", MEM_BIR AS "생일" FROM MEMBER WHERE EXTRACT(MONTH FROM MEM_BIR) = 3;

-- CAST(expr AS type): 명시적으로 형 변환
SELECT '[' || CAST('Hello' AS CHAR(10)) || ']' AS "형변환" FROM DUAL;
SELECT CAST('1997/12/25' AS DATE) FROM DUAL;

SELECT TO_CHAR(SYSDATE,'ADYYYY,CC"세기"') FROM DUAL;
-- TO_CHAR를 통해서 현재 날짜를 문자열로 나타내면서 형식을 원하는대로 변경가능
SELECT TO_CHAR(CAST('2008-12-25' AS DATE), 'YYYY.MM.DD HH24:MI') FROM DUAL;

-- 상품테이블에서 상품입고일을 '2008-09-28' 형식으로 나오게 검색하시오. (Alias 상품명,상품판매가,입고일)
SELECT PROD_NAME AS "상품명", PROD_SALE AS "상품판매가", TO_CHAR(PROD_INSDATE,'YYYY-MM-DD') AS "입고일" FROM PROD;
-- 회원이름과 생일로 다음처럼 출력되게 작성하시오.
-- 김은대님은 1976년 1월 출생이고 태어난 요일은 목요일
SELECT MEM_NAME AS "회원이름", MEM_BIR AS "회원생일", MEM_NAME || '님은 ' || TO_CHAR(MEM_BIR, 'YYYY"년" MM"월 출생이고 태어난 요일은" DAY') FROM MEMBER;

-- 숫자 FORMAT
SELECT TO_CHAR(1234.6,'99,999.00') FROM DUAL;
SELECT TO_CHAR(-1234.6,'L9999.00PR') FROM DUAL;
SELECT TO_CHAR(255,'XXX') FROM DUAL;

SELECT TO_CHAR(15, 'XXX'),
       TO_CHAR(16, 'XXX'),
       TO_CHAR(17, 'XXX')
       FROM DUAL;

SELECT MEM_NAME 회원이름, MEM_MILEAGE 마일리지,
CASE 
    WHEN MEM_MILEAGE >= 3000 THEN 'VIP'
    WHEN MEM_MILEAGE >= 2000 THEN '골드'
    WHEN MEM_MILEAGE >= 1000 THEN '실버'
    WHEN MEM_MILEAGE >= 500 THEN '브론즈'
    ELSE '일반'
  END AS 등급
FROM MEMBER ;

SELECT PROD_ID AS "상품코드",
       PROD_NAME AS "상품명",
       TO_CHAR(PROD_COST,'L99,999,999') AS "매입가격",
       TO_CHAR(PROD_PRICE,'L99,999,999') AS "소비자가격",
       TO_CHAR(PROD_SALE,'L99,999,999') AS "판매가격"
       FROM PROD;

-- TO_NUMBER
SELECT TO_NUMBER('3.1415') FROM DUAL;
SELECT TO_NUMBER('￦1,200','L999,999') FROM DUAL;

-- 회원테이블에서 이쁜이회원의 회원ID2~4 문자열을 숫자형으로 치환한 후 10을 더하여 새로운 회원ID로 조합하시오.
-- (Alias는 회원ID, 조합회원ID)
SELECT MEM_ID 회원ID, TO_NUMBER(SUBSTR(MEM_ID,2,3)) + 10 "조합회원ID" FROM MEMBER WHERE MEM_NAME='이쁜이';
SELECT MEM_ID 회원ID, 
       SUBSTR(MEM_ID,1,1) 조합회원ID,
       SUBSTR(MEM_ID,2),
       TO_CHAR(SUBSTR(MEM_ID,2) + 10, '000'),
       LPAD(SUBSTR(MEM_ID,2) + 10,3,'0'),
       SUBSTR((1000 + TO_NUMBER(SUBSTR(MEM_ID,2))+10),2),
       REPLACE(SUBSTR(MEM_ID,2)+10,'11','011')
       FROM MEMBER
       WHERE MEM_NAME='이쁜이';

SELECT TO_DATE('2009-03-05') + 3 FROM DUAL;
SELECT TO_DATE('200803101234','YYYYMMDDHH24MI') FROM DUAL;

-- 230228
-- 회원테이블에서 주민등록번호1을 날짜로 치환한 후 검색하시오 (Alias는 회원명, 주민등록번호1, 치환날짜)
SELECT MEM_NAME 회원명, 
       MEM_REGNO1 주민등록번호1,
       '19'||TO_DATE(MEM_REGNO1,'YYMMDD') 치환날짜2,
       TO_CHAR(TO_DATE(MEM_REGNO1,'YYMMDD'),'"19"YY-MM-DD') 치환날짜3
       FROM MEMBER;

-- AVG(column): 조회 범위 내 해당 컬럼들의 평균값
-- All이 기본값이고 DISTINCT 설정시 중복값 제거
SELECT ROUND(AVG(DISTINCT PROD_COST),1) AS "중복된 값은 제외",
       AVG(ALL PROD_COST) AS "DEFAULT,모든값을포함",
       AVG(PROD_COST) AS "매입가 평균"
       FROM PROD;

-- 상품테이블의 총 판매가격 평균 값을 구하시오? 
SELECT AVG(PROD_SALE) AS "총 판매가격평균" FROM PROD;
SELECT AVG(ALL PROD_SALE) AS "총 판매가격평균" FROM PROD;

-- 상품테이블의 상품분류별 판매가격 평균값을 구하시오?
SELECT PROD_LGU AS 상품분류,
       AVG(ALL PROD_SALE) AS "상품분류판매가격평균"
       FROM PROD
       GROUP BY PROD_LGU;

-- COUNT(col), COUNT(*): 조회 범위 내 해당 컬럼들의 자료 수, 선택된 자료의 수
SELECT COUNT(DISTINCT PROD_COST),
       COUNT(ALL PROD_COST),
       COUNT(*)
       FROM PROD;

-- 거래처 테이블의 담당자(BUYER_CHARGER)를 컬럼으로 하여 COUNT집계하시오?
SELECT COUNT(BUYER_CHARGER), COUNT(DISTINCT BUYER_CHARGER), COUNT(*) FROM BUYER;
-- COUNT할 때 NULL값은 제외하고 카운트
SELECT COUNT(COMM) FROM EMP;

-- 회원테이블의 취미종류수를 COUNT집계하시오
SELECT COUNT(DISTINCT MEM_LIKE) AS "취미종류수" FROM MEMBER;
-- 회원테이블의 취미별 COUNT집계하시오? (Alias는 취미, 자료수, 자료수(*))
-- COUNT(*)는 전체 자료수 (ROW 집계), COUNT(속성)은 속성 자료개수(NULL이면 집계안함)
SELECT MEM_LIKE 취미, COUNT(MEM_LIKE) 자료수, COUNT(*) "자료수(*)" FROM MEMBER GROUP BY MEM_LIKE;
-- 회원테이블의 직업종료수를 COUNT집계하시오
SELECT COUNT(DISTINCT MEM_JOB) AS "직업종류수" FROM MEMBER;
-- 회원테이블의 직업별 COUNT집계 하시오 (Alias는 직업, 자료수, 자료수(*))
SELECT MEM_JOB AS "직업", COUNT(MEM_JOB) AS "자료수", COUNT(*) AS "자료수(*)" FROM MEMBER GROUP BY MEM_JOB;
-- 장바구니테이블의 회원(CART_MEMBER)별 COUNT집계하시오? (Alias는 회원ID, 구매수(DISTINCT), 구매수, 구매수(*))
SELECT CART_MEMBER FROM CART;
SELECT CART_MEMBER 회원ID, COUNT(DISTINCT CART_MEMBER) AS "구매수(DISTINCT)", COUNT(*) AS "구매수(*)" FROM CART GROUP BY CART_MEMBER;

-- MAX(col), MIN(col): 조회 범위 내 해당 컬럼들 중 최대값과 최소값
-- 상품 중 거래처별 최고매입가격과 최저매입가격
SELECT PROD_BUYER AS "거래처",
       MAX(PROD_COST) AS "최고매입가",
       MIN(PROD_COST) AS "최저매입가"
       FROM PROD
       GROUP BY PROD_BUYER;
-- 장바구니 테이블의 회원별 최대구매수량을 검색하시오 (Alias는 회원ID, 최대수량, 최소수량)
SELECT CART_MEMBER AS "회원ID", MAX(CART_QTY) AS "최대수량", MIN(CART_QTY) AS "최소수량" FROM CART GROUP BY CART_MEMBER;
-- 오늘이 2020년도7월11일이라 가정하고 장바구니 테이블에 발생될 추가주문번호를 검색하시오?(Alias는 최고치주문번호, 추가주문번호)
SELECT * FROM CART;
-- 오늘이 2020년도7월11일이라 가정하고 장바구니 테이블에 발생될 추가주문번호를 검색하시오
SELECT MAX(CART_NO) AS "최고치주문번호", MAX(CART_NO) + 1 AS "추가주문번호" FROM CART WHERE SUBSTR(CART_NO,1,8)='20200711';

-- SUM(column): 조회 범위 내 해당 컬럼들의 합계
-- 상품입고테이블의 상품별 입고수량의 합계 값
SELECT BUY_PROD AS "상품", SUM(BUY_QTY) AS "입고수량합계" FROM BUYPROD GROUP BY BUY_PROD;
-- 회원테이블의 회원전체의 마일리지 평균, 마일리지 합계, 최고 마일리지, 최소 마일리지 인원수를 검색하시오?
-- (Alias는 마일리지 평균, 마일리지 합계, 최고마일리지, 최소마일리지, 인원수)
SELECT ROUND(AVG(MEM_MILEAGE),2) AS "마일리지 평균",
       SUM(MEM_MILEAGE) AS "마일리지 합계",
       MAX(MEM_MILEAGE) AS "최고 마일리지",
       MIN(MEM_MILEAGE) AS "최소 마일리지",
       COUNT(DISTINCT MEM_ID) AS "인원수"
       FROM MEMBER;
       
-- 상품테이블에서 거래처, 상품분류별로 최고판매가, 최소판매가, 자료수를 검색하시오
SELECT * FROM PROD;
SELECT PROD_BUYER AS "거래처", PROD_LGU AS "상품분류", MAX(PROD_SALE) AS "최고판매가", MIN(PROD_SALE) AS "최소판매가", COUNT(PROD_SALE) FROM PROD GROUP BY PROD_BUYER, PROD_LGU;
-- 장바구니 테이블에서 회원, 상품분류별로 구매수량평균, 구매수량합계, 자료수를 검색하시오 (Alias는 회원ID, 상품분류, 구매수량 평균, 구매수량합계, 자료수)
-- 회원ID, 상품분류 순으로 SORT하시오
SELECT * FROM CART;
SELECT CART_MEMBER AS "회원ID", SUBSTR(CART_PROD,1,4) AS "상품분류", ROUND(AVG(CART_QTY),2) AS "구매수량평균", SUM(CART_QTY) AS "구매수량합계", COUNT(CART_QTY) AS "자료수" FROM CART GROUP BY CART_MEMBER, CART_PROD ORDER BY CART_MEMBER, CART_PROD;
-- 회원테이블에서 지역(주소1의2자리),생일년도별로 마일리지평균, 마일리지 합계, 최고마일리지, 최소마일리지, 자료수를 검색하시오
-- (Alias는 지역,생일연도,마일리지평균,마일리지합계,최고마일리지,최소마일리지,자료수)
SELECT * FROM MEMBER;
SELECT SUBSTR(MEM_ADD1,1,2) AS "지역", AVG(MEM_MILEAGE) AS "마일리지평균", SUM(MEM_MILEAGE) AS "마일리지합계", MAX(MEM_MILEAGE) AS "최고마일리지", MIN(MEM_MILEAGE) AS "최소마일리지", COUNT(MEM_MILEAGE) AS "자료수" FROM MEMBER GROUP BY SUBSTR(MEM_BIR,1,2), SUBSTR(MEM_ADD1,1,2) ORDER BY SUBSTR(MEM_ADD1,1,2);

-- ROLLUP
SELECT PROD_LGU,
       PROD_BUYER,
       COUNT(*),
       SUM(PROD_COST)
       FROM PROD
       GROUP BY PROD_LGU, ROLLUP(PROD_BUYER);

-- CUBE: ROLLUP함수와 같이 각 소계도 출력하고 전체 총계까지 출력
SELECT PROD_LGU,
       PROD_BUYER,
       COUNT(*),
       SUM(PROD_COST)
       FROM PROD
       GROUP BY CUBE(PROD_LGU, PROD_BUYER);

-- NULL
SELECT BUYER_NAME as "거래처",
       BUYER_CHARGER AS "담당자"
       FROM BUYER
       WHERE BUYER_CHARGER=NULL;
-- 회원 마일리지에 100을 더한 수치를 검색하시오 (NVL 사용, Alias는 성명,마일리지,변경마일리지)
SELECT MEM_NAME AS "성명", NVL(MEM_MILEAGE,0) AS "마일리지", NVL(MEM_MILEAGE,0)+100 AS "변경마일리지" FROM MEMBER;
-- 회원 마일리지가 있으면 "정상회원", Null이면 '비정상회원'으로 검색하시오?
UPDATE MEMBER SET MEM_MILEAGE=NULL WHERE MEM_NAME='정은실';
SELECT MEM_NAME AS "성명", MEM_MILEAGE AS "마일리지", NVL2(MEM_MILEAGE,'정상 회원', '비정상 회원') AS 회원상태 FROM MEMBER;

-- NULLIF(A,B): A,B를 비교해서 같으면 NULL 반환, 다르면 A반환
SELECT NULLIF(123,123) RESULT1,
       NULLIF(123,1234) RESULT2,
       NULLIF('A','B') RESULT4
       FROM DUAL;
-- 순서대로 조회해서 가장 먼저 NULL이 아닌값을 출력한다.
SELECT COALESCE(NULL,NULL,'Hello',Null,'World') FROM DUAL;

-- DECODE: IF문과 같은 기능을 함
SELECT DECODE(9,10,'A',9,'B',8,'C','D') FROM DUAL;
SELECT DECODE(SUBSTR(PROD_LGU,1,2),
       'P1', '컴퓨터/전자제품',
       'P2', '의류',
       'P3', '잡화', '기타')
       FROM PROD;

-- 상품 분류 중 앞의 글자가 'P1'이면 판매가를 10%인상하고 'P2'이면 판매가를 15%인상하고, 나머지는 동일 판매가로 검색하시오
-- (DECODE 함수 사용, Alias는 상품명,판매가,변경판매가)
SELECT PROD_NAME AS "상품명", PROD_SALE AS "판매가", DECODE(SUBSTR(PROD_LGU,1,2),'P1',PROD_SALE + (PROD_SALE * 0.1),'P2',PROD_SALE + (PROD_SALE * 0.15), PROD_SALE) AS "변경판매가" FROM PROD;
-- CASE WHEN TEHN ELSE
SELECT CASE WHEN '나'='나' THEN '맞다' ELSE '아니다' END AS RESULT1 FROM DUAL;
SELECT CASE '나' WHEN '철호' THEN '아니다' WHEN '너' THEN '아니다' WHEN '나' THEN '맞다' ELSE '모르겠다' END RESULT FROM DUAL;

SELECT PROD_NAME 상품, PROD_LGU 분류,
    CASE PROD_LGU 
    WHEN 'P101' THEN '컴퓨터제품'                    
    WHEN 'P102' THEN '전자제품'
    WHEN 'P201' THEN '여성캐쥬얼'
    WHEN 'P202' THEN '남성캐쥬얼'
    WHEN 'P301' THEN '피혁잡화'
    WHEN 'P302' THEN '화장품'
    WHEN 'P401' THEN '음반/CD'
    WHEN 'P402' THEN '도서'
    WHEN 'P403' THEN '문구류'
    ELSE '미등록분류'
    END "상품 분류"
    FROM PROD;

-- 회원정보테이블의 주민등록 뒷자리(7자리중 첫째자리)에서 성별구분을 검색하시오?
-- CASE 구문 사용, Alias는 회원명,주민등록번호(주민1-주민2), 성별)
SELECT MEM_NAME AS "회원명", MEM_REGNO1 || '-' || MEM_REGNO2 AS "주민번호(주민1-주민2)", 
    CASE SUBSTR(MEM_REGNO2,1,1) 
    WHEN '1' THEN '남' 
    WHEN '3' THEN '남' 
    WHEN '2' THEN '여' 
    WHEN '4' THEN '여' 
    END "성별" 
    FROM MEMBER;
    
SELECT MEM_NAME AS "회원명", MEM_REGNO1 || '-' || MEM_REGNO2 AS "주민번호(주민1-주민2)", 
    CASE SUBSTR(MEM_REGNO2,1,1) 
    WHEN '1' THEN '남' 
    WHEN '3' THEN '남' 
    ELSE '여'
    END "성별" 
    FROM MEMBER;

SELECT MEM_NAME AS "회원명", MEM_REGNO1 || '-' || MEM_REGNO2 AS "주민번호(주민1-주민2)", 
    CASE 
    WHEN SUBSTR(MEM_REGNO2,1,1)='1' OR SUBSTR(MEM_REGNO2,1,1)='3' THEN '남' 
    WHEN SUBSTR(MEM_REGNO2,1,1)='2' OR SUBSTR(MEM_REGNO2,1,1)='4' THEN '여' 
    END "성별" 
    FROM MEMBER;
    
-- 230302
-- REGEXP_LIKE
SELECT MEM_ID AS "회원ID",
       MEM_NAME AS "회원명"
       FROM MEMBER
       WHERE REGEXP_LIKE(MEM_NAME, '^김(성|형)');
SELECT PROD_ID AS "상품ID",
       PROD_NAME AS "상품명"
       FROM PROD
       WHERE REGEXP_LIKE(PROD_NAME, '^삼성.*\d\d');
-- REGEXP_SUBSTR
SELECT REGEXP_SUBSTR('JavaFlexOracle','[^ ]+') FROM DUAL;
SELECT REGEXP_SUBSTR('JavaFlexOracle','[^ ]+',1,3) FROM DUAL;
-- 회원테이블에서 이메일주소를 근거로 이메일아이디, 이메일서버로 구분하여 검색하시오?
-- Alias는 회원이름, 이메일, 이메일아이디, 이메일서버
SELECT MEM_NAME AS "회원이름",
       MEM_MAIL AS "이메일",
       REGEXP_SUBSTR(MEM_MAIL,'[^@]+') AS "이메일아이디",
       REGEXP_SUBSTR(MEM_MAIL,'[^@]+',1,2) AS "이메일서버"
       FROM MEMBER;
-- REGEXP_REPLACE
SELECT REGEXP_REPLACE('JavaFlexOracle','[^ ]+','C++') FROM DUAL;
SELECT REGEXP_REPLACE('JavaFlexOracle','[^ ]+','C++',1,2) FROM DUAL;
-- REGEXP_INSTR
SELECT REGEXP_INSTR('JAVAFlexOracle','[ae]',1,1,0,'i') RESULT FROM DUAL;
--TABLE JOIN
SELECT * FROM LPROD,PROD;
SELECT COUNT(*) FROM LPROD,PROD,BUYER;
SELECT * FROM LPROD CROSS JOIN PROD;
SELECT COUNT(*) FROM LPROD CROSS JOIN PROD CROSS JOIN BUYER;
-- EQUI JOIN
-- 상품테이블에서 상품코드,상품명,분류명을 조회
-- 상품테이블: PROD, 분류테이블: LPROD
SELECT PROD.PROD_ID AS "상품코드",
       PROD.PROD_NAME AS "상품명",
       LPROD.LPROD_NM AS "분류명"
       FROM PROD, LPROD
       WHERE PROD.PROD_LGU=LPROD.LPROD_GU;
SELECT PROD.PROD_ID AS "상품코드",
       PROD.PROD_NAME AS "상품명",
       LPROD.LPROD_NM AS "분류명"
       FROM PROD INNER JOIN LPROD
       ON (PROD.PROD_LGU=LPROD.LPROD_GU);
-- 상품테이블에서 거래처가 '삼성전자'인 자료의 상품코드,상품명,거래처 명을 조회
SELECT PROD_ID AS "상품코드",
       PROD_NAME AS "상품명",
       BUYER_NAME AS "거래처명"
       FROM PROD, BUYER
       WHERE PROD_BUYER=BUYER_ID
       AND BUYER_NAME LIKE '삼성전자%';
-- 상품테이블에서 상품코드,상품명,분류명,거래처명,거래처주소를 조회
-- 1)판매가격이10만원이하이고 2)거래처주소가 부산인 경우만 조회
SELECT A.PROD_ID AS "상품코드",
       A.PROD_NAME AS "상품명",
       B.LPROD_NM AS "분류명",
       C.BUYER_NAME AS "거래처명",
       C.BUYER_ADD1 AS "주소"
       FROM PROD A, LPROD B, BUYER C
       WHERE A.PROD_SALE <= 100000
       AND   A.PROD_LGU = B.LPROD_GU
       AND   A.PROD_BUYER = C.BUYER_ID
       AND   C.BUYER_ADD1 LIKE '%부산%';
-- 장바구니테이블의 2020년도 5월의 회원별 구매금액을 검색하시오?
-- 구매금액 = 구매수량 * 판매가
-- Alias는 회원ID,회원명,구매금액
SELECT * FROM CART;
SELECT * FROM PROD;
SELECT C.CART_MEMBER AS "회원ID", (C.CART_QTY * P.PROD_SALE) AS "구매금액"  FROM CART C INNER JOIN PROD P ON C.CART_PROD=P.PROD_ID;
SELECT 회원ID, SUM(구매금액) AS "구매금액" FROM (SELECT C.CART_MEMBER AS "회원ID", (C.CART_QTY * P.PROD_SALE) AS "구매금액"  FROM CART C INNER JOIN PROD P ON C.CART_PROD=P.PROD_ID) GROUP BY 회원ID;

SELECT MEMBER.MEM_ID AS "회원id",
       MEMBER.MEM_NAME AS "회원NAME",
       SUM(PROD.PROD_SALE*CART.CART_QTY) AS "구매금액"
       FROM CART, MEMBER, PROD
       WHERE CART.CART_MEMBER=MEMBER.MEM_ID
       AND   CART.CART_PROD=PROD.PROD_ID
       AND   SUBSTR(CART.CART_NO,0,6)='202005'
       GROUP BY MEMBER.MEM_ID, MEMBER.MEM_NAME;

-- OUTER JOIN
-- 분류테이블 조회
SELECT * FROM LPROD;
-- 일반 JOIN
SELECT LPROD_GU AS "분류코드",
       LPROD_NM AS "분류명",
       COUNT(PROD_LGU) AS "상품자료수"
       FROM LPROD,PROD
       WHERE LPROD_GU=PROD_LGU
       GROUP BY LPROD_GU,LPROD_NM;
-- OUTER JOIN 사용 확인
SELECT LPROD_GU AS "분류코드",
       LPROD_NM AS "분류명",
       COUNT(PROD_LGU) AS "상품자료수"
       FROM LPROD,PROD
       WHERE LPROD_GU=PROD_LGU
       GROUP BY LPROD_GU,LPROD_NM;
-- ANSI OUTER JOIN 사용 확인
SELECT LPROD_GU AS "분류코드",
       LPROD_NM AS "분류명",
       COUNT(PROD_LGU) AS "상품자료수"
       FROM LPROD
       LEFT OUTER JOIN PROD ON (LPROD_GU=PROD_LGU)
       GROUP BY LPROD_GU,LPROD_NM
       ORDER BY LPROD_GU;
-- 전체 상품의 2020년도 5월 5일의 입고,출고현황 조회
-- 상품코드, 상품명, 입고수량의 합, 판매수량의 합
-- 입고 확인
SELECT PROD.PROD_ID AS "상품코드",
       PROD.PROD_NAME AS "상품",
       SUM(BUYPROD.BUY_QTY) AS "입고수량"
       FROM PROD,BUYPROD
       WHERE PROD.PROD_ID=BUYPROD.BUY_PROD
       AND   BUYPROD.BUY_DATE='20200505'
       GROUP BY PROD.PROD_ID,PROD.PROD_NAME;
-- 판매 확인
SELECT PROD.PROD_ID AS "상품코드",
       PROD.PROD_NAME AS "상품",
       SUM(CART.CART_QTY) AS "판매수량"
       FROM PROD
       INNER JOIN CART
       ON (PROD.PROD_ID=CART.CART_PROD)
       WHERE CART.CART_NO LIKE '20200505%'
       GROUP BY PROD.PROD_ID,PROD.PROD_NAME;

SELECT PROD.PROD_ID AS "상품코드",
       PROD.PROD_NAME AS "상품",
       SUM(NVL(BUYPROD.BUY_QTY,0)) AS "입고수량",
       SUM(NVL(CART.CART_QTY,0)) AS "판매수량"
       FROM PROD,BUYPROD,CART
       WHERE PROD.PROD_ID=BUYPROD.BUY_PROD
       AND PROD.PROD_ID=CART.CART_PROD
       AND BUYPROD.BUY_DATE='20200505'
       AND SUBSTR(CART.CART_NO,1,8)='20200505'
       GROUP BY PROD.PROD_ID,PROD.PROD_NAME;

SELECT * FROM PROD;
SELECT * FROM BUYPROD;
SELECT * FROM CART;
SELECT * FROM BUYER;

-- SELF JOIN
SELECT B.MEM_ID AS "회원ID", B.MEM_NAME AS "성명", B.MEM_MILEAGE AS "마일리지"
       FROM MEMBER A, MEMBER B
       WHERE A.MEM_ID='h001'
       AND A.MEM_MILEAGE<=B.MEM_MILEAGE;
-- 거래처코드가'P30203(참존)'과 동일지역에 속한 거래처만 검색 조회
-- Alias는 거래처코드,거래처,주소
SELECT B.BUYER_ID AS "거래처코드", B.BUYER_NAME AS "거래처명", B.BUYER_ADD1||' '||B.BUYER_ADD2 AS "주소"
       FROM BUYER A, BUYER B
       WHERE A.BUYER_ID='P30203'
       AND SUBSTR(A.BUYER_ADD1,1,2)=SUBSTR(B.BUYER_ADD1,1,2);

SELECT * FROM BUYER;

-- 230303
-- REGEXP_LIKE
SELECT MEM_ID AS "회원ID", MEM_NAME AS "회원명" FROM MEMBER WHERE REGEXP_LIKE(MEM_NAME, '^김(성|형)');
SELECT PROD_ID AS "상품ID", PROD_NAME AS "상품명" FROM PROD WHERE REGEXP_LIKE(PROD_NAME, '^삼성.*\d\d');
-- REGEXP_SUBSTR
SELECT REGEXP_SUBSTR('Java Flex Oracle','[^ ]+') FROM DUAL;
SELECT REGEXP_SUBSTR('Java Flex Oracle','[^ ]+',7,1) FROM DUAL;
-- REGEXP_REPLACE
SELECT REGEXP_REPLACE('Java Flex Oracle','[^ ]+','C++') FROM DUAL;
SELECT REGEXP_REPLACE('Java Flex Oracle','[^ ]+','C++',1,2) FROM DUAL;
-- 회원테이블에서 주민번호1 컬럼을 기준으로 xx월 xx일 형식으로 조회하시오.(회원명, 주민번호1, 생일)
--SELECT MEM_NAME, MEM_REGNO FROM MEMBER;

-- JOIN GROUP BY: 주로 통계, 분석자료를 검색하기 위해 자주 활용
-- 회원ID가 r001인 고객의 2020년도 월별 구매현황 조회
SELECT MEMBER.MEM_ID AS "회원ID",
       MEMBER.MEM_NAME AS "성명",
       MEMBER.MEM_REGNO1 || '-' || MEMBER.MEM_REGNO2 AS "주민등록번호",
       SUBSTR(CART.CART_NO,1,6) AS "구매월",
       SUM(CART.CART_QTY * PROD.PROD_SALE) AS "구매총액"
       FROM MEMBER, CART, PROD
       WHERE MEMBER.MEM_ID='r001'
       AND MEMBER.MEM_ID=CART.CART_MEMBER
       AND CART.CART_NO LIKE '2020%'
       AND CART.CART_PROD=PROD.PROD_ID
       GROUP BY MEMBER.MEM_ID,MEMBER.MEM_NAME,MEMBER.MEM_REGNO1||'-'||MEMBER.MEM_REGNO2,SUBSTR(CART.CART_NO,1,6);

SELECT * FROM COLS WHERE TABLE_NAME = 'ZIPTB';

-- 거래처의 2020년도 1월의 거래처별 일자별 매입현황 조회
-- (거래처명, 매입일자, 매입금액)
SELECT * FROM BUYER;
SELECT * FROM BUYPROD WHERE TO_CHAR(BUY_DATE) LIKE '2020-01%';

SELECT BUYER.BUYER_NAME AS "거래처명",
       BUYPROD.BUY_DATE AS "매입일자",
       SUM(BUYPROD.BUY_QTY * BUYPROD.BUY_COST) AS "매입금액"
       FROM BUYPROD, BUYER, PROD
       WHERE BUYPROD.BUY_DATE BETWEEN '2020-01-01' AND '2020-01-31'
       AND   BUYPROD.BUY_PROD=PROD.PROD_ID
       AND   PROD.PROD_BUYER=BUYER.BUYER_ID
       GROUP BY BUYER.BUYER_NAME, BUYPROD.BUY_DATE;
       
-- 2020년도 판매된 상품 중에 5회 이상의 판매횟수가 있는 상품조회 (상품코드,상품명,판매횟수)
SELECT PROD.PROD_ID 상품코드,
       PROD.PROD_NAME 상품명,
       COUNT(*) 판매횟수
       FROM PROD, CART
       WHERE PROD.PROD_ID=CART.CART_PROD
       AND   SUBSTR(CART.CART_NO,1,4)='2020'
       GROUP BY PROD.PROD_ID,
                PROD.PROD_NAME
                HAVING COUNT(*) >= 5;

-- 상품분류가 컴퓨터제품('P101')인 상품의 2020년도 일자별 판매조회 (판매일, 판매금액,(5,000,000초과의 경우만), 판매수량)
SELECT * FROM CART;
SELECT SUBSTR(CART.CART_NO,1,8) AS "판매일",
       TO_CHAR(SUM(CART.CART_QTY * PROD.PROD_SALE),'L999,999,999') AS "판매금액",
       SUM(CART.CART_QTY) AS "판매수량"
       FROM PROD, CART
       WHERE CART.CART_NO LIKE '2020%'
       AND PROD.PROD_ID=CART.CART_PROD
       AND PROD.PROD_LGU='P101'
       GROUP BY SUBSTR(CART.CART_NO,1,8)
       HAVING SUM(CART.CART_QTY * PROD.PROD_SALE) > 5000000
       ORDER BY SUBSTR(CART.CART_NO,1,8);

-- 2020년도 판매일자, 판매총액(5,000,000초과의 경우만), 판매수량(50초과의 경우만), 판매횟수를 조회하시오.
-- 단, 판매횟수가 8개 이상인 판매일자만 조회
SELECT SUBSTR(CART.CART_NO,1,8) AS "판매일",
       SUM(CART.CART_QTY * PROD.PROD_SALE) AS "판매금액",
       SUM(CART.CART_QTY) AS "판매수량",
       COUNT(*)
       FROM PROD INNER JOIN CART
       ON (PROD.PROD_ID=CART.CART_PROD)
       WHERE CART.CART_NO LIKE '2020%'
       GROUP BY SUBSTR(CART.CART_NO,1,8)
       HAVING SUM(CART.CART_QTY * PROD.PROD_SALE) > 5000000
       AND SUM(CART.CART_QTY) > 50
       AND COUNT(*) >= 8
       ORDER BY SUBSTR(CART.CART_NO,1,8);

-- 230306
-- SELF JOIN
SELECT B.MEM_ID AS "회원ID", B.MEM_NAME AS "성명", B.MEM_MILEAGE AS "마일리지" FROM MEMBER A, MEMBER B WHERE A.MEM_ID='h001' AND A.MEM_MILEAGE <= B.MEM_MILEAGE;
-- 서브쿼리
-- 단일행 서브쿼리: 오직 한개의 행(값)을 반환
SELECT JOB FROM EMP WHERE EMPNO=7369;
SELECT ENAME, JOB FROM EMP WHERE JOB='프로그래머';
SELECT ENAME, JOB FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE EMPNO = 7369);
-- 다중행 서브쿼리: 하나 이상의 행을 RETURN하는 SUBQUERY를 다중 행 SUBQUERY라고 한다.
-- 부서별로 가장 급여를 많이 받는 사원의 정보를 출력
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT ENAME, SAL FROM EMP WHERE DEPTNO != 20 AND SAL > ANY(SELECT SAL FROM EMP WHERE JOB='프로그래머');
SELECT DEPTNO AS "부서번호", MAX(SAL) AS "최고급여" FROM EMP GROUP BY (DEPTNO);
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP A, (SELECT DEPTNO AS "부서번호", MAX(SAL) AS "최고급여" FROM EMP GROUP BY (DEPTNO)) B WHERE A.DEPTNO=B.부서번호 AND A.SAL >= B.최고급여;
-- ALL: 서브쿼리의 결과값중 모든 결과 값이 만족 되야만 결과값을 반환한다.
SELECT ENAME, SAL FROM EMP WHERE DEPTNO != 20 AND SAL > ALL(SELECT SAL FROM EMP WHERE JOB='프로그래머');
-- EXISTS: 서브쿼리의 데이터가 존재하는 가의 여부를 먼저 따져 존재하는 값들만을 결과로 반환
SELECT EMPNO, ENAME, SAL FROM EMP E WHERE EXISTS (SELECT EMPNO FROM EMP WHERE E.EMPNO=MGR);

SELECT EMPNO,ENAME,SAL
FROM EMP e
WHERE EXISTS 
(SELECT EMPNO FROM EMP WHERE e.ENAME=MGR);

-- 다중열 서브쿼리: 서브쿼리의 결과값이 두개 이상의 컬럼을 반환하는 서브쿼리
SELECT EMPNO, SAL, DEPTNO FROM EMP 
WHERE (SAL, DEPTNO) IN (SELECT SAL, DEPTNO FROM EMP WHERE DEPTNO=30 AND COMM IS NOT NULL);

SELECT EMPNO, SAL, DEPTNO FROM EMP
WHERE SAL IN (SELECT SAL FROM EMP WHERE DEPTNO=30 AND COMM IS NOT NULL)
AND DEPTNO IN (SELECT DEPTNO FROM EMP WHERE DEPTNO=30 AND COMM IS NOT NULL);

-- 동시 조건 쿼리
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);
-- 따로 따로 조건 쿼리
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP 
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP GROUP BY DEPTNO)
AND SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- FROM절상의 서브쿼리(INLINE VIEW)와 상관관계 서브쿼리
-- FROM절상에 오는 서브쿼리로 VIEW처럼 작용합니다.
SELECT B.EMPNO, B.ENAME, B.JOB, B.SAL, B.DEPTNO 
FROM (SELECT EMPNO FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 20)) A, EMP B
WHERE A.EMPNO = B.EMPNO 
AND B.MGR IS NOT NULL
AND B.DEPTNO != 20;
-- 사원을 관리할 수 있는 사원의 평균급여보다 급여를 많이 받는 사원의 정보를 출력
SELECT EMPNO, ENAME, SAL FROM EMP E WHERE SAL > (SELECT AVG(SAL) SAL FROM EMP WHERE E.EMPNO=MGR);

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO 
FROM EMP 
WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=20)
AND DEPTNO != 20
AND EMPNO IN (SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL);

-- 집합쿼리 (UNION, INTERSECT, MINUS)
-- 집합 연산자를 사용시 집합을 구성할 컬러의 데이터 타입이 동일해야 합니다.
-- UNION: 두 테이블의 결합을 나타내며, 결합시키는 두 테이블의 중복되지 않은 값들을 반환합니다.
SELECT DEPTNO FROM EMP UNION SELECT DEPTNO FROM DEPT;
-- UNION ALL: 중복되는 값까지 반환
SELECT DEPTNO FROM EMP UNION ALL SELECT DEPTNO FROM DEPT;
-- INTERSECT: 두 행의 집합중 공통된 행을 반환합니다.
SELECT DEPTNO FROM EMP INTERSECT SELECT DEPTNO FROM DEPT;
-- MINUS: 두번째 SELECT문에 의해 반환되는 행에 존재하지 않는 행들을 보여준다.
SELECT DEPTNO FROM DEPT MINUS SELECT DEPTNO FROM EMP;
-- SET(집합)
SELECT MEMBER.MEM_NAME, MEMBER.MEM_JOB, MEMBER.MEM_MILEAGE
FROM MEMBER
WHERE MEMBER.MEM_MILEAGE > 4000;

SELECT MEMBER.MEM_NAME, MEMBER.MEM_JOB, MEMBER.MEM_MILEAGE
FROM MEMBER
WHERE MEMBER.MEM_JOB='자영업';
-- UNION
SELECT MEMBER.MEM_NAME, MEMBER.MEM_JOB, MEMBER.MEM_MILEAGE
FROM MEMBER
WHERE MEMBER.MEM_MILEAGE > 4000
UNION
SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
FROM MEMBER
WHERE MEM_JOB='자영업';
-- INTERSECT
SELECT MEMBER.MEM_NAME, MEMBER.MEM_JOB, MEMBER.MEM_MILEAGE
FROM MEMBER
WHERE MEMBER.MEM_MILEAGE > 4000
INTERSECT
SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
FROM MEMBER
WHERE MEM_JOB='자영업';
-- UNION ALL
SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
FROM MEMBER
WHERE MEM_MILEAGE > 4000
UNION ALL
SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
FROM MEMBER
WHERE MEM_JOB='자영업'
ORDER BY MEM_NAME ASC;
-- MINUS
SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
FROM MEMBER
WHERE MEM_MILEAGE > 4000
MINUS
SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
FROM MEMBER
WHERE MEM_JOB='자영업'
ORDER BY MEM_NAME ASC;

-- EXISTS연산자를 통하여 SET연산자의 INTERSECT, MINUS 구현함
-- 장바구니 테이블에서
-- 2020년도 4월에 판매된 상품
SELECT DISTINCT C.CART_PROD AS "판매상품", P.PROD_NAME AS "상품명"
FROM CART C, PROD P
WHERE C.CART_PROD = P.PROD_ID
AND SUBSTR(C.CART_NO,1,8) BETWEEN '20200401' AND '20200430';

-- 2020년 6월에 판매된 상품
SELECT DISTINCT C.CART_PROD AS "판매상품", P.PROD_NAME AS "상품명"
FROM CART C, PROD P
WHERE C.CART_PROD = P.PROD_ID
AND C.CART_NO LIKE '202006';

-- A,B 모두에 해당되는 상품 (EXISTS를 이용하여 INTERSECT구현)
SELECT DISTINCT C.CART_PROD AS "판매상품", P.PROD_NAME AS "상품명"
FROM CART C, PROD P
WHERE C.CART_PROD = P.PROD_ID
AND SUBSTR(C.CART_NO,1,8) BETWEEN '20200401' AND '20200430'
AND EXISTS 
    (SELECT DISTINCT CART_PROD
    FROM CART
    WHERE CART.CART_PROD = C.CART_PROD
    AND CART.CART_NO LIKE '202006%');

-- A - B (EXISTS를 이용하여 MINUS구현)
SELECT DISTINCT C.CART_PROD AS "판매상품", P.PROD_NAME AS "상품명"
FROM CART C, PROD P
WHERE C.CART_PROD = P.PROD_ID
AND SUBSTR(C.CART_NO,1,8) BETWEEN '20200401' AND '20200430'
AND NOT EXISTS 
    (SELECT DISTINCT CART_PROD
    FROM CART
    WHERE CART.CART_PROD = C.CART_PROD
    AND CART.CART_NO LIKE '202006%');

-- B에는 있고 A에는 없는 상품을 조회 (EXOST를 이용 MINUS 구현)
SELECT DISTINCT C.CART_PROD 판매상품, P.PROD_NAME 상품명
FROM CART C, PROD P
WHERE C.CART_PROD=P.PROD_ID
AND C.CART_NO LIKE '202006%'
AND NOT EXISTS 
    (SELECT DISTINCT CART_PROD
    FROM CART
    WHERE CART.CART_PROD=C.CART_PROD
    AND SUBSTR(CART.CART_NO,1,6)='202004');

-- 230307
-- 2020년도 구매금액 2천만 이상 우수고객으로 지정하여 검색하시오 ?
-- (Alias는 회원ID, 회원명, '우수고객’)
SELECT MEM_ID AS "회원ID", MEM_NAME AS "회원명", SUM(CART_QTY * PROD_SALE) AS "2020년도 구매금액", '우수고객'
FROM CART, MEMBER, PROD 
WHERE CART_MEMBER = MEM_ID
AND   CART_PROD = PROD_ID
AND   CART_NO LIKE '2020%'
GROUP BY MEM_ID, MEM_NAME
HAVING SUM(CART_QTY * PROD_SALE) > 20000000
ORDER BY "2020년도 구매금액" DESC;

SELECT MEM_ID
     , MEM_NAME
     , '우수고객'
FROM   MEMBER 
WHERE  EXISTS 
(
       SELECT SUM(CART.CART_QTY * PROD.PROD_SALE)
       FROM   CART, PROD
       WHERE  CART.CART_PROD   = PROD.PROD_ID 
       AND    CART.CART_MEMBER = MEMBER.MEM_ID
       AND    CART.CART_NO like '2020%'
       HAVING SUM(CART.CART_QTY * PROD.PROD_SALE) 
		> 20000000 
);

SELECT   TBL1.MEM_ID
     ,   TBL1.MEM_NAME
     ,   TBL1.RESULT
     ,   '우수고객'
FROM
(
    SELECT   MEMBER.MEM_ID
         ,   MEMBER.MEM_NAME
         ,   sum(CART.CART_QTY * PROD.PROD_SALE) AS RESULT 
    FROM     CART, PROD, MEMBER
    WHERE    CART.CART_MEMBER = MEMBER.MEM_ID
    AND      CART.CART_PROD = PROD.PROD_ID
    AND      CART.cart_no like '2020%'
    --AND      RESULT > 20000000
    GROUP BY MEMBER.MEM_ID, MEMBER.MEM_NAME
    ORDER BY RESULT DESC
) TBL1
WHERE TBL1.RESULT > 20000000;

CREATE TABLE REMAIN
(
    REMAIN_YEAR CHAR(04) NOT NULL,      -- 해당 년도
    REMAIN_PROD VARCHAR2(10) NOT NULL,  -- 상품 코드
    REMAIN_J_00 NUMBER(5),              -- 전년 재고
    REMAIN_I    NUMBER(5),              -- 입고
    REMAIN_O    NUMBER(5),              -- 출고
    REMAIN_J_99 NUMBER(5),              -- 현재고
    REMAIN_DATE DATE,                   -- 처리일자
    CONSTRAINT PK_REMAIN PRIMARY KEY(REMAIN_YEAR, REMAIN_PROD),
    CONSTRAINT FR_REMAIN_PROD FOREIGN KEY(REMAIN_PROD)
                              REFERENCES PROD(PROD_ID)
);

INSERT INTO REMAIN
        VALUES('2003','P101000001',20,10,12,18,'2004-01-01');
INSERT INTO remain(remain_year,remain_prod,remain_j_00,remain_i,remain_o,remain_j_99,remain_date)
VALUES ('2003','P101000002',11,7,6,12,'2004-01-02');

INSERT INTO REMAIN(REMAIN_YEAR,REMAIN_PROD,REMAIN_I)
        VALUES('2003','P102000007',10);

INSERT INTO REMAIN(REMAIN_YEAR, REMAIN_PROD, remain_j_00,REMAIN_I, REMAIN_J_99, REMAIN_DATE)
VALUES('2003', 'P102000001', 31, 21, 41, '2003-12-31');

INSERT INTO REMAIN(REMAIN_YEAR,REMAIN_PROD,remain_j_00,REMAIN_I,remain_o,REMAIN_J_99,REMAIN_DATE)
VALUES('2003', 'P102000002', 31, 21, NULL, 41, '2003-12-31');

INSERT INTO REMAIN(REMAIN_YEAR,REMAIN_PROD,remain_j_00,REMAIN_I,remain_o,REMAIN_J_99,REMAIN_DATE)
VALUES('2003', 'P102000003', 31, 21, 11, 41, SYSDATE);

INSERT INTO remain (remain_year, remain_prod, remain_j_00,remain_i, remain_o, remain_j_99, remain_date)
SELECT '2004', PROD_ID, TO_NUMBER(SUBSTR(PROD_ID,-2)),10,7,TO_NUMBER(SUBSTR(PROD_ID,-2))+10-7,SYSDATE FROM   PROD;

SELECT * FROM REMAIN;

-- 2004년도 재고수불 마감 작업을 수행하시오?
-- 모든 상품에 대한 재고 수불 파일 생성
-- 해당년도: 2020년
-- 상품코드: 2004년도 수불 상품
-- 전년재고: 2004년도 말의 현재고
-- 현재고: 2004년도 말의 현재고

SELECT REMAIN_YEAR AS "수불년도",
       REMAIN_PROD AS "상품코드",
       REMAIN_J_99 AS "현재고"
       FROM REMAIN
       WHERE REMAIN_YEAR='2004';

-- 회원테이블에서 모든 회원의 마일리지 Column값을 10% 인상되게 수정하시오
SELECT MEM_MILEAGE, MEM_MILEAGE * 1.1 FROM MEMBER;
UPDATE MEMBER SET MEM_MILEAGE = MEM_MILEAGE * 1.1;

SELECT * FROM MEMBER;

-- 재고수불 테이블에서 해당년도가 '2003'년이고, 상품분류가 'P102'이면서
-- 전년재고가 NULL인 상품의 수량을 0으로 수정하시오
SELECT REMAIN_YEAR AS "해당연도",
       REMAIN_PROD AS "상품분류",
       REMAIN_J_00 AS "전년재고"
       FROM REMAIN
       WHERE REMAIN_YEAR='2003'
       AND REMAIN_PROD LIKE 'P102%'
       AND REMAIN_J_00 IS NULL;
       
-- 2020년도 판매금액이 8천만 이상인 거래처의 담당자 컬럼에 '우수거래처'로 갱신
SELECT BUYER_ID AS "거래처코드",
       BUYER_NAME AS "거래처명",
       BUYER_CHARGER AS "담당자",
       '우수거래처' AS "우수거래처"
       FROM BUYER
       WHERE EXISTS (SELECT SUM(CART.CART_QTY * PROD.PROD_SALE)
                    FROM PROD, CART
                    WHERE CART.CART_NO LIKE '2020%'
                    AND   CART.CART_PROD = PROD.PROD_ID
                    AND   PROD.PROD_BUYER = BUYER.BUYER_ID
                    HAVING SUM(CART.CART_QTY * PROD.PROD_SALE) > 80000000);

-- 상품 모두의 2020년도 입고수량을 합산하여 상품테이블의 총 입고수량 Column 갱신
-- 1. 상품테이블의 총 입고수량 조회
SELECT PROD_ID AS "상품코드",
       SUM(NVL(PROD_QTYIN,0)) AS "총입고수량"
       FROM PROD
       GROUP BY PROD_ID;
-- 2. 모든 상품의 2020년도 상품별 입고수량 합산하여 조회
SELECT PROD.PROD_ID AS "상품코드",
       SUM(NVL(BUYPROD.BUY_QTY,0)) AS "매입수량"
       FROM PROD LEFT OUTER JOIN BUYPROD
       ON (PROD.PROD_ID=BUYPROD.BUY_PROD
       AND BUYPROD.BUY_DATE BETWEEN '2020-01-01' AND '2020-12-31')
       GROUP BY PROD.PROD_ID;

-- 재고 수불 테이블을 복사하여 remain2 테이블을 생성하시오
CREATE TABLE REMAIN2 AS SELECT * FROM REMAIN;
SELECT * FROM REMAIN2;

DELETE FROM REMAIN2;
SELECT * FROM REMAIN2;
ROLLBACK;
SELECT * FROM REMAIN2;
TRUNCATE TABLE REMAIN2;

DROP TABLE REMAIN2;

-- 장바구니 2020년도 5월 자료 중 회원ID='p001'(오성순)인 자료 조회
SELECT MEM_ID, MEM_NAME, CART_NO, CART_PROD, CART_MEMBER, CART_QTY 
FROM MEMBER, CART
WHERE MEM_ID = 'p001'
AND CART_NO LIKE '202005%'
AND CART_MEMBER = MEM_ID;

-- 상기 자료 중 상품 = 'P202000013'인 자료 삭제 (EXISTS문 사용)
DELETE FROM CART
WHERE EXISTS (SELECT MEMBER.MEM_ID FROM MEMBER 
                WHERE MEMBER.MEM_ID='p001'
                AND CART.CART_MEMBER=MEMBER.MEM_ID)
AND CART.CART_NO LIKE '202005%'
AND CART.CART_PROD = 'P202000013';

-- VIEW 객체
CREATE VIEW VIEW_MEMBER
AS
SELECT MEM_NAME AS "회원명",
       MEM_ID   AS "아이디",
       MEM_MILEAGE AS "마일리지",
       TO_CHAR(MEM_BIR,'yyyy-mm-dd') AS "생일",
       MEM_JOB  AS "직업"
       FROM MEMBER
       WHERE MEM_MILEAGE > 1000
       WITH CHECK OPTION;

SELECT * FROM VIEW_MEMBER;
SELECT * FROM MEMBER;

UPDATE VIEW_MEMBER
SET 회원명='홍길동'
WHERE 아이디='e001';

UPDATE VIEW_MEMBER SET 마일리지=2000 WHERE 아이디='e001';

DELETE FROM VIEW_MEMBER WHERE 회원명='홍길동';
DELETE FROM MEMBER WHERE MEM_NAME='홍길동'; -- 무결성 오류

-- 230308
-- SEQUENCE 객체
SELECT NVL(MAX(LPROD_ID),0) FROM LPROD;

-- 상품 분류테이블에 'P103', 'USB 제품'을 등록하시오?
-- (단, LPROD_ID 컬럼의 값은 최대값을 구하여 1을 더한 서브쿼리를 작성하여 입력한다.)
INSERT INTO LPROD(LPROD_ID, LPROD_GU, LPROD_NM)
VALUES((SELECT NVL(MAX(LPROD_ID),0) + 1 FROM LPROD), 'P103', 'USB제품');

SELECT * FROM LPROD;

-- LPROD_SEQ 시퀀스 생성
CREATE SEQUENCE LPROD_SEQ
INCREMENT BY 1
START WITH 15;

-- 다음 번호로 증가
INSERT INTO LPROD (LPROD_ID, LPROD_GU, LPROD_NM)
VALUES (LPROD_SEQ.NEXTVAL, 'P203', '아동복');

-- 현재 번호
SELECT LPROD_SEQ.CURRVAL FROM DUAL;
-- 다음 번호
SELECT LPROD_SEQ.NEXTVAL FROM DUAL;

-- SEQUENCE 변경
ALTER SEQUENCE LPROD_SEQ
INCREMENT BY 2
MAXVALUE 999;

-- SEQUENCE 삭제
DROP SEQUENCE LPROD_SEQ;

CREATE SEQUENCE CART_SEQ
INCREMENT BY 1
MINVALUE 10000
MAXVALUE 99999
CYCLE;

SELECT CART_SEQ.NEXTVAL FROM DUAL;
DROP SEQUENCE CART_SEQ;

-- SYNONYM 객체
CREATE SYNONYM MEM FOR MEMBER;

SELECT * FROM MEM;

CREATE SYNONYM MYDUAL FOR SYS.DUAL;

SELECT SYSDATE FROM MYDUAL;
SELECT 'Hello World' FROM MYDUAL;

DROP SYNONYM MYDUAL;

-- INDEX 객체
CREATE INDEX IDX_MEMBER_BIR 
ON           MEMBER(MEM_BIR);

SELECT MEM_ID,
       MEM_NAME,
       MEM_JOB,
       MEM_BIR
       FROM MEMBER
       WHERE TO_CHAR(MEM_BIR, 'YYYY') = '2000';
       
-- 회원생일에서 년도만 분리하여 인덱스를 생성(Function-basedIndex)
CREATE INDEX IDX_MEMBER_BIR_YEAR
ON     MEMBER(TO_CHAR(MEM_BIR, 'YYYY'));

SELECT MEM_ID,
       MEM_NAME,
       MEM_JOB,
       MEM_BIR
       FROM MEMBER
       WHERE TO_CHAR(MEM_BIR, 'YYYY') = '2000';

DROP INDEX IDX_MEMBER_BIR_YEAR;
DROP INDEX IDX_MEMBER_BIR;

-- Data Dictionary
DESC all_objects;
DESC ALL_TABLES;
-- Dictinary 뷰에서 'ALL_'로 시작하는 모든 테이블 조회
SELECT TABLE_NAME, COMMENTS
FROM DICTIONARY
WHERE TABLE_NAME LIKE 'ALL_%';
-- 현재 로그인한 사용자가 만든 모든 객체 정보를 출력
SELECT OBJECT_NAME,
       OBJECT_TYPE,
       CREATED
       FROM ALL_OBJECTS
       WHERE OWNER='PC20'
       ORDER BY CREATED DESC;

-- USER_TABLES의 컬럼 상세를 확인하고 각 테이블 전체 레코드 개수를 출력 (테이블명, 레코드 수)
DESC USER_TABLES;
SELECT * FROM USER_TABLES;
SELECT TABLE_NAME, NUM_ROWS FROM USER_TABLES;
-- USER_CONTRAINTS, USER_CONS_COLUMNS의 컬럼 상세를 확인하고 상품 테이블의 제약조건을 출력하시오?
-- (컬럼명, 제약명, 타입, 제약내용)
SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_CONS_COLUMNS;

SELECT B.COLUMN_NAME AS "컬럼명", A.CONSTRAINT_NAME AS "제약명", A.CONSTRAINT_TYPE AS "타입", SEARCH_CONDITION AS "제약내용"
FROM USER_CONSTRAINTS A, USER_CONS_COLUMNS B
WHERE A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
AND A.TABLE_NAME = 'PROD';

-- 테스트 
SELECT COUNT(*) FROM EMP;
SELECT * FROM EMP;
-- 같은 직업별로 인원 구하기 (인원이 3명이상인 직업만 출력)
SELECT JOB, COUNT(*) CNT FROM EMP GROUP BY JOB HAVING COUNT(*) > 2;
-- 전체 부서번호 구하는데 중복 제거하고 출력하기
SELECT DISTINCT DEPTNO FROM EMP;