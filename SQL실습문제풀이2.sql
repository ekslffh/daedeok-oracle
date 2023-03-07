-- ������� ��������
-- 1. ���������ڸ� �̿��Ͽ� ��� ����� ���ؼ� 300������ �޿� �λ��� ����� �� ����� �̸�, �޿�, �λ�� �޿��� ����Ͻÿ�.
SELECT ENAME �����, SAL �޿�, (SAL + 300) �λ�ȱ޿� FROM EMP;
-- 2. �����ȣ 7999 ����� ����(JOB)�� '���α׷���'�� �����Ͻÿ�.
UPDATE EMP SET JOB='���α׷���' WHERE EMPNO='7999';
-- 3. EMP ���̺� JOB �Ӽ��� ������Ÿ���� VARCHAR2(20)���� �����Ͻÿ�.
ALTER TABLE EMP MODIFY JOB VARCHAR2(20);
-- 4. EMP ���̺� �����ȣ�� DEPT���̺�� �ܷ�Ű�� �����Ͻÿ�.
ALTER TABLE EMP MODIFY DEPTNO CHAR(2); -- DEPT���̺�� EMP���̺� �ִ� DEPTNO Ÿ�� ���߱�
ALTER TABLE EMP ADD CONSTRAINT FK_DEPTNO FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO);
-- 5. ����� �̸�, �޿�, ���� �� ������ �� ������ ���� �ͺ��� ���� ������ ����Ͻÿ�. 
--    ���� �Ѽ����� ���޿� 12�� ������ 100���� �󿩱��� ���ؼ� ����Ͻÿ�.
SELECT ENAME �����, SAL �޿�, (SAL * 12 + 100) �����Ѽ��� FROM EMP ORDER BY �����Ѽ���;
-- 6. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� ǥ��, �޿��� ���� �ͺ��� ���� ������ ����Ͻÿ�.
SELECT ENAME �����, SAL �޿� FROM EMP WHERE (SAL > 2000) ORDER BY SAL DESC;
-- 7. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����Ͻÿ�.
SELECT ENAME �����, DEPTNO �μ���ȣ FROM EMP WHERE EMPNO='7788';
SELECT ENAME �����, DEPTNO �μ���ȣ FROM EMP WHERE EMPNO LIKE 7788;
-- 8. �޿��� 2000���� 3000 ���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ����Ͻÿ�.
SELECT ENAME, SAL FROM EMP WHERE SAL < 2000 OR SAL > 3000;
SELECT ENAME, SAL FROM EMP WHERE NOT (2000 <= SAL AND SAL <= 3000);
SELECT ENAME �����, SAL �޿� FROM EMP WHERE NOT SAL BETWEEN 2000 AND 3000;
-- 9. 2020�� 2�� 20�Ϻ��� 2023�� 12�� 31�� ���̿� �Ի��� ����� �̸�, ������, �Ի����� ����Ͻÿ�.
SELECT ENAME �����, JOB, HIREDATE FROM EMP WHERE HIREDATE BETWEEN '20/02/20' AND '23/12/31';
SELECT ENAME �����, JOB, HIREDATE FROM EMP WHERE HIREDATE NOT BETWEEN '20/02/20' AND '23/12/31';
-- 10. �μ���ȣ�� 20 �� 30�� ���� ����� �̸��� �μ���ȣ�� ���, �̸��� ����(��������)���� �����ڼ����� ����Ͻÿ�.
SELECT ENAME �����, DEPTNO �μ���ȣ FROM EMP WHERE DEPTNO BETWEEN '20' AND '30' ORDER BY ENAME DESC;
SELECT ENAME �����, DEPTNO �μ���ȣ FROM EMP WHERE DEPTNO IN('20','30') ORDER BY ENAME DESC;
-- 11. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ���, �̸���(��������)���� ����Ͻÿ�.
SELECT ENAME �����, SAL �޿�, DEPTNO �μ���ȣ FROM EMP WHERE (SAL BETWEEN 2000 AND 3000) AND DEPTNO IN ('20','30') ORDER BY ENAME;
-- 12. 2021�⵵�� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�. (like �����ڿ� ���ϵ�ī�� ���)
SELECT ENAME �����, HIREDATE ����� FROM EMP WHERE HIREDATE LIKE '21%';
-- 13. �����ڰ� ���� ����� �̸��� ��� ������ ����Ͻÿ�.
SELECT ENAME, JOB FROM EMP WHERE MGR IS NULL;
SELECT ENAME, JOB FROM EMP WHERE MGR IS NOT NULL;
-- ���ܹ���. �߰��̸��� '��'�ڰ� �ִ� ��� �̸� ����ϱ�
SELECT ENAME FROM EMP WHERE ENAME LIKE '_��_';
-- 14. �̸��� ����° ���ڰ� "��"�� ����� �̸��� ǥ���Ͻÿ�.
SELECT ENAME FROM EMP WHERE ENAME LIKE '%��';
SELECT ENAME FROM EMP WHERE ENAME LIKE '__��';
-- 15. �̸��� "��" �Ǵ� "��"�� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�.
SELECT ENAME FROM EMP WHERE ENAME LIKE '%��%' OR ENAME LIKE '%��%';
-- 16. Ŀ�̼��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿� �� Ŀ�̼��� �������� �������� �����Ͽ� ǥ���Ͻÿ�.
SELECT ENAME �̸�, SAL �޿�, COMM Ŀ�̼� FROM EMP WHERE COMM IS NOT NULL ORDER BY COMM DESC;
-- 17. �������� ����, �Ǵ� ��������̸鼭 �޿��� 1600, 1500�Ǵ� 1300�� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�.
SELECT ENAME �����, JOB ������, SAL �޿� FROM EMP WHERE JOB IN ('�������','����') AND SAL NOT IN (1600,1500,1300);
-- 18. EMP ���̺� SCORE VARCHAR2(2), REMARK VARCHAR2(50) �Ӽ��� �߰��Ͻÿ�.
ALTER TABLE EMP ADD (SCORE VARCHAR2(2), REMARK VARCHAR2(50));
-- ��ü ��� REAMRK�� �� ����ֱ�
ALTER TABLE EMP MODIFY REMARK VARCHAR2(1000);
UPDATE EMP SET REMARK='On a dark desert highwayCool wind in my hairWarm smell of colitasRising up through the airUp ahead in the distanceI saw a shimmering lightMy head grew heavy and my sight grew dimI had to stop for the night
There she stood in the doorwayI heard the mission bellAnd I was thinking to myself"This could be Heaven or this could be Hell"Then she lit up a candleAnd she showed me the wayThere were voices down the corridorI thought I heard them say
Welcome to the Hotel CaliforniaSuch a lovely place (such a lovely place)Such a lovely facePlenty of room at the Hotel CaliforniaAny time of year (any time of year)You can find it here';
-- UPPER, LOWER, INITCAP
SELECT LOWER('DATA MANIPUL LANG'), 
       UPPER('DATA MANIPUL LANG'), 
       INITCAP('DATA MANIPUL LANG') 
       FROM DUAL;  
