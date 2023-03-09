-- PL/SQL

-- DBMS_OUTPUT 결과값을 화면에 출력하기 위해 환경설정 변수 변경
SET SERVEROUTPUT ON

-- 출력
DECLARE 
    v_i NUMBER(9,2) := 0;
    v_name VARCHAR2(20);
    c_pi CONSTANT NUMBER(8,6) := 3.141592;
    v_flag  BOOLEAN NOT NULL := true;
    v_date  VARCHAR2(10) := TO_CHAR(SYSDATE, 'YYYY-MM-DD');
BEGIN
    v_name := '홍길동';
    DBMS_OUTPUT.ENABLE;
    DBMS_OUTPUT.PUT_LINE('v_i:'||v_i);
    DBMS_OUTPUT.PUT_LINE('v_name:' || v_name);
    DBMS_OUTPUT.PUT_LINE('c_pi:'||c_pi);
    DBMS_OUTPUT.PUT_LINE('v_date:'||v_date);
END;

-- IF
DECLARE
    v_num NUMBER := 37;
BEGIN
    DBMS_OUTPUT.ENABLE;
    
    IF MOD(v_num,2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_num||'는 짝수');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_num||'는 홀수');
    END IF;
END;

-- ELSIF
DECLARE
    v_num NUMBER := 77;
BEGIN
    DBMS_OUTPUT.ENABLE;
    IF v_num > 90 THEN
        DBMS_OUTPUT.PUT_LINE('수');
    ELSIF v_num > 80 THEN
        DBMS_OUTPUT.PUT_LINE('우');
    ELSIF v_num > 70 THEN
        DBMS_OUTPUT.PUT_LINE('미');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('분발합시다');
    END IF;
END;

-- SELECT INTO로 변수에 값을 할당
DECLARE
    v_avg_sale PROD.PROD_SALE%TYPE; --NUMBER(10,0)
    v_sale NUMBER := 500000;
BEGIN
    DBMS_OUTPUT.ENABLE;
    
    SELECT AVG(prod_sale) INTO v_avg_sale FROM prod;
    
    IF v_sale < v_avg_sale THEN
        DBMS_OUTPUT.PUT_LINE('평균 단가가 500000초과입니다.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('평균 단가가 500000이하입니다.');
    
    DBMS_OUTPUT.PUT_LINE('평균 단가: ' || v_avg_sale);
    END IF;
END;

-- 회원테이블에서 아이디가 'e001'인 회원의 마일리지가 5000을 넘으면 'VIP회원' 그렇지 않다면 '일반회원'으로 출력하시오.
-- (회원이름, 마일리지 포함)
DECLARE
    V_MEM_ID VARCHAR2(10) := 'e001';
    V_MEM_MILEAGE MEMBER.MEM_MILEAGE%TYPE;
    V_MEM_NAME  MEMBER.MEM_NAME%TYPE;
    V_MILE  NUMBER := 5000;
BEGIN
    DBMS_OUTPUT.ENABLE;
    
    -- 순서대로 들어간다.
    SELECT MEM_MILEAGE, MEM_NAME 
    INTO V_MEM_MILEAGE, V_MEM_NAME
    FROM MEMBER
    WHERE MEM_ID = V_MEM_ID;
    
    IF V_MILE < V_MEM_MILEAGE THEN
        DBMS_OUTPUT.PUT_LINE('VIP 회원(' || V_MEM_NAME || ', ' || V_MEM_MILEAGE || ')');
    ELSE
        DBMS_OUTPUT.PUT_LINE('일반회원(' || V_MEM_NAME || ', ' || V_MEM_MILEAGE || ')');
    END IF;
END;

-- CASE
DECLARE
    V_NUM NUMBER := 77;
BEGIN
    V_NUM := TRUNC(V_NUM / 10);
    
    CASE V_NUM
        WHEN 10 THEN
            DBMS_OUTPUT.PUT_LINE('수' || '(' || V_NUM || ')');
        WHEN 9 THEN
            DBMS_OUTPUT.PUT_LINE('수' || '(' || V_NUM || ')');
        WHEN 8 THEN
            DBMS_OUTPUT.PUT_LINE('우' || '(' || V_NUM || ')');
        WHEN 7 THEN
            DBMS_OUTPUT.PUT_LINE('미' || '(' || V_NUM || ')');
        ELSE
            DBMS_OUTPUT.PUT_LINE('분발합시다');
        END CASE;
END;

-- WHILE
DECLARE 
    V_SUM NUMBER := 0;
    V_VAR NUMBER := 1;
BEGIN
    WHILE V_VAR <= 10 LOOP
        V_SUM := V_SUM + V_VAR;
        V_VAR := V_VAR + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1부터 10까지의 합=' || V_SUM);
END;
-- WHILE문을 사용하여 *로 피라미드 만들기
DECLARE
    V_ID NUMBER := 1;
BEGIN
    WHILE V_ID < 20 LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD('*',V_ID,'*'));
        V_ID := V_ID + 2;
    END LOOP;
