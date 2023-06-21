--1. 춘 기술대학교의 학과 이름과 계열을 표시하시오. 단, 출력 헤더는 "학과 명", "계열"으로 표시하도록 한다.
 SELECT DEPARTMENT_NAME AS "학과 명", CATEGORY AS "계열"
 FROM TB_DEPARTMENT;

--2. 학과의 학과 정원을 다음과 같은 형태로 출력한다.
 SELECT DEPARTMENT_NAME ||'의 정원은 '|| CAPACITY ||'명 입니다' AS "학과별 정원"
 FROM TB_DEPARTMENT;
 
 --3. "국어국문학과"에 다니는 여학생 중 현재 휴학중인 여학생을 찾아달라는 요청이 들어왓다. 누구인가? (국문학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서 찾아내도록 하자
 SELECT STUDENT_NAME, DEPARTMENT_NAME, ABSENCE_YN
 FROM TB_DEPARTMENT, TB_STUDENT
 WHERE DEPARTMENT_NAME = '국어국문학과';
 
 