-- <���ܹ���>
SELECT REMARK FROM EMP;
-- 1. �Էµ� REMARK �Ӽ��� ����� �����ڸ� ��� �빮�ڷ� �ٲٽÿ�.
SELECT LOWER(REMARK) FROM EMP;
-- 2. �Էµ� REMARK �Ӽ��� ����� �����ڸ� �ܾ��� ù���ڸ� �빮�ڷ� �ٲٽÿ�.
SELECT INITCAP(REMARK) FROM EMP;
-- 19. Ŀ�̼��� 500 �̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����Ͻÿ�.
SELECT ENAME, SAL, COMM FROM EMP WHERE COMM >= 500;
-- 20. SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ����Ͻÿ�.
-- HIREDATE(�����ε���: 1����, �ڸ� ���ڿ� ����)
SELECT SUBSTR(HIREDATE,1,5) �Ի�ñ� FROM EMP;
SELECT SUBSTR(HIREDATE,1,2) �Ի�_��, SUBSTR(HIREDATE,4,2) �Ի�_�� FROM EMP;
-- 21. SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ����Ͻÿ�.
SELECT * FROM EMP WHERE SUBSTR(HIREDATE,4,2)='04';
-- 22. MOD �Լ��� ����Ͽ� �����ȣ�� ¦���� ����� ����Ͻÿ�.
-- MOD(A,B): A�� B�� ���� ��������
SELECT * FROM EMP WHERE MOD(EMPNO, 2)=0;
-- 23. �Ի����� �⵵�� 2�ڸ�(YY), ���� ����(MON)�� ǥ���ϰ� ������ ��� (DD)�� �����Ͽ� ����Ͻÿ�.
SELECT SUBSTR(HIREDATE,1,2) �Ի�⵵, SUBSTR(HIREDATE,4,2) ��, EMPNO, ENAME FROM EMP;
SELECT SUBSTR(HIREDATE,1,2)YY, SUBSTR(HIREDATE,4,2)MON, SUBSTR(HIREDATE,7,2)DD FROM EMP;
-- 24. ���� ������ �������� ����Ͻÿ�. ���糯¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ� ������ ���� ��ġ��Ű�ÿ�.
SELECT TO_DATE('2023-02-20') - TO_DATE('2023-01-01') FROM DUAL;
SELECT SYSDATE - TO_DATE('2023-01-01') FROM DUAL;
-- �Ի����� 100���̵Ǵ� ��¥�� ����Ͻÿ�.
SELECT ENAME ȸ����, HIREDATE �Ի���, HIREDATE + 100 "�Ի�����100��°" FROM EMP;
SELECT * FROM ALL_TABLES;
SELECT SYSDATE FROM DUAL;
SELECT TO_DATE('2023-02-20','YYYY-MM-DD') FROM DUAL; -- ? ���� �ȹٲ�
SELECT TO_DATE(SYSDATE) - TO_DATE('2023-02-01') FROM DUAL;
SELECT ADD_MONTHS(SYSDATE,5) FROM DUAL;
-- �̹����� ���� ���Ҵ��� ��ȸ
SELECT SYSDATE AS ���ó�¥, LAST_DAY(SYSDATE) AS "�̴� ������ ��¥", LAST_DAY(SYSDATE) - SYSDATE AS "�̹��޿� ���� ��" FROM DUAL;
-- ������� ���, �̸�, �������� ����ϵ� ����� ���� ����� ���ؼ��� NULL ����� 0���� ����Ͻÿ�.
SELECT EMPNO ���, ENAME �̸�, NVL(MGR,'���߷�') ������ FROM EMP;
-- �������� NULL�� �ƴϸ� �������, NULL�̸� ���߷����� ���
SELECT EMPNO ���, ENAME �̸�, NVL2(MGR,'�������','���߷�') ������ FROM EMP;
-- 26. DECODE �Լ��� ���޿� ���� �޿��� �λ��ϵ��� �Ͻÿ�. ������ '�м���'�� ����� 200, '�������'�� ����� 180, '������'�� ����� 150, '����'�� ����� 130�� �λ��Ͻÿ�.
SELECT EMPNO ���, ENAME �̸�, JOB ����, SAL �޿�, DECODE(JOB, '�м���',SAL + 200, '�������',SAL + 180, '������',SAL + 150, '����',SAL + 130, SAL) �λ�޿�, DECODE(JOB, '�м���','200', '�������','180', '������','150', '����','130','0') �λ�ݾ� FROM EMP;
-- 27. ��� ����� �޿� �ְ��, ������, �Ѿ� �� ��� �޿��� ����Ͻÿ�. ��տ� ���ؼ��� ������ �ݿø��Ͻÿ�.
UPDATE EMP SET SAL=1400 WHERE ENAME='������'; -- SAL �߸� ��
SELECT MAX(SAL) �ְ��, MIN(SAL) ������, SUM(SAL) �Ѿ�, ROUND(AVG(SAL),0) ��� FROM EMP;
-- 28. �� ��� ���� �������� �޿� �ְ��, ������, �Ѿ� �� ��ձݾ��� ����Ͻÿ�. ��տ� ���ؼ��� ������ �ݿø��Ͻÿ�.
SELECT JOB ������, MAX(SAL) �ְ��, MIN(SAL) ������, SUM(SAL) �Ѿ�, ROUND(AVG(SAL),0) ��� FROM EMP GROUP BY JOB;
-- 29. COUNT(*) �Լ��� �̿��Ͽ� �������� ������ ������� ���
SELECT JOB ������, COUNT(*) �ο���, MAX(SAL) �ְ��, MIN(SAL) ������, SUM(SAL) �Ѿ�, ROUND(AVG(SAL),0) ��� FROM EMP GROUP BY JOB;
-- 30. �޿� �ְ��, �޿� �������� ������ ����Ͻÿ�.
SELECT MAX(SAL) �ְ��, MIN(SAL) ������, MAX(SAL) - MIN(SAL) ���� FROM EMP;
UPDATE EMP SET SAL=4500 WHERE JOB='���α׷���';
-- 31. ������ ǥ���� ���� �ش� ������ ���� �μ� ��ȣ�� �޿� �� �μ� 10,20,30�� �޿��Ѿ��� ���� ����Ͻÿ�.
-- ��Ī�� �� JOB, DNO, �μ� 10, �μ� 20, �μ� 30, �Ѿ����� �����Ͻÿ�
-- �μ���ȣ���� �׷��� ��������� ������ �μ���ȣ�� �μ��̸��� �ִ��� �������� ��ǻ�ʹ� �𸥴�. ���� ������ ��������� �μ��̸����� �ٽ� �ѹ� �׷��� ������� �׷��� �̸����� ����� �����ϴ�.
SELECT DEPTNO �μ���ȣ, SUM(SAL) �޿��Ѿ� FROM EMP GROUP BY DEPTNO;
SELECT E.DEPTNO �μ���ȣ, SUM(E.SAL) �Ѿ�, D.DNAME �μ��� FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO GROUP BY E.DEPTNO, D.DNAME;
SELECT * FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO;
-- 32. EQUI ������ ����Ͽ� ��ο� ����� �μ���ȣ�� �μ� �̸��� ����Ͻÿ�.
SELECT E.ENAME �����, D.DEPTNO �μ���ȣ, D.DNAME �μ��̸� FROM DEPT D,EMP E WHERE D.DEPTNO=E.DEPTNO AND E.ENAME='��ο�'; 
-- 33. INNER JOIN�� ON �����ڸ� ����Ͽ� ��� �̸��� �Բ� �� ����� �Ҽӵ� �μ��̸��� �������� ����Ͻÿ�.
SELECT E.ENAME �����, D.DNAME �μ���, D.LOC ������ FROM EMP E INNER JOIN DEPT D ON E.DEPTNO=D.DEPTNO;
SELECT E.ENAME �����, D.DNAME �μ���, D.LOC ������ FROM EMP E INNER JOIN DEPT D USING (DEPTNO);
-- 34. INNER JOIN�� USING �����ڸ� ����Ͽ� 10�� �μ��� ���ϴ� ��� ��� ������ ���� ���(�ѹ����� ǥ��)�� �μ��� �������� �����Ͽ� ����Ͻÿ�.
SELECT E.ENAME �����, D.DNAME �μ���, D.LOC ������ FROM EMP E INNER JOIN DEPT D USING (DEPTNO) WHERE DEPTNO='10';
SELECT EMP.EMPNO �����ȣ, DEPT.LOC ������, EMP.JOB ������ FROM EMP INNER JOIN DEPT USING (DEPTNO) WHERE DEPTNO='10';
SELECT DEPTNO, E.EMPNO �����ȣ, D.LOC ������, E.JOB ������ FROM EMP E INNER JOIN DEPT D USING (DEPTNO) WHERE DEPTNO='10';
-- 35. NATURAL JOIN�� ����Ͽ� Ŀ�̼��� �޴� ��� ����� �̸�, �μ��̸�, ���� ���� ����Ͻÿ�.
SELECT E.ENAME, D.DNAME, D.LOC FROM EMP E INNER JOIN DEPT D ON E.DEPTNO=D.DEPTNO WHERE E.COMM IS NOT NULL;
SELECT E.ENAME, D.DNAME, D.LOC FROM EMP E INNER JOIN DEPT D USING (DEPTNO) WHERE E.COMM IS NOT NULL;
-- 36. EQUI���ΰ� WildCARD�� ����Ͽ� �̸��� '��'�� ���Ե� ��� ����� �̸��� �μ����� ����Ͻÿ�.
SELECT E.ENAME �����, D.DNAME �μ��� FROM EMP E INNER JOIN DEPT D ON E.DEPTNO=D.DEPTNO WHERE E.ENAME LIKE '%��%';
SELECT EMP.ENAME �̸�, DEPT.DNAME �μ��� FROM EMP, DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO AND EMP.ENAME LIKE '%��%';
-- 37. NATURAL JOIN�� �̿��Ͽ� ������ �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ �� �μ����� ����Ͻÿ�.
SELECT ENAME �����, JOB ����, DEPTNO �μ���ȣ, DNAME �μ��� FROM EMP NATURAL JOIN DEPT WHERE LOC='����';
-- 38. SELF JOIN�� ����Ͽ� ����� �̸� �� �����ȣ�� ������ ��ȣ�� �Բ� ����Ͻÿ�.
SELECT  E1.EMPNO �����ȣ, E1.ENAME �����, E1.MGR �����ڹ�ȣ, E2.ENAME �����ڸ� FROM EMP E1, EMP E2 WHERE E1.MGR=E2.EMPNO ORDER BY E1.EMPNO;
-- 39. SELF JOIN�� ����Ͽ� ������ ����� �̸�, �μ���ȣ, ������ ����� ������ �μ����� �ٹ��ϴ� ����� ����Ͻÿ�. (����)
SELECT ENAME, DEPTNO FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='����');
SELECT E.ENAME, E.DEPTNO, E1.ENAME FROM EMP E, EMP E1 WHERE E.DEPTNO=E1.DEPTNO AND E.ENAME='����' AND NOT E1.ENAME='����';
-- 40. �����ȣ�� 7788�� ����� �������� ���� ����� ǥ��(����̸��� ������)�Ͻÿ�.
SELECT * FROM EMP E, EMP E1 WHERE E.JOB=E1.JOB AND E.EMPNO='7788';
SELECT E1.ENAME �����, E1.JOB ������ FROM EMP E, EMP E1 WHERE E.JOB=E1.JOB AND E.EMPNO<>'7788'; -- �ߺ��ż� ������ ����
SELECT E1.ENAME �����, E1.JOB ������ FROM EMP E, EMP E1 WHERE E.JOB=E1.JOB AND E.EMPNO='7499' AND E1.EMPNO<>'7499';

-- 45. �����ȣ�� 7499�� ������� �޿��� ���� ����� ǥ���Ͻÿ�. ����̸��� ��� ����
SELECT ENAME, JOB, SAL FROM EMP WHERE SAL > (SELECT SAL FROM EMP WHERE EMPNO='7499');
SELECT A.ENAME �����, A.JOB ������, A.SAL �޿� FROM EMP A, EMP B WHERE B.EMPNO='7499' AND A.SAL > B.SAL;

-- ��ǰ������ 17������ ��ǰ ��ȸ
SELECT PROD_NAME ��ǰ��, PROD_SALE �ǸŰ� FROM PROD WHERE PROD_SALE = 170000;
-- ��ǰ������ 17������ �ƴ� ��ǰ ��ȸ
SELECT PROD_NAME ��ǰ��, PROD_SALE �ǸŰ� FROM PROD WHERE PROD_SALE <> 170000;
-- ��ǰ������ 17���� �ʰ� �Ǵ� �̸��� ��ȸ (�� 17������ �ƴ� ��ǰ��ȸ)
SELECT PROD_NAME ��ǰ��, PROD_SALE �ǸŰ� FROM PROD WHERE PROD_SALE > 170000 OR PROD_SALE < 170000;

-- 46. �ּұ޿��� �޴� ����� �̸�, ������ �� �޿��� ǥ���Ͻÿ�. (�׷��Լ� ���)
SELECT ENAME �����, JOB ������, SAL �޿� FROM EMP WHERE SAL = (SELECT MIN(SAL) FROM EMP);
-- �ְ�޿��� ����
SELECT ENAME �����, JOB ������, SAL �޿� FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP);
-- �ְ�޿�, �����޿�, ��ձ޿� ���
SELECT MAX(SAL) �ְ�޿�, MIN(SAL) �����޿�, ROUND(AVG(SAL),2) ��ձ޿� FROM EMP;
-- 47. ��ձ޿��� ���� ���� ������ ���� �̸��� ������ ����� ���Ͻÿ�.
-- 1�ܰ�
SELECT JOB ����, ROUND(AVG(SAL)) ��ձ޿� FROM EMP GROUP BY JOB ORDER BY AVG(SAL);
-- 2�ܰ�
SELECT ����, ��ձ޿� FROM (SELECT JOB ����, ROUND(AVG(SAL)) ��ձ޿� FROM EMP GROUP BY JOB ORDER BY AVG(SAL));
-- 3�ܰ�
SELECT * FROM (SELECT JOB ����, ROUND(AVG(SAL)) ��ձ޿� FROM EMP GROUP BY JOB ORDER BY AVG(SAL)) WHERE ROWNUM=1;

SELECT ����, ��ձ޿�, RANK () OVER(ORDER BY ��ձ޿�) AS ����
FROM (SELECT JOB ����, ROUND(AVG(SAL)) ��ձ޿� FROM EMP GROUP BY JOB ORDER BY AVG(SAL));

-- 48. �� �μ��� �ּ� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ�� ǥ���Ͻÿ�.
SELECT A.ENAME, A.SAL, A.DEPTNO FROM EMP A INNER JOIN (SELECT DEPTNO, MIN(SAL) SAL FROM EMP GROUP BY DEPTNO) B ON A.DEPTNO=B.DEPTNO WHERE A.SAL = B.SAL;
SELECT A.ENAME �����, A.SAL �޿�, A.DEPTNO �μ���ȣ FROM EMP A, (SELECT DEPTNO, MIN(SAL) �μ������޿� FROM EMP GROUP BY(DEPTNO)) B WHERE A.DEPTNO=B.DEPTNO AND A.SAL=B.�μ������޿�;

