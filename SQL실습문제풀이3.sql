-- PL/SQL

-- DBMS_OUTPUT ������� ȭ�鿡 ����ϱ� ���� ȯ�漳�� ���� ����
SET SERVEROUTPUT ON

-- ���
DECLARE 
    v_i NUMBER(9,2) := 0;
    v_name VARCHAR2(20);
    c_pi CONSTANT NUMBER(8,6) := 3.141592;
    v_flag  BOOLEAN NOT NULL := true;
    v_date  VARCHAR2(10) := TO_CHAR(SYSDATE, 'YYYY-MM-DD');
BEGIN
    v_name := 'ȫ�浿';
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
        DBMS_OUTPUT.PUT_LINE(v_num||'�� ¦��');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_num||'�� Ȧ��');
    END IF;
END;

-- ELSIF
DECLARE
    v_num NUMBER := 77;
BEGIN
    DBMS_OUTPUT.ENABLE;
    IF v_num > 90 THEN
        DBMS_OUTPUT.PUT_LINE('��');
    ELSIF v_num > 80 THEN
        DBMS_OUTPUT.PUT_LINE('��');
    ELSIF v_num > 70 THEN
        DBMS_OUTPUT.PUT_LINE('��');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('�й��սô�');
    END IF;
END;

-- SELECT INTO�� ������ ���� �Ҵ�
DECLARE
    v_avg_sale PROD.PROD_SALE%TYPE; --NUMBER(10,0)
    v_sale NUMBER := 500000;
BEGIN
    DBMS_OUTPUT.ENABLE;
    
    SELECT AVG(prod_sale) INTO v_avg_sale FROM prod;
    
    IF v_sale < v_avg_sale THEN
        DBMS_OUTPUT.PUT_LINE('��� �ܰ��� 500000�ʰ��Դϴ�.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('��� �ܰ��� 500000�����Դϴ�.');
    
    DBMS_OUTPUT.PUT_LINE('��� �ܰ�: ' || v_avg_sale);
    END IF;
END;

-- ȸ�����̺��� ���̵� 'e001'�� ȸ���� ���ϸ����� 5000�� ������ 'VIPȸ��' �׷��� �ʴٸ� '�Ϲ�ȸ��'���� ����Ͻÿ�.
-- (ȸ���̸�, ���ϸ��� ����)
DECLARE
    V_MEM_ID VARCHAR2(10) := 'e001';
    V_MEM_MILEAGE MEMBER.MEM_MILEAGE%TYPE;
    V_MEM_NAME  MEMBER.MEM_NAME%TYPE;
    V_MILE  NUMBER := 5000;
BEGIN
    DBMS_OUTPUT.ENABLE;
    
    -- ������� ����.
    SELECT MEM_MILEAGE, MEM_NAME 
    INTO V_MEM_MILEAGE, V_MEM_NAME
    FROM MEMBER
    WHERE MEM_ID = V_MEM_ID;
    
    IF V_MILE < V_MEM_MILEAGE THEN
        DBMS_OUTPUT.PUT_LINE('VIP ȸ��(' || V_MEM_NAME || ', ' || V_MEM_MILEAGE || ')');
    ELSE
        DBMS_OUTPUT.PUT_LINE('�Ϲ�ȸ��(' || V_MEM_NAME || ', ' || V_MEM_MILEAGE || ')');
    END IF;
END;

-- CASE
DECLARE
    V_NUM NUMBER := 77;
BEGIN
    V_NUM := TRUNC(V_NUM / 10);
    
    CASE V_NUM
        WHEN 10 THEN
            DBMS_OUTPUT.PUT_LINE('��' || '(' || V_NUM || ')');
        WHEN 9 THEN
            DBMS_OUTPUT.PUT_LINE('��' || '(' || V_NUM || ')');
        WHEN 8 THEN
            DBMS_OUTPUT.PUT_LINE('��' || '(' || V_NUM || ')');
        WHEN 7 THEN
            DBMS_OUTPUT.PUT_LINE('��' || '(' || V_NUM || ')');
        ELSE
            DBMS_OUTPUT.PUT_LINE('�й��սô�');
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
    DBMS_OUTPUT.PUT_LINE('1���� 10������ ��=' || V_SUM);
END;
-- WHILE���� ����Ͽ� *�� �Ƕ�̵� �����
DECLARE
    V_ID NUMBER := 1;
BEGIN
    WHILE V_ID < 20 LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD('*',V_ID,'*'));
        V_ID := V_ID + 2;
    END LOOP;
