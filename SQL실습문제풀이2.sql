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
SELECT TO_CHAR(CAST('2008-12-25' AS DATE), 'YYYY.MM.DD HH24:MI') FROM DUAL;

-- 상품테이블에서 상품입고일을 '2008-09-28' 형식으로 나오게 검색하시오. (Alias 상품명,상품판매가,입고일)
SELECT PROD_NAME AS "상품명", PROD_SALE AS "상품판매가", TO_CHAR(PROD_INSDATE,'YYYY-MM-DD') AS "입고일" FROM PROD;
-- 회원이름과 생일로 다음처럼 출력되게 작성하시오.
-- 김은대님은 1976년 1월 출생이고 태어난 요일은 목요일
SELECT MEM_NAME AS "회원이름", MEM_BIR AS "회원생일", MEM_NAME || '님은 ' || TO_CHAR(MEM_BIR, 'YYYY"년" MM"월 출생이고 태어난 요일은" DAY') FROM MEMBER;



SELECT MEM_NAME 회원이름, MEM_MILEAGE 마일리지,
CASE 
    WHEN MEM_MILEAGE >= 3000 THEN 'VIP'
    WHEN MEM_MILEAGE >= 2000 THEN '골드'
    WHEN MEM_MILEAGE >= 1000 THEN '실버'
    WHEN MEM_MILEAGE >= 500 THEN '브론즈'
    ELSE '일반'
  END AS 등급
FROM MEMBER ;

-- 테스트 
SELECT COUNT(*) FROM EMP;
SELECT * FROM EMP;
-- 같은 직업별로 인원 구하기 (인원이 3명이상인 직업만 출력)
SELECT JOB, COUNT(*) CNT FROM EMP GROUP BY JOB HAVING COUNT(*) > 2;
-- 전체 부서번호 구하는데 중복 제거하고 출력하기
SELECT DISTINCT DEPTNO FROM EMP;