-- 49. �������� �м����� ������� �޿��� �����鼭 ������ �м����� �ƴ� ������� ǥ��(�����ȣ, �̸�, ������, �޿�)�Ͻÿ�.
SELECT * FROM EMP WHERE JOB='�м���';
SELECT EMPNO �����ȣ, ENAME �̸�, JOB ������, SAL �޿� FROM EMP WHERE SAL < (SELECT MIN(SAL) FROM EMP GROUP BY JOB HAVING JOB='�м���') ORDER BY ENAME;
SELECT EMPNO �����ȣ, ENAME �̸�, JOB ������, SAL �޿� FROM EMP WHERE SAL < ALL (SELECT SAL FROM EMP WHERE JOB='�м���');

SELECT MIN(SAL) FROM EMP GROUP BY JOB HAVING JOB='�м���';
-- �� �μ��� �ּұ޿��� �޴� ����� �̸�,�޿�,�μ���ȣ�� ǥ���Ͻÿ�
-- ������
-- 30�� �μ��� �޿��� �ּҰ��� 1250�ε� 30�� �μ��� 1400�� �޿��� ���� ����� ������ ��µȴ�. (20�� �μ��� �޿� �ּҰ��� 1400�̱� ������)
SELECT ENAME, SAL, DEPTNO FROM EMP WHERE SAL IN (SELECT MIN(SAL) from EMP GROUP BY(DEPTNO));

-- 50. ���������� ���� ����� �̸��� ǥ���Ͻÿ�.(�����ȣ�� �Ŵ����� ����Ǿ� ���� ���� ����� ��ȸ�ؾ� ��)
SELECT * FROM EMP;
SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL;
SELECT EMPNO �����ȣ, ENAME ����� FROM EMP WHERE ENAME NOT IN (SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL) ORDER BY EMPNO;

--SELECT EMPNO, ENMAE FROM EMP WHERE ENAME NOT IN (SELECT E.NAME ����̸� FROM EMP E, EMP E1 WHERE E.EMPNO=E1.MGR);

SELECT * FROM PROD;
SELECT PROD_ID ��ǰ�ڵ�, PROD_NAME ��ǰ�� FROM PROD WHERE PROD_NAME LIKE '%����%';

-- INNER JOIN�� ������ �Ӽ��� �ι� ���´� _1�� ����.
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO;

-- ���Ʊ�. ��ǰ���̺��� ��ǰ�ڵ�, ��ǰ��, �з���, �ŷ�ó ���� ��ȸ�Ͻÿ�.
SELECT PROD.PROD_ID "��ǰ�ڵ�",PROD.PROD_NAME "��ǰ��",LPROD.LPROD_NM "�з���",BUYER.BUYER_NAME "�ŷ�ó��" 
FROM PROD,LPROD,BUYER
WHERE PROD.PROD_LGU=LPROD.LPROD_GU AND PROD.PROD_BUYER=BUYER.BUYER_ID;

-- C||C: ���̻��� ���ڿ��� �����ϴ� ���� ������
SELECT 'a' || 'bcde' FROM DUAL;
SELECT MEM_ID || ' NAMEIS ' || MEM_NAME FROM MEMBER;
-- CONCAT: �� ���ڿ��� �����Ͽ� ��ȯ
SELECT CONCAT('MY NAME IS ',MEM_NAME) �Ұ� FROM MEMBER;
-- CHR,ASCII: ASCII���� ���ڷ�, ���ڷ� ASCII������ ��ȯ
SELECT CHR(65) "CHR", ASCII('ABC') "ASCII" FROM DUAL;
SELECT ASCII(CHR(65)) RESULT FROM DUAL;
SELECT CHR(75) CHR, ASCII('K') ASCII FROM DUAL;
-- ȸ�����̺��� ȸ�� ID Column�� ASCII���� �˻��Ͻÿ�?
SELECT ASCII(MEM_ID) AS "ȸ�� ASCII", CHR(ASCII(MEM_ID)) AS ȸ��CHR FROM MEMBER;
-- LOWER, UPPER, INITCAP
SELECT LOWER('DATA manipulation Language') LOWER, UPPER('DATA manipulation Language') UPPER, INITCAP('DATA manipulation Language') INITCAP FROM DUAL;
-- ȸ�����̺��� ȸ��ID�� �빮�ڷ� ��ȯ�Ͽ� �˻��Ͻÿ�? (Alias���� ��ȯ ��ID, ��ȯ ��ID)
SELECT UPPER(MEM_ID) ������̵� FROM MEMBER;

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

--  ������ ���� n���� c1�� ä��� ���� ������ c2�� ä���� ��ȯ�Ѵ�.
-- LPAD(c1,n,c2)
SELECT LPAD('Java',10,'*') LPAD, RPAD('Flex',12,'^') RPAD FROM DUAL;
SELECT LPAD('������',12,'*') FROM DUAL;

-- ��ǰ���̺��� �Һ��ڰ��ݰ� �Һ��ڰ����� ġȯ�Ͽ� ������ ���� ��µǰ� �Ͻÿ�.
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
       SUBSTR('SQL������PROJDCT',-10,3) RESULT3
       FROM DUAL;
-- ȸ�����̺��� ���� ��ȸ
SELECT MEM_ID, SUBSTR(MEM_NAME,1,1) ���� FROM MEMBER;
-- ��ǰ���̺��� ��ǰ���� 4° �ڸ����� 2���ڰ� 'Į��'�� ��ǰ�� ��ǰ�ڵ�, ��ǰ���� �˻��Ͻÿ� (Alias���� ��ǰ�ڵ�, ��ǰ��)
SELECT PROD_ID ��ǰ�ڵ�, PROD_NAME ��ǰ�� FROM PROD WHERE SUBSTR(PROD_NAME,4,2)='Į��';

-- TRANSLATE(c1,c2,c3): c1���ڿ��� ���Ե� ���� �� c2�� ������ ���ڰ� c3���ڷ� ���� ����, c3���ڰ� c2���� ������� �ش� ���ڴ� ����
SELECT TRANSLATE('2009-02-28','0123456789-','ABCDEFGHIJK') RESULT FROM DUAL;
-- ��ǰ���̺��� ��ǰ�ڵ忡�� ����4�ڸ�, ������ 6�ڸ��� �˻��Ͻÿ� (Alias���� ��ǰ�ڵ�, ��з�, ����)
SELECT PROD_ID FROM PROD;
SELECT PROD_ID ��ǰ�ڵ�, SUBSTR(PROD_ID,1,4) ��з�, SUBSTR(PROD_ID,-6) ���� FROM PROD;
-- ȸ�����̺��� ȸ�����̵𿡼� ���ڸ� �����Ͽ� ����Ͻÿ�? (Alias���� ȸ�����̵�, ��ȯ���̵�)
SELECT MEM_ID ȸ�����̵�, TRANSLATE(MEM_ID,'0123456789',' ') ��ȯ���̵� FROM MEMBER;
SELECT MEM_ID ȸ�����̵�, REPLACE(MEM_ID,'001') ��ȯ���̵� FROM MEMBER;
SELECT REGEXP_REPLACE(MEM_ID, '[[:digit:]]') AS ��������_ȸ�����̵�
FROM MEMBER;
select mem_id ȸ�����̵�, translate(mem_id, '0123456789', ' ') result from member;
-- REPLACE
SELECT REPLACE('SQLPROJECT','SQL','SSQQLL') ����ġȯ1, 
       REPLACE('JavaFlexVia','a') ����ġȯ2 from dual;
-- �ŷ�ó ���̺��� �ŷ�ó�� �� '��' --> '��'���� ġȯ
SELECT BUYER_NAME, REPLACE(BUYER_NAME,'��','��') "��->��" FROM BUYER;
-- ȸ�����̺��� ȸ������ �� '��' --> '��'�� ġȯ�˻��Ͻÿ�
SELECT MEM_NAME ȸ����, REPLACE(MEM_NAME,'��','��') ȸ����ġȯ FROM MEMBER;
SELECT MEM_NAME ȸ����, REPLACE(MEM_NAME,'��','��') ȸ����ġȯ FROM MEMBER WHERE MEM_NAME LIKE '��%';

-- INSTR(c1,c2,[m,[n]]): c1���ڿ����� c2���ڰ� ó�� ��Ÿ���� ��ġ�� ����, m�� ������ġ, n�� n��°
SELECT INSTR('hello heidi', 'he') AS RESULT1,
       INSTR('hello heidi', 'he', 3) AS RESULT2 ,
       INSTR('hello heidi', 'he', 1, 2) AS RESULT23
       FROM DUAL;
       
SELECT ABS(-365) FROM DUAL;
SELECT SIGN(12), SIGN(0), SIGN(-55) FROM DUAL;
SELECT POWER(3,2), POWER(2,10) FROM DUAL;
SELECT SQRT(2), SQRT(9) FROM DUAL;

SELECT GREATEST(10,20,30) ū��, LEAST(10,20,30) ������ FROM DUAL;
SELECT GREATEST('������',256,'�۾���') ū��, LEAST('������',256,'�۾���') ������ FROM DUAL;
-- ȸ�� ���̺��� ȸ���̸�, ���ϸ����� ����Ͻÿ�. (��, ���ϸ����� 1000���� ���� ��� 1000���� ����)
SELECT MEM_NAME ȸ���̸�, (MEM_MILEAGE + 1000) ���ϸ��� FROM MEMBER WHERE TO_NUMBER(MEM_MILEAGE) < 1000;
SELECT MEM_NAME ȸ���̸�, CASE WHEN MEM_MILEAGE < 1000 THEN MEM_MILEAGE + 1000 ELSE MEM_MILEAGE END AS ���ϸ��� FROM MEMBER;

-- ROUND, TRUNC
SELECT ROUND(345.123,0) ��� FROM DUAL;
SELECT ROUND(345.123,-1) ���2 FROM DUAL;
-- ȸ�� ���̺��� ���ϸ����� 12�� ���� ���� �˻� (�Ҽ�3��° �ڸ� �ݿø�, ����)
SELECT MEM_MILEAGE FROM MEMBER;

-- MOD(c,n): c�� n���� ���� ������
SELECT MOD(10.45645615154564646,1) FROM DUAL;

-- FLLOR(n): �ø�, CEIL(n): ����
SELECT FLOOR(1332.69), CEIL(1332.22) FROM DUAL; 
SELECT FLOOR(-1332.69), CEIL(-1332.69) FROM DUAL; 

-- REMAINDER(c,n): n���� ���� ������, MOD�Լ��� ����
SELECT MOD(10,3), REMAINDER(10,3) FROM DUAL;
SELECT MOD(10,3.7), REMAINDER(10,3.7) FROM DUAL;