END;
-- LPAD: 왼쪽에 블랭크를 부가하는 함수
SELECT LPAD('A',2) FROM DUAL;
SELECT LPAD('A',3,'B') FROM DUAL;
-- RPAD: 오른쪽에 블랭크를 부가하는 함수
SELECT RPAD('A',2) FROM DUAL;
SELECT RPAD('A',2,'B') FROM DUAL;
-- 피라미드 만들기
DECLARE 
  V_ID  NUMBER := 1;
  V_ID2 NUMBER := 10;
BEGIN
  DBMS_OUTPUT.PUT_LINE(' ');
  WHILE V_ID < 20 LOOP
    DBMS_OUTPUT.PUT(RPAD(' ' , V_ID2, ' '));
    DBMS_OUTPUT.PUT_LINE(RPAD('*', V_ID, '*'));    
    V_ID  := V_ID  + 2;  
    V_ID2 := V_ID2 - 1;  
  END LOOP;  
END;
-- 구구단
DECLARE
    V_I NUMBER := 2;
    V_J NUMBER := 1;
BEGIN
    WHILE V_I < 10 LOOP
        DBMS_OUTPUT.PUT_LINE(V_I || ' 단 ');
        V_J := 1;
        WHILE V_J < 10 LOOP
            DBMS_OUTPUT.PUT_LINE(V_I || ' X ' || V_J || '=' || V_I * V_J);
            V_J := V_J + 1;
        END LOOP;
        V_I := V_I + 1;
        DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;
END;

DECLARE
    V_NM VARCHAR2(20);
BEGIN
    SELECT LPROD_NM INTO V_NM FROM LPROD WHERE LPROD_GU = 'P201';
    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('받은 값 = ' || V_NM);
        DBMS_OUTPUT.PUT_LINE('행 수 = ' || SQL%ROWCOUNT);
    END IF;
END;

-- GOTO: 실행처리를 임의의 지점으로 이동
DECLARE
    V_SUM INT := 0;
    V_VAR INT := 1;
BEGIN
    <<mylabel>>
    V_SUM := V_SUM + V_VAR;
    V_VAR := V_VAR + 1;
    IF V_VAR <= 10 THEN
        GOTO mylabel;
    END IF;
    DBMS_OUTPUT.PUT_LINE(V_SUM);
    DBMS_OUTPUT.PUT_LINE(V_VAR);
END;

-- EXIT [label][WHEN조건]: 반복문을 빠져 나간다, WHEN을 사용하여 조건에 따라서 빠져나간다.
-- EXIT WHEN을 사용해 1부터 10까지 더하기
DECLARE
    v_sum NUMBER := 0;
    v_var NUMBER := 1;
BEGIN
    LOOP
        v_sum := v_sum + v_var;
        v_var := v_var + 1;
        DBMS_OUTPUT.PUT_LINE('아이고!');
        EXIT WHEN v_var > 10;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1부터 10까지의 합 = ' || v_sum);
END;

DECLARE
    TYPE starcraft IS VARRAY(20) OF VARCHAR2(10); -- Type선언
    v_star starcraft;
BEGIN
    v_star := starcraft('Terran','Protoss');
    v_star.EXTEND;
    v_star(3) := 'Zerg';
    DBMS_OUTPUT.PUT_LINE('스타크래프트 종족 : '|| v_star.COUNT);
    FOR i IN v_star.FIRST..v_star.LAST LOOP
        DBMS_OUTPUT.PUT_LINE(i || '번째 종족 : ' || v_star(i));
    END LOOP;
END;

-- EXCEPTION
-- 미리 정의된 예외인 경우
DECLARE
    v_name varchar2(20);
BEGIN
    SELECT LPROD_NM INTO v_name FROM LPROD WHERE LPROD_GU = 'P201';
    DBMS_OUTPUT.PUT_LINE('분류명 =' || v_name);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('해당 정보가 없습니다.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('한개 이상의 값이 나왔습니다.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('기타 에러 :' || SQLERRM);
END;

-- 정의되지 않은 예외인 경우
-- 오류코드 2292에 대해서 새로운 예외(exp_references)를 만들어서 그 객체로 받아서 처리해준다.
DECLARE
    exp_reference EXCEPTION;
    PRAGMA EXCEPTION_INIT(exp_reference, -2292);
BEGIN
    DELETE FROM LPROD WHERE LPROD_GU = 'P101';
    DBMS_OUTPUT.PUT_LINE('분류 삭제');
EXCEPTION
    WHEN exp_reference THEN
        DBMS_OUTPUT.PUT_LINE('삭제 불가 :' || SQLERRM);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE || ' ' || SQLERRM);
END;
-- 413 page