END;
-- LPAD: ���ʿ� ��ũ�� �ΰ��ϴ� �Լ�
SELECT LPAD('A',2) FROM DUAL;
SELECT LPAD('A',3,'B') FROM DUAL;
-- RPAD: �����ʿ� ��ũ�� �ΰ��ϴ� �Լ�
SELECT RPAD('A',2) FROM DUAL;
SELECT RPAD('A',2,'B') FROM DUAL;
-- �Ƕ�̵� �����
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
-- ������
DECLARE
    V_I NUMBER := 2;
    V_J NUMBER := 1;
BEGIN
    WHILE V_I < 10 LOOP
        DBMS_OUTPUT.PUT_LINE(V_I || ' �� ');
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
        DBMS_OUTPUT.PUT_LINE('���� �� = ' || V_NM);
        DBMS_OUTPUT.PUT_LINE('�� �� = ' || SQL%ROWCOUNT);
    END IF;
END;

-- GOTO: ����ó���� ������ �������� �̵�
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

-- EXIT [label][WHEN����]: �ݺ����� ���� ������, WHEN�� ����Ͽ� ���ǿ� ���� ����������.
-- EXIT WHEN�� ����� 1���� 10���� ���ϱ�
DECLARE
    v_sum NUMBER := 0;
    v_var NUMBER := 1;
BEGIN
    LOOP
        v_sum := v_sum + v_var;
        v_var := v_var + 1;
        DBMS_OUTPUT.PUT_LINE('���̰�!');
        EXIT WHEN v_var > 10;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1���� 10������ �� = ' || v_sum);
END;

DECLARE
    TYPE starcraft IS VARRAY(20) OF VARCHAR2(10); -- Type����
    v_star starcraft;
BEGIN
    v_star := starcraft('Terran','Protoss');
    v_star.EXTEND;
    v_star(3) := 'Zerg';
    DBMS_OUTPUT.PUT_LINE('��Ÿũ����Ʈ ���� : '|| v_star.COUNT);
    FOR i IN v_star.FIRST..v_star.LAST LOOP
        DBMS_OUTPUT.PUT_LINE(i || '��° ���� : ' || v_star(i));
    END LOOP;
END;

-- EXCEPTION
-- �̸� ���ǵ� ������ ���
DECLARE
    v_name varchar2(20);
BEGIN
    SELECT LPROD_NM INTO v_name FROM LPROD WHERE LPROD_GU = 'P201';
    DBMS_OUTPUT.PUT_LINE('�з��� =' || v_name);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('�ش� ������ �����ϴ�.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('�Ѱ� �̻��� ���� ���Խ��ϴ�.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('��Ÿ ���� :' || SQLERRM);
END;

-- ���ǵ��� ���� ������ ���
-- �����ڵ� 2292�� ���ؼ� ���ο� ����(exp_references)�� ���� �� ��ü�� �޾Ƽ� ó�����ش�.
DECLARE
    exp_reference EXCEPTION;
    PRAGMA EXCEPTION_INIT(exp_reference, -2292);
BEGIN
    DELETE FROM LPROD WHERE LPROD_GU = 'P101';
    DBMS_OUTPUT.PUT_LINE('�з� ����');
EXCEPTION
    WHEN exp_reference THEN
        DBMS_OUTPUT.PUT_LINE('���� �Ұ� :' || SQLERRM);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE || ' ' || SQLERRM);
END;
-- 413 page