-- 23-02-27
-- WIDTH_BUCKET(c, min, max, b): min���� max�� ������ �����ϰ� b�������� ������ c�� ��� ������ ���ϴ��� ����
SELECT WIDTH_BUCKET(88,0,100,10) FROM DUAL;
SELECT WIDTH_BUCKET(20,0,100,10) FROM DUAL;
-- ȸ�� ���̺��� ȸ���̸�, ���ϸ���, ����� ����Ͻÿ�.
--  (��, ����� ���ϸ����� 500���� 3000���� 5������� �Ѵ�.)
SELECT MEM_NAME ȸ���̸�, MEM_MILEAGE ���ϸ���, WIDTH_BUCKET(MEM_MILEAGE,500,3000,5) ��� FROM MEMBER ORDER BY ���;
SELECT MEM_NAME ȸ���̸�, MEM_MILEAGE ���ϸ���, WIDTH_BUCKET(MEM_MILEAGE,500,3000,10) ��� FROM MEMBER ORDER BY ���;

-- ������ ����: ������ �ڸ� ������ ��Ÿ���� �� ���� ����(TRUNC)
-- �����Լ� ����
-- ������ ��ġ�� ���� 5�� �� �Ŀ� �ݿø��ϸ� ������ ȿ���� ��´�.
SELECT ROUND(345.123 - 0.05, 1) RESULT1,
       ROUND(345.123 - 0.5, 0) RESULT2,
       ROUND(345.123 - 5, -1) RESULT3 FROM DUAL;

-- 100 / 9 ������� ���� �ڸ����� ��Ÿ���� ���� �ڸ��� �����ÿ�
SELECT ROUND((100 / 9) - 5, -1) RESULT FROM DUAL;
-- FLOOR�Լ� Ȱ��
SELECT 10000 / 7 FROM DUAL;
SELECT FLOOR(10000 / 7 * 1000) / 1000 FROM DUAL; -- �Ҽ��� 3°�ڸ�
SELECT FLOOR(10000 / 7 * 100) / 100 FROM DUAL; -- �Ҽ��� 2°�ڸ�
SELECT FLOOR(10000 / 7 * 10) / 10 FROM DUAL; -- �Ҽ��� 1°�ڸ�
SELECT FLOOR(10000 / 7) FROM DUAL; -- �ڿ���
SELECT FLOOR(10000 / 7 / 10) * 10 FROM DUAL; -- 10°�ڸ�

-- TRUNC: �ݿø��� �ƴ� ����
SELECT PROD_NAME AS ��ǰ��, PROD_COST AS ����, PROD_SALE AS �ǸŰ�,
       PROD_COST/PROD_SALE*100 AS ������,
       TRUNC(PROD_COST/PROD_SALE*100,1) AS ������2,
       (FLOOR(PROD_COST/PROD_SALE*100*10)/10) AS ������3
       FROM PROD;

-- SYSDATE: �ý��ۿ��� �����ϴ� ���� ��¥�� �ð���
SELECT SYSDATE "����ð�", SYSDATE - 1 "���� �̽ð�", SYSDATE + 1 "���� �̽ð�" FROM DUAL;
SELECT MEM_NAME AS ȸ����, MEM_BIR AS ����, (MEM_BIR + 12000) AS "12000��°" FROM MEMBER;
-- ADD_MONTHS(date,n): date�� ���� ���� ��¥
SELECT ADD_MONTHS(SYSDATE,5) FROM DUAL;
SELECT NEXT_DAY(SYSDATE,'������'), LAST_DAY(SYSDATE) FROM DUAL;

-- �̹����� ��ĥ�� ���Ҵ��� �˻��Ͻÿ�
SELECT LAST_DAY(SYSDATE) - SYSDATE AS "�̹��� ���� ��" FROM DUAL;

SELECT ROUND(SYSDATE,'MM'), TRUNC(SYSDATE,'MM') FROM DUAL;

-- MONTHS_BETWEEN(date1,date2): �� ��¥ ������ �޼��� ���ڷ� ����
SELECT MONTHS_BETWEEN(SYSDATE,'2000-01-01') FROM DUAL; 

SELECT EXTRACT(YEAR FROM SYSDATE) AS "�⵵",
       EXTRACT(MONTH FROM SYSDATE) AS "��",
       EXTRACT(DAY FROM SYSDATE) AS "��"
       FROM DUAL;

SELECT MEM_ID AS "ȸ��ID", MEM_NAME AS "ȸ����", MEM_BIR AS "����" FROM MEMBER WHERE EXTRACT(MONTH FROM MEM_BIR) = 3;

-- CAST(expr AS type): ��������� �� ��ȯ
SELECT '[' || CAST('Hello' AS CHAR(10)) || ']' AS "����ȯ" FROM DUAL;
SELECT CAST('1997/12/25' AS DATE) FROM DUAL;

SELECT TO_CHAR(SYSDATE,'ADYYYY,CC"����"') FROM DUAL;
-- TO_CHAR�� ���ؼ� ���� ��¥�� ���ڿ��� ��Ÿ���鼭 ������ ���ϴ´�� ���氡��
SELECT TO_CHAR(CAST('2008-12-25' AS DATE), 'YYYY.MM.DD HH24:MI') FROM DUAL;

-- ��ǰ���̺��� ��ǰ�԰����� '2008-09-28' �������� ������ �˻��Ͻÿ�. (Alias ��ǰ��,��ǰ�ǸŰ�,�԰���)
SELECT PROD_NAME AS "��ǰ��", PROD_SALE AS "��ǰ�ǸŰ�", TO_CHAR(PROD_INSDATE,'YYYY-MM-DD') AS "�԰���" FROM PROD;
-- ȸ���̸��� ���Ϸ� ����ó�� ��µǰ� �ۼ��Ͻÿ�.
-- ��������� 1976�� 1�� ����̰� �¾ ������ �����
SELECT MEM_NAME AS "ȸ���̸�", MEM_BIR AS "ȸ������", MEM_NAME || '���� ' || TO_CHAR(MEM_BIR, 'YYYY"��" MM"�� ����̰� �¾ ������" DAY') FROM MEMBER;

-- ���� FORMAT
SELECT TO_CHAR(1234.6,'99,999.00') FROM DUAL;
SELECT TO_CHAR(-1234.6,'L9999.00PR') FROM DUAL;
SELECT TO_CHAR(255,'XXX') FROM DUAL;

SELECT TO_CHAR(15, 'XXX'),
       TO_CHAR(16, 'XXX'),
       TO_CHAR(17, 'XXX')
       FROM DUAL;

SELECT MEM_NAME ȸ���̸�, MEM_MILEAGE ���ϸ���,
CASE 
    WHEN MEM_MILEAGE >= 3000 THEN 'VIP'
    WHEN MEM_MILEAGE >= 2000 THEN '���'
    WHEN MEM_MILEAGE >= 1000 THEN '�ǹ�'
    WHEN MEM_MILEAGE >= 500 THEN '�����'
    ELSE '�Ϲ�'
  END AS ���
FROM MEMBER ;

SELECT PROD_ID AS "��ǰ�ڵ�",
       PROD_NAME AS "��ǰ��",
       TO_CHAR(PROD_COST,'L99,999,999') AS "���԰���",
       TO_CHAR(PROD_PRICE,'L99,999,999') AS "�Һ��ڰ���",
       TO_CHAR(PROD_SALE,'L99,999,999') AS "�ǸŰ���"
       FROM PROD;

-- TO_NUMBER
SELECT TO_NUMBER('3.1415') FROM DUAL;
SELECT TO_NUMBER('��1,200','L999,999') FROM DUAL;

-- ȸ�����̺��� �̻���ȸ���� ȸ��ID2~4 ���ڿ��� ���������� ġȯ�� �� 10�� ���Ͽ� ���ο� ȸ��ID�� �����Ͻÿ�.
-- (Alias�� ȸ��ID, ����ȸ��ID)
SELECT MEM_ID ȸ��ID, TO_NUMBER(SUBSTR(MEM_ID,2,3)) + 10 "����ȸ��ID" FROM MEMBER WHERE MEM_NAME='�̻���';
SELECT MEM_ID ȸ��ID, 
       SUBSTR(MEM_ID,1,1) ����ȸ��ID,
       SUBSTR(MEM_ID,2),
       TO_CHAR(SUBSTR(MEM_ID,2) + 10, '000'),
       LPAD(SUBSTR(MEM_ID,2) + 10,3,'0'),
       SUBSTR((1000 + TO_NUMBER(SUBSTR(MEM_ID,2))+10),2),
       REPLACE(SUBSTR(MEM_ID,2)+10,'11','011')
       FROM MEMBER
       WHERE MEM_NAME='�̻���';

SELECT TO_DATE('2009-03-05') + 3 FROM DUAL;
SELECT TO_DATE('200803101234','YYYYMMDDHH24MI') FROM DUAL;

-- 230228
-- ȸ�����̺��� �ֹε�Ϲ�ȣ1�� ��¥�� ġȯ�� �� �˻��Ͻÿ� (Alias�� ȸ����, �ֹε�Ϲ�ȣ1, ġȯ��¥)
SELECT MEM_NAME ȸ����, 
       MEM_REGNO1 �ֹε�Ϲ�ȣ1,
       '19'||TO_DATE(MEM_REGNO1,'YYMMDD') ġȯ��¥2,
       TO_CHAR(TO_DATE(MEM_REGNO1,'YYMMDD'),'"19"YY-MM-DD') ġȯ��¥3
       FROM MEMBER;

-- AVG(column): ��ȸ ���� �� �ش� �÷����� ��հ�
-- All�� �⺻���̰� DISTINCT ������ �ߺ��� ����
SELECT ROUND(AVG(DISTINCT PROD_COST),1) AS "�ߺ��� ���� ����",
       AVG(ALL PROD_COST) AS "DEFAULT,��簪������",
       AVG(PROD_COST) AS "���԰� ���"
       FROM PROD;

-- ��ǰ���̺��� �� �ǸŰ��� ��� ���� ���Ͻÿ�? 
SELECT AVG(PROD_SALE) AS "�� �ǸŰ������" FROM PROD;
SELECT AVG(ALL PROD_SALE) AS "�� �ǸŰ������" FROM PROD;

-- ��ǰ���̺��� ��ǰ�з��� �ǸŰ��� ��հ��� ���Ͻÿ�?
SELECT PROD_LGU AS ��ǰ�з�,
       AVG(ALL PROD_SALE) AS "��ǰ�з��ǸŰ������"
       FROM PROD
       GROUP BY PROD_LGU;

-- COUNT(col), COUNT(*): ��ȸ ���� �� �ش� �÷����� �ڷ� ��, ���õ� �ڷ��� ��
SELECT COUNT(DISTINCT PROD_COST),
       COUNT(ALL PROD_COST),
       COUNT(*)
       FROM PROD;

-- �ŷ�ó ���̺��� �����(BUYER_CHARGER)�� �÷����� �Ͽ� COUNT�����Ͻÿ�?
SELECT COUNT(BUYER_CHARGER), COUNT(DISTINCT BUYER_CHARGER), COUNT(*) FROM BUYER;
-- COUNT�� �� NULL���� �����ϰ� ī��Ʈ
SELECT COUNT(COMM) FROM EMP;

