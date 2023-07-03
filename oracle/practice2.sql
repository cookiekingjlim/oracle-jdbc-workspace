--1.
 SELECT STUDENT_NO AS "학번",STUDENT_NAME AS "이름",ENTRANCE_DATE AS "입학년도"
 FROM TB_STUDENT
 WHERE DEPARTMENT_NO = 002
 ORDER BY 3 ASC;
 
 --2.
 SELECT PROFESSOR_NAME AS "이름" ,PROFESSOR_SSN AS "주민등록번호"
 FROM TB_PROFESSOR
 WHERE PROFESSOR_NAME NOT LIKE '___'
 ORDER BY 1;
 
 --3. 
 SELECT PROFESSOR_NAME AS "이름", SUBSTR(PROFESSOR_SSN,1,2) AS "나이"
 FROM TB_PROFESSOR
 WHERE MONTH_BETWEEN(SUBSTR(PROFESSOR_SSN, 8, 2),'23')/12;
 
 --4. 
 SELECT SUBSTR(PROFESSOR_NAME,2,2) AS "이름"
 FROM TB_PROFESSOR;
 
 --5.
 SELECT STUDENT_NO, STUDENT_NAME
 FROM TB_STUDENT
 WHERE  EXTRACT(YEAR FROM TO_DATE(SUBSTR(ENTRANCE_DATE,1,8))) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(STUDENT_SSN,1,6))) > 19;
 
 --6.
 SELECT TO_CHAR(TO_DATE('2020/12/25','YYYY/MM/DD'), 'DAY') AS "2020년 크리스마스 요일"
 FROM DUAL;
 
 --7. TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11', 'YY/MM/DD')은 각각 몇 년 몇 월 며칠을 의미할까?
 -- 또 TO_DATE('99/10/11', 'RR/MM/DD'), TO_DATE('49/10/11', 'RR/MM/DD') 은 각각 몇 년 몇 월 며칠을 의미할까?

 --8.
 SELECT STUDENT_NO, STUDENT_NAME
 FROM TB_STUDENT
 WHERE SUBSTR(STUDENT_NO,1,1) NOT LIKE 'A%';
 
 
 
 
 
 
 
 
 
 
 
 