-- ȸ�����̺��� ����������� COUNT�����Ͻÿ�
SELECT COUNT(DISTINCT MEM_LIKE) AS "���������" FROM MEMBER;
-- ȸ�����̺��� ��̺� COUNT�����Ͻÿ�? (Alias�� ���, �ڷ��, �ڷ��(*))
-- COUNT(*)�� ��ü �ڷ�� (ROW ����), COUNT(�Ӽ�)�� �Ӽ� �ڷᰳ��(NULL�̸� �������)
SELECT MEM_LIKE ���, COUNT(MEM_LIKE) �ڷ��, COUNT(*) "�ڷ��(*)" FROM MEMBER GROUP BY MEM_LIKE;
-- ȸ�����̺��� ����������� COUNT�����Ͻÿ�
SELECT COUNT(DISTINCT MEM_JOB) AS "����������" FROM MEMBER;
-- ȸ�����̺��� ������ COUNT���� �Ͻÿ� (Alias�� ����, �ڷ��, �ڷ��(*))
SELECT MEM_JOB AS "����", COUNT(MEM_JOB) AS "�ڷ��", COUNT(*) AS "�ڷ��(*)" FROM MEMBER GROUP BY MEM_JOB;
-- ��ٱ������̺��� ȸ��(CART_MEMBER)�� COUNT�����Ͻÿ�? (Alias�� ȸ��ID, ���ż�(DISTINCT), ���ż�, ���ż�(*))
SELECT CART_MEMBER FROM CART;
SELECT CART_MEMBER ȸ��ID, COUNT(DISTINCT CART_MEMBER) AS "���ż�(DISTINCT)", COUNT(*) AS "���ż�(*)" FROM CART GROUP BY CART_MEMBER;

-- MAX(col), MIN(col): ��ȸ ���� �� �ش� �÷��� �� �ִ밪�� �ּҰ�
-- ��ǰ �� �ŷ�ó�� �ְ���԰��ݰ� �������԰���
SELECT PROD_BUYER AS "�ŷ�ó",
       MAX(PROD_COST) AS "�ְ���԰�",
       MIN(PROD_COST) AS "�������԰�"
       FROM PROD
       GROUP BY PROD_BUYER;
-- ��ٱ��� ���̺��� ȸ���� �ִ뱸�ż����� �˻��Ͻÿ� (Alias�� ȸ��ID, �ִ����, �ּҼ���)
SELECT CART_MEMBER AS "ȸ��ID", MAX(CART_QTY) AS "�ִ����", MIN(CART_QTY) AS "�ּҼ���" FROM CART GROUP BY CART_MEMBER;
-- ������ 2020�⵵7��11���̶� �����ϰ� ��ٱ��� ���̺� �߻��� �߰��ֹ���ȣ�� �˻��Ͻÿ�?(Alias�� �ְ�ġ�ֹ���ȣ, �߰��ֹ���ȣ)
SELECT * FROM CART;
-- ������ 2020�⵵7��11���̶� �����ϰ� ��ٱ��� ���̺� �߻��� �߰��ֹ���ȣ�� �˻��Ͻÿ�
SELECT MAX(CART_NO) AS "�ְ�ġ�ֹ���ȣ", MAX(CART_NO) + 1 AS "�߰��ֹ���ȣ" FROM CART WHERE SUBSTR(CART_NO,1,8)='20200711';

-- SUM(column): ��ȸ ���� �� �ش� �÷����� �հ�
-- ��ǰ�԰����̺��� ��ǰ�� �԰������ �հ� ��
SELECT BUY_PROD AS "��ǰ", SUM(BUY_QTY) AS "�԰�����հ�" FROM BUYPROD GROUP BY BUY_PROD;
-- ȸ�����̺��� ȸ����ü�� ���ϸ��� ���, ���ϸ��� �հ�, �ְ� ���ϸ���, �ּ� ���ϸ��� �ο����� �˻��Ͻÿ�?
-- (Alias�� ���ϸ��� ���, ���ϸ��� �հ�, �ְ��ϸ���, �ּҸ��ϸ���, �ο���)
SELECT ROUND(AVG(MEM_MILEAGE),2) AS "���ϸ��� ���",
       SUM(MEM_MILEAGE) AS "���ϸ��� �հ�",
       MAX(MEM_MILEAGE) AS "�ְ� ���ϸ���",
       MIN(MEM_MILEAGE) AS "�ּ� ���ϸ���",
       COUNT(DISTINCT MEM_ID) AS "�ο���"
       FROM MEMBER;
       
-- ��ǰ���̺��� �ŷ�ó, ��ǰ�з����� �ְ��ǸŰ�, �ּ��ǸŰ�, �ڷ���� �˻��Ͻÿ�
SELECT * FROM PROD;
SELECT PROD_BUYER AS "�ŷ�ó", PROD_LGU AS "��ǰ�з�", MAX(PROD_SALE) AS "�ְ��ǸŰ�", MIN(PROD_SALE) AS "�ּ��ǸŰ�", COUNT(PROD_SALE) FROM PROD GROUP BY PROD_BUYER, PROD_LGU;
-- ��ٱ��� ���̺��� ȸ��, ��ǰ�з����� ���ż������, ���ż����հ�, �ڷ���� �˻��Ͻÿ� (Alias�� ȸ��ID, ��ǰ�з�, ���ż��� ���, ���ż����հ�, �ڷ��)
-- ȸ��ID, ��ǰ�з� ������ SORT�Ͻÿ�
SELECT * FROM CART;
SELECT CART_MEMBER AS "ȸ��ID", SUBSTR(CART_PROD,1,4) AS "��ǰ�з�", ROUND(AVG(CART_QTY),2) AS "���ż������", SUM(CART_QTY) AS "���ż����հ�", COUNT(CART_QTY) AS "�ڷ��" FROM CART GROUP BY CART_MEMBER, CART_PROD ORDER BY CART_MEMBER, CART_PROD;
-- ȸ�����̺��� ����(�ּ�1��2�ڸ�),���ϳ⵵���� ���ϸ������, ���ϸ��� �հ�, �ְ��ϸ���, �ּҸ��ϸ���, �ڷ���� �˻��Ͻÿ�
-- (Alias�� ����,���Ͽ���,���ϸ������,���ϸ����հ�,�ְ��ϸ���,�ּҸ��ϸ���,�ڷ��)
SELECT * FROM MEMBER;
SELECT SUBSTR(MEM_ADD1,1,2) AS "����", AVG(MEM_MILEAGE) AS "���ϸ������", SUM(MEM_MILEAGE) AS "���ϸ����հ�", MAX(MEM_MILEAGE) AS "�ְ��ϸ���", MIN(MEM_MILEAGE) AS "�ּҸ��ϸ���", COUNT(MEM_MILEAGE) AS "�ڷ��" FROM MEMBER GROUP BY SUBSTR(MEM_BIR,1,2), SUBSTR(MEM_ADD1,1,2) ORDER BY SUBSTR(MEM_ADD1,1,2);

-- ROLLUP
SELECT PROD_LGU,
       PROD_BUYER,
       COUNT(*),
       SUM(PROD_COST)
       FROM PROD
       GROUP BY PROD_LGU, ROLLUP(PROD_BUYER);

-- CUBE: ROLLUP�Լ��� ���� �� �Ұ赵 ����ϰ� ��ü �Ѱ���� ���
SELECT PROD_LGU,
       PROD_BUYER,
       COUNT(*),
       SUM(PROD_COST)
       FROM PROD
       GROUP BY CUBE(PROD_LGU, PROD_BUYER);

-- NULL
SELECT BUYER_NAME as "�ŷ�ó",
       BUYER_CHARGER AS "�����"
       FROM BUYER
       WHERE BUYER_CHARGER=NULL;
-- ȸ�� ���ϸ����� 100�� ���� ��ġ�� �˻��Ͻÿ� (NVL ���, Alias�� ����,���ϸ���,���渶�ϸ���)
SELECT MEM_NAME AS "����", NVL(MEM_MILEAGE,0) AS "���ϸ���", NVL(MEM_MILEAGE,0)+100 AS "���渶�ϸ���" FROM MEMBER;
-- ȸ�� ���ϸ����� ������ "����ȸ��", Null�̸� '������ȸ��'���� �˻��Ͻÿ�?
UPDATE MEMBER SET MEM_MILEAGE=NULL WHERE MEM_NAME='������';
SELECT MEM_NAME AS "����", MEM_MILEAGE AS "���ϸ���", NVL2(MEM_MILEAGE,'���� ȸ��', '������ ȸ��') AS ȸ������ FROM MEMBER;

-- NULLIF(A,B): A,B�� ���ؼ� ������ NULL ��ȯ, �ٸ��� A��ȯ
SELECT NULLIF(123,123) RESULT1,
       NULLIF(123,1234) RESULT2,
       NULLIF('A','B') RESULT4
       FROM DUAL;
-- ������� ��ȸ�ؼ� ���� ���� NULL�� �ƴѰ��� ����Ѵ�.
SELECT COALESCE(NULL,NULL,'Hello',Null,'World') FROM DUAL;

-- DECODE: IF���� ���� ����� ��
SELECT DECODE(9,10,'A',9,'B',8,'C','D') FROM DUAL;
SELECT DECODE(SUBSTR(PROD_LGU,1,2),
       'P1', '��ǻ��/������ǰ',
       'P2', '�Ƿ�',
       'P3', '��ȭ', '��Ÿ')
       FROM PROD;

-- ��ǰ �з� �� ���� ���ڰ� 'P1'�̸� �ǸŰ��� 10%�λ��ϰ� 'P2'�̸� �ǸŰ��� 15%�λ��ϰ�, �������� ���� �ǸŰ��� �˻��Ͻÿ�
-- (DECODE �Լ� ���, Alias�� ��ǰ��,�ǸŰ�,�����ǸŰ�)
SELECT PROD_NAME AS "��ǰ��", PROD_SALE AS "�ǸŰ�", DECODE(SUBSTR(PROD_LGU,1,2),'P1',PROD_SALE + (PROD_SALE * 0.1),'P2',PROD_SALE + (PROD_SALE * 0.15), PROD_SALE) AS "�����ǸŰ�" FROM PROD;
-- CASE WHEN TEHN ELSE
SELECT CASE WHEN '��'='��' THEN '�´�' ELSE '�ƴϴ�' END AS RESULT1 FROM DUAL;
SELECT CASE '��' WHEN 'öȣ' THEN '�ƴϴ�' WHEN '��' THEN '�ƴϴ�' WHEN '��' THEN '�´�' ELSE '�𸣰ڴ�' END RESULT FROM DUAL;

SELECT PROD_NAME ��ǰ, PROD_LGU �з�,
    CASE PROD_LGU 
    WHEN 'P101' THEN '��ǻ����ǰ'                    
    WHEN 'P102' THEN '������ǰ'
    WHEN 'P201' THEN '����ĳ���'
    WHEN 'P202' THEN '����ĳ���'
    WHEN 'P301' THEN '������ȭ'
    WHEN 'P302' THEN 'ȭ��ǰ'
    WHEN 'P401' THEN '����/CD'
    WHEN 'P402' THEN '����'
    WHEN 'P403' THEN '������'
    ELSE '�̵�Ϻз�'
    END "��ǰ �з�"
    FROM PROD;

-- ȸ���������̺��� �ֹε�� ���ڸ�(7�ڸ��� ù°�ڸ�)���� ���������� �˻��Ͻÿ�?
-- CASE ���� ���, Alias�� ȸ����,�ֹε�Ϲ�ȣ(�ֹ�1-�ֹ�2), ����)
SELECT MEM_NAME AS "ȸ����", MEM_REGNO1 || '-' || MEM_REGNO2 AS "�ֹι�ȣ(�ֹ�1-�ֹ�2)", 
    CASE SUBSTR(MEM_REGNO2,1,1) 
    WHEN '1' THEN '��' 
    WHEN '3' THEN '��' 
    WHEN '2' THEN '��' 
    WHEN '4' THEN '��' 
    END "����" 
    FROM MEMBER;
    
SELECT MEM_NAME AS "ȸ����", MEM_REGNO1 || '-' || MEM_REGNO2 AS "�ֹι�ȣ(�ֹ�1-�ֹ�2)", 
    CASE SUBSTR(MEM_REGNO2,1,1) 
    WHEN '1' THEN '��' 
    WHEN '3' THEN '��' 
    ELSE '��'
    END "����" 
    FROM MEMBER;

SELECT MEM_NAME AS "ȸ����", MEM_REGNO1 || '-' || MEM_REGNO2 AS "�ֹι�ȣ(�ֹ�1-�ֹ�2)", 
    CASE 
    WHEN SUBSTR(MEM_REGNO2,1,1)='1' OR SUBSTR(MEM_REGNO2,1,1)='3' THEN '��' 
    WHEN SUBSTR(MEM_REGNO2,1,1)='2' OR SUBSTR(MEM_REGNO2,1,1)='4' THEN '��' 
    END "����" 
    FROM MEMBER;
    
-- 230302
-- REGEXP_LIKE
SELECT MEM_ID AS "ȸ��ID",
       MEM_NAME AS "ȸ����"
       FROM MEMBER
       WHERE REGEXP_LIKE(MEM_NAME, '^��(��|��)');
SELECT PROD_ID AS "��ǰID",
       PROD_NAME AS "��ǰ��"
       FROM PROD
       WHERE REGEXP_LIKE(PROD_NAME, '^�Ｚ.*\d\d');
-- REGEXP_SUBSTR
SELECT REGEXP_SUBSTR('JavaFlexOracle','[^ ]+') FROM DUAL;
SELECT REGEXP_SUBSTR('JavaFlexOracle','[^ ]+',1,3) FROM DUAL;
-- ȸ�����̺��� �̸����ּҸ� �ٰŷ� �̸��Ͼ��̵�, �̸��ϼ����� �����Ͽ� �˻��Ͻÿ�?
-- Alias�� ȸ���̸�, �̸���, �̸��Ͼ��̵�, �̸��ϼ���
SELECT MEM_NAME AS "ȸ���̸�",
       MEM_MAIL AS "�̸���",
       REGEXP_SUBSTR(MEM_MAIL,'[^@]+') AS "�̸��Ͼ��̵�",
       REGEXP_SUBSTR(MEM_MAIL,'[^@]+',1,2) AS "�̸��ϼ���"
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
-- ��ǰ���̺��� ��ǰ�ڵ�,��ǰ��,�з����� ��ȸ
-- ��ǰ���̺�: PROD, �з����̺�: LPROD
SELECT PROD.PROD_ID AS "��ǰ�ڵ�",
       PROD.PROD_NAME AS "��ǰ��",
       LPROD.LPROD_NM AS "�з���"
       FROM PROD, LPROD
       WHERE PROD.PROD_LGU=LPROD.LPROD_GU;
SELECT PROD.PROD_ID AS "��ǰ�ڵ�",
       PROD.PROD_NAME AS "��ǰ��",
       LPROD.LPROD_NM AS "�з���"
       FROM PROD INNER JOIN LPROD
       ON (PROD.PROD_LGU=LPROD.LPROD_GU);
-- ��ǰ���̺��� �ŷ�ó�� '�Ｚ����'�� �ڷ��� ��ǰ�ڵ�,��ǰ��,�ŷ�ó ���� ��ȸ
SELECT PROD_ID AS "��ǰ�ڵ�",
       PROD_NAME AS "��ǰ��",
       BUYER_NAME AS "�ŷ�ó��"
       FROM PROD, BUYER
       WHERE PROD_BUYER=BUYER_ID
       AND BUYER_NAME LIKE '�Ｚ����%';
-- ��ǰ���̺��� ��ǰ�ڵ�,��ǰ��,�з���,�ŷ�ó��,�ŷ�ó�ּҸ� ��ȸ
-- 1)�ǸŰ�����10���������̰� 2)�ŷ�ó�ּҰ� �λ��� ��츸 ��ȸ
SELECT A.PROD_ID AS "��ǰ�ڵ�",
       A.PROD_NAME AS "��ǰ��",
       B.LPROD_NM AS "�з���",
       C.BUYER_NAME AS "�ŷ�ó��",
       C.BUYER_ADD1 AS "�ּ�"
       FROM PROD A, LPROD B, BUYER C
       WHERE A.PROD_SALE <= 100000
       AND   A.PROD_LGU = B.LPROD_GU
       AND   A.PROD_BUYER = C.BUYER_ID
       AND   C.BUYER_ADD1 LIKE '%�λ�%';
-- ��ٱ������̺��� 2020�⵵ 5���� ȸ���� ���űݾ��� �˻��Ͻÿ�?
-- ���űݾ� = ���ż��� * �ǸŰ�
-- Alias�� ȸ��ID,ȸ����,���űݾ�
SELECT * FROM CART;
SELECT * FROM PROD;
SELECT C.CART_MEMBER AS "ȸ��ID", (C.CART_QTY * P.PROD_SALE) AS "���űݾ�"  FROM CART C INNER JOIN PROD P ON C.CART_PROD=P.PROD_ID;
SELECT ȸ��ID, SUM(���űݾ�) AS "���űݾ�" FROM (SELECT C.CART_MEMBER AS "ȸ��ID", (C.CART_QTY * P.PROD_SALE) AS "���űݾ�"  FROM CART C INNER JOIN PROD P ON C.CART_PROD=P.PROD_ID) GROUP BY ȸ��ID;

SELECT MEMBER.MEM_ID AS "ȸ��id",
       MEMBER.MEM_NAME AS "ȸ��NAME",
       SUM(PROD.PROD_SALE*CART.CART_QTY) AS "���űݾ�"
       FROM CART, MEMBER, PROD
       WHERE CART.CART_MEMBER=MEMBER.MEM_ID
       AND   CART.CART_PROD=PROD.PROD_ID
       AND   SUBSTR(CART.CART_NO,0,6)='202005'
       GROUP BY MEMBER.MEM_ID, MEMBER.MEM_NAME;

-- OUTER JOIN
-- �з����̺� ��ȸ
SELECT * FROM LPROD;
-- �Ϲ� JOIN
SELECT LPROD_GU AS "�з��ڵ�",
       LPROD_NM AS "�з���",
       COUNT(PROD_LGU) AS "��ǰ�ڷ��"
       FROM LPROD,PROD
       WHERE LPROD_GU=PROD_LGU
       GROUP BY LPROD_GU,LPROD_NM;
-- OUTER JOIN ��� Ȯ��
SELECT LPROD_GU AS "�з��ڵ�",
       LPROD_NM AS "�з���",
       COUNT(PROD_LGU) AS "��ǰ�ڷ��"
       FROM LPROD,PROD
       WHERE LPROD_GU=PROD_LGU
       GROUP BY LPROD_GU,LPROD_NM;
-- ANSI OUTER JOIN ��� Ȯ��
SELECT LPROD_GU AS "�з��ڵ�",
       LPROD_NM AS "�з���",
       COUNT(PROD_LGU) AS "��ǰ�ڷ��"
       FROM LPROD
       LEFT OUTER JOIN PROD ON (LPROD_GU=PROD_LGU)
       GROUP BY LPROD_GU,LPROD_NM
       ORDER BY LPROD_GU;
-- ��ü ��ǰ�� 2020�⵵ 5�� 5���� �԰�,�����Ȳ ��ȸ
-- ��ǰ�ڵ�, ��ǰ��, �԰������ ��, �Ǹż����� ��
-- �԰� Ȯ��
SELECT PROD.PROD_ID AS "��ǰ�ڵ�",
       PROD.PROD_NAME AS "��ǰ",
       SUM(BUYPROD.BUY_QTY) AS "�԰����"
       FROM PROD,BUYPROD
       WHERE PROD.PROD_ID=BUYPROD.BUY_PROD
       AND   BUYPROD.BUY_DATE='20200505'
       GROUP BY PROD.PROD_ID,PROD.PROD_NAME;
-- �Ǹ� Ȯ��
SELECT PROD.PROD_ID AS "��ǰ�ڵ�",
       PROD.PROD_NAME AS "��ǰ",
       SUM(CART.CART_QTY) AS "�Ǹż���"
       FROM PROD
       INNER JOIN CART
       ON (PROD.PROD_ID=CART.CART_PROD)
       WHERE CART.CART_NO LIKE '20200505%'
       GROUP BY PROD.PROD_ID,PROD.PROD_NAME;

SELECT PROD.PROD_ID AS "��ǰ�ڵ�",
       PROD.PROD_NAME AS "��ǰ",
       SUM(NVL(BUYPROD.BUY_QTY,0)) AS "�԰����",
       SUM(NVL(CART.CART_QTY,0)) AS "�Ǹż���"
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
SELECT B.MEM_ID AS "ȸ��ID", B.MEM_NAME AS "����", B.MEM_MILEAGE AS "���ϸ���"
       FROM MEMBER A, MEMBER B
       WHERE A.MEM_ID='h001'
       AND A.MEM_MILEAGE<=B.MEM_MILEAGE;
-- �ŷ�ó�ڵ尡'P30203(����)'�� ���������� ���� �ŷ�ó�� �˻� ��ȸ
-- Alias�� �ŷ�ó�ڵ�,�ŷ�ó,�ּ�
SELECT B.BUYER_ID AS "�ŷ�ó�ڵ�", B.BUYER_NAME AS "�ŷ�ó��", B.BUYER_ADD1||' '||B.BUYER_ADD2 AS "�ּ�"
       FROM BUYER A, BUYER B
       WHERE A.BUYER_ID='P30203'
       AND SUBSTR(A.BUYER_ADD1,1,2)=SUBSTR(B.BUYER_ADD1,1,2);

SELECT * FROM BUYER;

-- 230303
-- REGEXP_LIKE
SELECT MEM_ID AS "ȸ��ID", MEM_NAME AS "ȸ����" FROM MEMBER WHERE REGEXP_LIKE(MEM_NAME, '^��(��|��)');
SELECT PROD_ID AS "��ǰID", PROD_NAME AS "��ǰ��" FROM PROD WHERE REGEXP_LIKE(PROD_NAME, '^�Ｚ.*\d\d');
-- REGEXP_SUBSTR
SELECT REGEXP_SUBSTR('Java Flex Oracle','[^ ]+') FROM DUAL;
SELECT REGEXP_SUBSTR('Java Flex Oracle','[^ ]+',7,1) FROM DUAL;
-- REGEXP_REPLACE
SELECT REGEXP_REPLACE('Java Flex Oracle','[^ ]+','C++') FROM DUAL;
SELECT REGEXP_REPLACE('Java Flex Oracle','[^ ]+','C++',1,2) FROM DUAL;
-- ȸ�����̺��� �ֹι�ȣ1 �÷��� �������� xx�� xx�� �������� ��ȸ�Ͻÿ�.(ȸ����, �ֹι�ȣ1, ����)
--SELECT MEM_NAME, MEM_REGNO FROM MEMBER;

-- JOIN GROUP BY: �ַ� ���, �м��ڷḦ �˻��ϱ� ���� ���� Ȱ��
-- ȸ��ID�� r001�� ���� 2020�⵵ ���� ������Ȳ ��ȸ
SELECT MEMBER.MEM_ID AS "ȸ��ID",
       MEMBER.MEM_NAME AS "����",
       MEMBER.MEM_REGNO1 || '-' || MEMBER.MEM_REGNO2 AS "�ֹε�Ϲ�ȣ",
       SUBSTR(CART.CART_NO,1,6) AS "���ſ�",
       SUM(CART.CART_QTY * PROD.PROD_SALE) AS "�����Ѿ�"
       FROM MEMBER, CART, PROD
       WHERE MEMBER.MEM_ID='r001'
       AND MEMBER.MEM_ID=CART.CART_MEMBER
       AND CART.CART_NO LIKE '2020%'
       AND CART.CART_PROD=PROD.PROD_ID
       GROUP BY MEMBER.MEM_ID,MEMBER.MEM_NAME,MEMBER.MEM_REGNO1||'-'||MEMBER.MEM_REGNO2,SUBSTR(CART.CART_NO,1,6);

SELECT * FROM COLS WHERE TABLE_NAME = 'ZIPTB';

-- �ŷ�ó�� 2020�⵵ 1���� �ŷ�ó�� ���ں� ������Ȳ ��ȸ
-- (�ŷ�ó��, ��������, ���Աݾ�)
SELECT * FROM BUYER;
SELECT * FROM BUYPROD WHERE TO_CHAR(BUY_DATE) LIKE '2020-01%';

SELECT BUYER.BUYER_NAME AS "�ŷ�ó��",
       BUYPROD.BUY_DATE AS "��������",
       SUM(BUYPROD.BUY_QTY * BUYPROD.BUY_COST) AS "���Աݾ�"
       FROM BUYPROD, BUYER, PROD
       WHERE BUYPROD.BUY_DATE BETWEEN '2020-01-01' AND '2020-01-31'
       AND   BUYPROD.BUY_PROD=PROD.PROD_ID
       AND   PROD.PROD_BUYER=BUYER.BUYER_ID
       GROUP BY BUYER.BUYER_NAME, BUYPROD.BUY_DATE;
       
-- 2020�⵵ �Ǹŵ� ��ǰ �߿� 5ȸ �̻��� �Ǹ�Ƚ���� �ִ� ��ǰ��ȸ (��ǰ�ڵ�,��ǰ��,�Ǹ�Ƚ��)
SELECT PROD.PROD_ID ��ǰ�ڵ�,
       PROD.PROD_NAME ��ǰ��,
       COUNT(*) �Ǹ�Ƚ��
       FROM PROD, CART
       WHERE PROD.PROD_ID=CART.CART_PROD
       AND   SUBSTR(CART.CART_NO,1,4)='2020'
       GROUP BY PROD.PROD_ID,
                PROD.PROD_NAME
                HAVING COUNT(*) >= 5;

-- ��ǰ�з��� ��ǻ����ǰ('P101')�� ��ǰ�� 2020�⵵ ���ں� �Ǹ���ȸ (�Ǹ���, �Ǹűݾ�,(5,000,000�ʰ��� ��츸), �Ǹż���)
SELECT * FROM CART;
SELECT SUBSTR(CART.CART_NO,1,8) AS "�Ǹ���",
       TO_CHAR(SUM(CART.CART_QTY * PROD.PROD_SALE),'L999,999,999') AS "�Ǹűݾ�",
       SUM(CART.CART_QTY) AS "�Ǹż���"
       FROM PROD, CART
       WHERE CART.CART_NO LIKE '2020%'
       AND PROD.PROD_ID=CART.CART_PROD
       AND PROD.PROD_LGU='P101'
       GROUP BY SUBSTR(CART.CART_NO,1,8)
       HAVING SUM(CART.CART_QTY * PROD.PROD_SALE) > 5000000
       ORDER BY SUBSTR(CART.CART_NO,1,8);

-- 2020�⵵ �Ǹ�����, �Ǹ��Ѿ�(5,000,000�ʰ��� ��츸), �Ǹż���(50�ʰ��� ��츸), �Ǹ�Ƚ���� ��ȸ�Ͻÿ�.
-- ��, �Ǹ�Ƚ���� 8�� �̻��� �Ǹ����ڸ� ��ȸ
SELECT SUBSTR(CART.CART_NO,1,8) AS "�Ǹ���",
       SUM(CART.CART_QTY * PROD.PROD_SALE) AS "�Ǹűݾ�",
       SUM(CART.CART_QTY) AS "�Ǹż���",
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
SELECT B.MEM_ID AS "ȸ��ID", B.MEM_NAME AS "����", B.MEM_MILEAGE AS "���ϸ���" FROM MEMBER A, MEMBER B WHERE A.MEM_ID='h001' AND A.MEM_MILEAGE <= B.MEM_MILEAGE;
-- ��������
-- ������ ��������: ���� �Ѱ��� ��(��)�� ��ȯ
SELECT JOB FROM EMP WHERE EMPNO=7369;
SELECT ENAME, JOB FROM EMP WHERE JOB='���α׷���';
SELECT ENAME, JOB FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE EMPNO = 7369);
-- ������ ��������: �ϳ� �̻��� ���� RETURN�ϴ� SUBQUERY�� ���� �� SUBQUERY��� �Ѵ�.
-- �μ����� ���� �޿��� ���� �޴� ����� ������ ���
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT ENAME, SAL FROM EMP WHERE DEPTNO != 20 AND SAL > ANY(SELECT SAL FROM EMP WHERE JOB='���α׷���');
SELECT DEPTNO AS "�μ���ȣ", MAX(SAL) AS "�ְ�޿�" FROM EMP GROUP BY (DEPTNO);
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP A, (SELECT DEPTNO AS "�μ���ȣ", MAX(SAL) AS "�ְ�޿�" FROM EMP GROUP BY (DEPTNO)) B WHERE A.DEPTNO=B.�μ���ȣ AND A.SAL >= B.�ְ�޿�;
-- ALL: ���������� ������� ��� ��� ���� ���� �Ǿ߸� ������� ��ȯ�Ѵ�.
SELECT ENAME, SAL FROM EMP WHERE DEPTNO != 20 AND SAL > ALL(SELECT SAL FROM EMP WHERE JOB='���α׷���');
-- EXISTS: ���������� �����Ͱ� �����ϴ� ���� ���θ� ���� ���� �����ϴ� ���鸸�� ����� ��ȯ
SELECT EMPNO, ENAME, SAL FROM EMP E WHERE EXISTS (SELECT EMPNO FROM EMP WHERE E.EMPNO=MGR);

SELECT EMPNO,ENAME,SAL
FROM EMP e
WHERE EXISTS 
(SELECT EMPNO FROM EMP WHERE e.ENAME=MGR);

-- ���߿� ��������: ���������� ������� �ΰ� �̻��� �÷��� ��ȯ�ϴ� ��������
SELECT EMPNO, SAL, DEPTNO FROM EMP 
WHERE (SAL, DEPTNO) IN (SELECT SAL, DEPTNO FROM EMP WHERE DEPTNO=30 AND COMM IS NOT NULL);

SELECT EMPNO, SAL, DEPTNO FROM EMP
WHERE SAL IN (SELECT SAL FROM EMP WHERE DEPTNO=30 AND COMM IS NOT NULL)
AND DEPTNO IN (SELECT DEPTNO FROM EMP WHERE DEPTNO=30 AND COMM IS NOT NULL);

-- ���� ���� ����
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);
-- ���� ���� ���� ����
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP 
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP GROUP BY DEPTNO)
AND SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- FROM������ ��������(INLINE VIEW)�� ������� ��������
-- FROM���� ���� ���������� VIEWó�� �ۿ��մϴ�.
SELECT B.EMPNO, B.ENAME, B.JOB, B.SAL, B.DEPTNO 
FROM (SELECT EMPNO FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 20)) A, EMP B
WHERE A.EMPNO = B.EMPNO 
AND B.MGR IS NOT NULL
AND B.DEPTNO != 20;
-- ����� ������ �� �ִ� ����� ��ձ޿����� �޿��� ���� �޴� ����� ������ ���
SELECT EMPNO, ENAME, SAL FROM EMP E WHERE SAL > (SELECT AVG(SAL) SAL FROM EMP WHERE E.EMPNO=MGR);

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO 
FROM EMP 
WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=20)
AND DEPTNO != 20
AND EMPNO IN (SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL);

-- �������� (UNION, INTERSECT, MINUS)
-- ���� �����ڸ� ���� ������ ������ �÷��� ������ Ÿ���� �����ؾ� �մϴ�.
-- UNION: �� ���̺��� ������ ��Ÿ����, ���ս�Ű�� �� ���̺��� �ߺ����� ���� ������ ��ȯ�մϴ�.
SELECT DEPTNO FROM EMP UNION SELECT DEPTNO FROM DEPT;
-- UNION ALL: �ߺ��Ǵ� ������ ��ȯ
SELECT DEPTNO FROM EMP UNION ALL SELECT DEPTNO FROM DEPT;
-- INTERSECT: �� ���� ������ ����� ���� ��ȯ�մϴ�.
SELECT DEPTNO FROM EMP INTERSECT SELECT DEPTNO FROM DEPT;
-- MINUS: �ι�° SELECT���� ���� ��ȯ�Ǵ� �࿡ �������� �ʴ� ����� �����ش�.
SELECT DEPTNO FROM DEPT MINUS SELECT DEPTNO FROM EMP;
-- SET(����)
SELECT MEMBER.MEM_NAME, MEMBER.MEM_JOB, MEMBER.MEM_MILEAGE
FROM MEMBER
WHERE MEMBER.MEM_MILEAGE > 4000;

SELECT MEMBER.MEM_NAME, MEMBER.MEM_JOB, MEMBER.MEM_MILEAGE
FROM MEMBER
WHERE MEMBER.MEM_JOB='�ڿ���';
-- UNION
SELECT MEMBER.MEM_NAME, MEMBER.MEM_JOB, MEMBER.MEM_MILEAGE
FROM MEMBER
WHERE MEMBER.MEM_MILEAGE > 4000
UNION
SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
FROM MEMBER
WHERE MEM_JOB='�ڿ���';
-- INTERSECT
SELECT MEMBER.MEM_NAME, MEMBER.MEM_JOB, MEMBER.MEM_MILEAGE
FROM MEMBER
WHERE MEMBER.MEM_MILEAGE > 4000
INTERSECT
SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
FROM MEMBER
WHERE MEM_JOB='�ڿ���';
-- UNION ALL
SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
FROM MEMBER
WHERE MEM_MILEAGE > 4000
UNION ALL
SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
FROM MEMBER
WHERE MEM_JOB='�ڿ���'
ORDER BY MEM_NAME ASC;
-- MINUS
SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
FROM MEMBER
WHERE MEM_MILEAGE > 4000
MINUS
SELECT MEM_NAME, MEM_JOB, MEM_MILEAGE
FROM MEMBER
WHERE MEM_JOB='�ڿ���'
ORDER BY MEM_NAME ASC;

-- EXISTS�����ڸ� ���Ͽ� SET�������� INTERSECT, MINUS ������
-- ��ٱ��� ���̺���
-- 2020�⵵ 4���� �Ǹŵ� ��ǰ
SELECT DISTINCT C.CART_PROD AS "�ǸŻ�ǰ", P.PROD_NAME AS "��ǰ��"
FROM CART C, PROD P
WHERE C.CART_PROD = P.PROD_ID
AND SUBSTR(C.CART_NO,1,8) BETWEEN '20200401' AND '20200430';

-- 2020�� 6���� �Ǹŵ� ��ǰ
SELECT DISTINCT C.CART_PROD AS "�ǸŻ�ǰ", P.PROD_NAME AS "��ǰ��"
FROM CART C, PROD P
WHERE C.CART_PROD = P.PROD_ID
AND C.CART_NO LIKE '202006';

-- A,B ��ο� �ش�Ǵ� ��ǰ (EXISTS�� �̿��Ͽ� INTERSECT����)
SELECT DISTINCT C.CART_PROD AS "�ǸŻ�ǰ", P.PROD_NAME AS "��ǰ��"
FROM CART C, PROD P
WHERE C.CART_PROD = P.PROD_ID
AND SUBSTR(C.CART_NO,1,8) BETWEEN '20200401' AND '20200430'
AND EXISTS 
    (SELECT DISTINCT CART_PROD
    FROM CART
    WHERE CART.CART_PROD = C.CART_PROD
    AND CART.CART_NO LIKE '202006%');

-- A - B (EXISTS�� �̿��Ͽ� MINUS����)
SELECT DISTINCT C.CART_PROD AS "�ǸŻ�ǰ", P.PROD_NAME AS "��ǰ��"
FROM CART C, PROD P
WHERE C.CART_PROD = P.PROD_ID
AND SUBSTR(C.CART_NO,1,8) BETWEEN '20200401' AND '20200430'
AND NOT EXISTS 
    (SELECT DISTINCT CART_PROD
    FROM CART
    WHERE CART.CART_PROD = C.CART_PROD
    AND CART.CART_NO LIKE '202006%');

-- B���� �ְ� A���� ���� ��ǰ�� ��ȸ (EXOST�� �̿� MINUS ����)
SELECT DISTINCT C.CART_PROD �ǸŻ�ǰ, P.PROD_NAME ��ǰ��
FROM CART C, PROD P
WHERE C.CART_PROD=P.PROD_ID
AND C.CART_NO LIKE '202006%'
AND NOT EXISTS 
    (SELECT DISTINCT CART_PROD
    FROM CART
    WHERE CART.CART_PROD=C.CART_PROD
    AND SUBSTR(CART.CART_NO,1,6)='202004');

-- 230307
-- 2020�⵵ ���űݾ� 2õ�� �̻� ��������� �����Ͽ� �˻��Ͻÿ� ?
-- (Alias�� ȸ��ID, ȸ����, '�������)
SELECT MEM_ID AS "ȸ��ID", MEM_NAME AS "ȸ����", SUM(CART_QTY * PROD_SALE) AS "2020�⵵ ���űݾ�", '�����'
FROM CART, MEMBER, PROD 
WHERE CART_MEMBER = MEM_ID
AND   CART_PROD = PROD_ID
AND   CART_NO LIKE '2020%'
GROUP BY MEM_ID, MEM_NAME
HAVING SUM(CART_QTY * PROD_SALE) > 20000000
ORDER BY "2020�⵵ ���űݾ�" DESC;

SELECT MEM_ID
     , MEM_NAME
     , '�����'
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
     ,   '�����'
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
    REMAIN_YEAR CHAR(04) NOT NULL,      -- �ش� �⵵
    REMAIN_PROD VARCHAR2(10) NOT NULL,  -- ��ǰ �ڵ�
    REMAIN_J_00 NUMBER(5),              -- ���� ���
    REMAIN_I    NUMBER(5),              -- �԰�
    REMAIN_O    NUMBER(5),              -- ���
    REMAIN_J_99 NUMBER(5),              -- �����
    REMAIN_DATE DATE,                   -- ó������
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

-- 2004�⵵ ������ ���� �۾��� �����Ͻÿ�?
-- ��� ��ǰ�� ���� ��� ���� ���� ����
-- �ش�⵵: 2020��
-- ��ǰ�ڵ�: 2004�⵵ ���� ��ǰ
-- �������: 2004�⵵ ���� �����
-- �����: 2004�⵵ ���� �����

SELECT REMAIN_YEAR AS "���ҳ⵵",
       REMAIN_PROD AS "��ǰ�ڵ�",
       REMAIN_J_99 AS "�����"
       FROM REMAIN
       WHERE REMAIN_YEAR='2004';

-- ȸ�����̺��� ��� ȸ���� ���ϸ��� Column���� 10% �λ�ǰ� �����Ͻÿ�
SELECT MEM_MILEAGE, MEM_MILEAGE * 1.1 FROM MEMBER;
UPDATE MEMBER SET MEM_MILEAGE = MEM_MILEAGE * 1.1;

SELECT * FROM MEMBER;

-- ������ ���̺��� �ش�⵵�� '2003'���̰�, ��ǰ�з��� 'P102'�̸鼭
-- ������� NULL�� ��ǰ�� ������ 0���� �����Ͻÿ�
SELECT REMAIN_YEAR AS "�ش翬��",
       REMAIN_PROD AS "��ǰ�з�",
       REMAIN_J_00 AS "�������"
       FROM REMAIN
       WHERE REMAIN_YEAR='2003'
       AND REMAIN_PROD LIKE 'P102%'
       AND REMAIN_J_00 IS NULL;
       
-- 2020�⵵ �Ǹűݾ��� 8õ�� �̻��� �ŷ�ó�� ����� �÷��� '����ŷ�ó'�� ����
SELECT BUYER_ID AS "�ŷ�ó�ڵ�",
       BUYER_NAME AS "�ŷ�ó��",
       BUYER_CHARGER AS "�����",
       '����ŷ�ó' AS "����ŷ�ó"
       FROM BUYER
       WHERE EXISTS (SELECT SUM(CART.CART_QTY * PROD.PROD_SALE)
                    FROM PROD, CART
                    WHERE CART.CART_NO LIKE '2020%'
                    AND   CART.CART_PROD = PROD.PROD_ID
                    AND   PROD.PROD_BUYER = BUYER.BUYER_ID
                    HAVING SUM(CART.CART_QTY * PROD.PROD_SALE) > 80000000);

-- ��ǰ ����� 2020�⵵ �԰������ �ջ��Ͽ� ��ǰ���̺��� �� �԰���� Column ����
-- 1. ��ǰ���̺��� �� �԰���� ��ȸ
SELECT PROD_ID AS "��ǰ�ڵ�",
       SUM(NVL(PROD_QTYIN,0)) AS "���԰����"
       FROM PROD
       GROUP BY PROD_ID;
-- 2. ��� ��ǰ�� 2020�⵵ ��ǰ�� �԰���� �ջ��Ͽ� ��ȸ
SELECT PROD.PROD_ID AS "��ǰ�ڵ�",
       SUM(NVL(BUYPROD.BUY_QTY,0)) AS "���Լ���"
       FROM PROD LEFT OUTER JOIN BUYPROD
       ON (PROD.PROD_ID=BUYPROD.BUY_PROD
       AND BUYPROD.BUY_DATE BETWEEN '2020-01-01' AND '2020-12-31')
       GROUP BY PROD.PROD_ID;

-- ��� ���� ���̺��� �����Ͽ� remain2 ���̺��� �����Ͻÿ�
CREATE TABLE REMAIN2 AS SELECT * FROM REMAIN;
SELECT * FROM REMAIN2;

DELETE FROM REMAIN2;
SELECT * FROM REMAIN2;
ROLLBACK;
SELECT * FROM REMAIN2;
TRUNCATE TABLE REMAIN2;

DROP TABLE REMAIN2;

-- ��ٱ��� 2020�⵵ 5�� �ڷ� �� ȸ��ID='p001'(������)�� �ڷ� ��ȸ
SELECT MEM_ID, MEM_NAME, CART_NO, CART_PROD, CART_MEMBER, CART_QTY 
FROM MEMBER, CART
WHERE MEM_ID = 'p001'
AND CART_NO LIKE '202005%'
AND CART_MEMBER = MEM_ID;

-- ��� �ڷ� �� ��ǰ = 'P202000013'�� �ڷ� ���� (EXISTS�� ���)
DELETE FROM CART
WHERE EXISTS (SELECT MEMBER.MEM_ID FROM MEMBER 
                WHERE MEMBER.MEM_ID='p001'
                AND CART.CART_MEMBER=MEMBER.MEM_ID)
AND CART.CART_NO LIKE '202005%'
AND CART.CART_PROD = 'P202000013';

-- VIEW ��ü
CREATE VIEW VIEW_MEMBER
AS
SELECT MEM_NAME AS "ȸ����",
       MEM_ID   AS "���̵�",
       MEM_MILEAGE AS "���ϸ���",
       TO_CHAR(MEM_BIR,'yyyy-mm-dd') AS "����",
       MEM_JOB  AS "����"
       FROM MEMBER
       WHERE MEM_MILEAGE > 1000
       WITH CHECK OPTION;

SELECT * FROM VIEW_MEMBER;
SELECT * FROM MEMBER;

UPDATE VIEW_MEMBER
SET ȸ����='ȫ�浿'
WHERE ���̵�='e001';

UPDATE VIEW_MEMBER SET ���ϸ���=2000 WHERE ���̵�='e001';

DELETE FROM VIEW_MEMBER WHERE ȸ����='ȫ�浿';
DELETE FROM MEMBER WHERE MEM_NAME='ȫ�浿'; -- ���Ἲ ����

-- �׽�Ʈ 
SELECT COUNT(*) FROM EMP;
SELECT * FROM EMP;
-- ���� �������� �ο� ���ϱ� (�ο��� 3���̻��� ������ ���)
SELECT JOB, COUNT(*) CNT FROM EMP GROUP BY JOB HAVING COUNT(*) > 2;
-- ��ü �μ���ȣ ���ϴµ� �ߺ� �����ϰ� ����ϱ�
SELECT DISTINCT DEPTNO FROM EMP;