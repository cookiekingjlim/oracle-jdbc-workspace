 /*
 함수: 전달된 컬럼값을 읽어들여서 함수를 실행한 결과를 반환
 
    - 단일행 함수: N개의 값을 읽어서 N개의 결과값을 리턴(매 행마다 함수 실행 결과 반환)
    - 그룹 함수: N개의 값을 읽어서 1개의 결과값을 리턴(그룹별로 함수 실행 결과 반환)
    
    >> SELECT절에 단일행 함수와 그룹 함수는 함께 사용하지 못함! -> 왜냐하면 결과 행의 개수가 다르기때문에!
    >> 함수식을 기술할 수 있는 위치: SELECT, WHERE, ORDER BY, GROUP BY, HAVING
 */
 --단일행 함수------------------------------------------------------------------------------------------------------------------------
 /*
 문자 처리 함수
 LENGTH / LENGTHB
    - LENGTH(컬럼|'문자열값'): 해당 값의 글자수 반환
    - LENGTHB(컬럼|'문자열값'): 해당 값의 바이트 수 반환
    
한글 한 글자 -> 3BYTE
영문자, 숫자, 특수문자 한 글자 -> 1BYTE
 */
 SELECT LENGTH('오라클'), LENGTHB('오라클'),LENGTH('oracle'), LENGTHB('oracle')
 FROM DUAL; --오라클에서 자체 제공하는 가상 테이블
 
 --사원명, 사원명의 글자 수, 사원명의 바이트 수, 이메일, 이메일의 글자 수, 이메일의 바이트 수 조회
-- SELECT *
-- FROM EMPLOYEE;
SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME), EMAIL, LENGTH(EMAIL), LENGTHB(EMAIL)
FROM EMPLOYEE;

 /*
INSTR
    - INSTR(STRING, 'STR' [,POSITION, OCCURRENCE])        --[]이거는 선택사항
    - 지정한 위치부터 지정된 숫자 N번째로 나타나는 문자의 시작 위치를 반환한다.
    
    설명
    - STRING: 문자 타입 컬럼 또는 문자열
    - STR: 찾고자 하는 문자열
    - POSITION: 찾고자 하는 위치의 시작 값(기본값 1) 
        1: 앞에서부터 찾음.
       -1: 뒤에서부터 찾음
    - OCCURRENCE: 찾고자 하는 문자값이 반복될 때 지정하는 빈도(기본값 1)
                  음수 사용 불가
    
 */
 SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL;   --3: 3번째에 있다.
 SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL; --10: 뒤에서부터 찾았을 때 10번째에 있다.
 SELECT INSTR('AABAACAABBAA', 'B', 1, 2) FROM DUAL;  --9 : 앞에서부터 두 번째 걸 찾겠다.

--'s'가 포함되어 있는 이메일 중 이메일, 이메일의 @ 위치, 뒤에서 2번째에 있는 's'위치 조회
SELECT EMAIL, INSTR(EMAIL, '@'), INSTR(EMAIL, 's', -1, 2)
FROM EMPLOYEE
WHERE EMAIL LIKE '%s%';

/*

 LPAD / RPAD
    - 문자열을 조회할 때 통일감 있게 조회하고자 할 때 사용
    - LPAD/RPAD(STRING, 최종적으로 반환할 문자의 길이, [덧붙이고자 하는 문자])
    - 문자열에 덧붙이고자 하는 문자를 왼쪽 또는 오른쪽에 덧붙여서 최종 N길이만큼의 문자열을 반환
*/
 

 SELECT LPAD('HELLO', 10) FROM DUAL; --덧붙이고자 하는 문자 생략시 공백으로 채움
 SELECT LPAD('HELLO', 10, 'A') FROM DUAL; 
 SELECT RPAD('HELLO', 10) FROM DUAL;    --뒤에 5개가 공백으로 채워짐
 SELECT RPAD('HELLO', 10, '*') FROM DUAL;  
 
 /*
 LTRIM / RTRIM
    - 문자열에서 특정 문자를 제거한 나머지를 반환
    - LTRIM/RTRIM(STRING,[제거하고자 하는 문자들])
    - 문자열의 왼쪽 또는 오른쪽에서 제거하고자 하는 문자들을 찾아서 제거한 나머지 문자열을 반환
 */
 --제거하고자 하는 문자 생략시 기본값으로 공백을 제거
 SELECT LTRIM('      K  H       ') FROM DUAL;
 SELECT LTRIM('ACABACCKH', 'ABC') FROM DUAL;
 SELECT RTRIM('5782KH123', '0123456789') FROM DUAL; --RTRM 오른쪽만 제거됨
 
 /*
 
 TRIM
    - 문자열의 양쪽(앞/뒤)에 있는 지정한 문자들을 제거한 나머지 문자열을 반환
    - TRIM([LEADING|TRALING|BOTH] 제거하고자 하는 문자들 FROM STRING)
 */
 SELECT TRIM('                K  H                    ')FROM DUAL;
 SELECT TRIM('Z' FROM 'ZZZZKHZZZZ')FROM DUAL;
 
 SELECT TRIM(LEADING 'Z' FROM 'ZZZZKKKKZZZZ') FROM DUAL;    --LTRIM과 동일
 SELECT TRIM(TRAILING 'Z' FROM 'ZZZZKKKKZZZZ') FROM DUAL;    --RTRIM과 동일
 SELECT TRIM(BOTH 'Z' FROM 'ZZZZKKKKZZZZ') FROM DUAL;    --TRIM과 동일
 
 /*
 
 SUBSTR
    - 문자열에서 특정 문자열을 추출해서 반환
    - SUBSTR(STRING, POSITION, [LENGTH])
        STRING: 문자 타입의 컬럼 또는 '문자열값'
        POSITION: 문자열을 추출할 시작 위치의 값(음수값(뒤)도 가능함)
        LENGTH: 추출할 문자 개수(생략시 끝까지) 
 */
 SELECT SUBSTR('PROGRAMMING', 5, 2) FROM DUAL;   -- 5번째부터 2개 추출하겠다 -> RA
 SELECT SUBSTR('PROGRAMMING', -8, 3)FROM DUAL;   -- 뒤에서부터 8번째 3글자 -> GRA

--여자 사원들의 이름만 조회
 SELECT EMP_NAME
 FROM EMPLOYEE
 WHERE SUBSTR(EMP_NO, 8,1) IN (2,4);
-- WHERE EMP_NAME INSTR(EMP_NO,'2',1,7);

--남자 사원들의 이름만 조회
 SELECT EMP_NAME
 FROM EMPLOYEE
 WHERE SUBSTR(EMP_NO, 8,1)='1';
 
--사원명과 주민등록번호(991212-1******)조회
 SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO,1,8), 14, '*')
 FROM EMPLOYEE;
--직원명, 이메일, 아이디(이메일에서'@'앞의 문자) 조회
 SELECT EMP_NAME, EMAIL, SUBSTR(EMAIL, 1,INSTR(EMAIL, '@')-1) "아이디"
 FROM EMPLOYEE;
 
 /*
 
 LOWER/ UPPER/ INITCAP
    - LOWER/UPPER/INITCAP(STRING)
    LOWER: 다 소문자로 변경한 문자열 반환
    UPPER: 다 대문자로 변경한 문자열 반환
    INITCAP: 단어 앞글자마다 대문자로 변경한 문자열 반환
 */
 SELECT LOWER('Welcome To My World!') FROM DUAL;
 SELECT UPPER('Welcome To My World!') FROM DUAL;
 SELECT INITCAP('welcome to my world!') FROM DUAL;

/*
 CONCAT
    - 문자열 두 개 전달받아 하나로 합친 후 결과 반환
    - CONCAT(STRING, STRING)
*/
 SELECT CONCAT('가나다라', 'ABCD') FROM DUAL; --연결 연산자와 동일!
 SELECT '가나다라'||'ABCD' FROM DUAL;
 
 SELECT '가나다라'||'ABCD'||'1234' FROM DUAL;
 SELECT CONCAT(CONCAT('가나다라','ABCD'),'1234') FROM DUAL; --CONCAT은 무조건 두 개의 문장만 합칠 수 있어서 이렇게 써야함
 
 /*
 
 REPLACE
    -REPLACE(STRING, STR1, STR2)
     STRING: 컬럼 또는 문자열 값
     STR1: 변경시킬 문자열
     STR2: (STR1을)변경할 문자열
 */
 SELECT REPLACE('서울시 강남구 역삼동', '역삼동', '삼성동') FROM DUAL;
 
--사원명, 이메일, 이메일의 kh.co.kr를 gmail.com으로 변경해서 조회
--ex) sun_dj@kh.or.kr -> sun_di@gmail.com

 SELECT EMP_NAME, EMAIL, REPLACE(EMAIL, 'kh.or.kr','gmail.com')
 FROM EMPLOYEE;
 
 /*
 
 숫자 처리 함수
 ABS(NUMBER): 숫자의 절댓값을 구해주는 함수
 */
 SELECT ABS(-10) FROM DUAL;
 
 /*
 MOD(NUMBER, NUMBER): 두 수를 나눈 나머지 값을 반환해주는 함수
 */
 SELECT MOD(10, 3) FROM DUAL;

 /*
 ROUND(NUMBER, [위치]): 반올림한 결과를 반환하는 함수
 */
 SELECT ROUND(123.456) FROM DUAL; --123 위치 생략시 0
 SELECT ROUND(123.456, 1) FROM DUAL;  --123.5, 소수점 아래 자리수 선정
 SELECT ROUND(123.456, -2) FROM DUAL; -- 100, 소수점 앞에서 두번째 자리에 반올림

/*
 CEIL(NUMBER): 올림처리해주는 함수
*/
 SELECT CEIL(123.152) FROM DUAL; --124

/*
 FLOOR(NUMBER): 소수점 아래 버림 기능의 함수, 위치 지정 불가
*/
 SELECT FLOOR(123.952) FROM DUAL;
 
 /*
  TRUNC(NUMBER, [위치]): 위치 지정 가능한 버림 기능의 함수
 */
  SELECT TRUNC(123.952) FROM DUAL;
  SELECT TRUNC(123.952, 1) FROM DUAL; --123.9
  SELECT TRUNC(123.952, -1) FROM DUAL; --120
  
  /*
   날짜 처리 함수
   SYSDATE: 시스템의 날짜를 반환 (현재 날짜)
   
  */
 SELECT SYSDATE FROM DUAL;--2.다시 실행해보면 변경됨
 
 --날짜 포맷 변경
 ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH:MI:SS'; --1.이걸 실행하고
 ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD'; --기존 포맷으로 변경
 
 /*
 MONTHS_BETWEEN(DATE, DATE)
    -입력 받는 두 날짜 사이의 개월 수를 반환
 */
 SELECT MONTHS_BETWEEN(SYSDATE,'20230521') FROM DUAL;

--직원명, 입사일, 근무개월 수 조회
 SELECT EMP_NAME, HIRE_DATE, CEIL(MONTHS_BETWEEN(SYSDATE,HIRE_DATE))||'개월' AS "근무 개월 수"
 FROM EMPLOYEE;

 /*
  ADD_MONTHS(DATE, NUMBER)
    - 특정 날짜에 입력 받는 숫자만큼의 개월 수를 더한 날짜를 반환
 */
 SELECT ADD_MONTHS(SYSDATE, 5) FROM DUAL;
 
 --직원명, 입사일, 입사 후 6개월이 된 날짜를 조회
 SELECT EMP_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE, 6) FROM EMPLOYEE;
 
 /*
 NEXT_DAY(DATE, 요일(문자|숫자))
    - 특정 날짜에서 구하려는 요일의 가장 가까운 날짜를 반환
    - 요일: 1 일요일, 2 월요일,.....7 토요일
 */
 SELECT SYSDATE, NEXT_DAY(SYSDATE, '월요일') FROM DUAL;
 SELECT SYSDATE, NEXT_DAY(SYSDATE, '금') FROM DUAL;
 SELECT SYSDATE, NEXT_DAY(SYSDATE, 4) FROM DUAL;
 
 --현재 언어가 KOREAN이기때문에 에러!
 SELECT SYSDATE, NEXT_DAY(SYSDATE, 'THURSDAY') FROM DUAL;

 --언어 변경
 ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
 ALTER SESSION SET NLS_LANGUAGE = KOREAN;
 
 /*
  LAST_DAY(DATE)
    - 해당 월의 마지막 날짜를 반환
 
 */
 SELECT LAST_DAY(SYSDATE) FROM DUAL;
 SELECT LAST_DAY('20230515') FROM DUAL;
 SELECT LAST_DAY('23/11/01') FROM DUAL;
 
 --직원명, 입사일, 입사월의 마지막 날짜, 입사한 월에 근무한 일수 조회
 SELECT EMP_NAME,HIRE_DATE,LAST_DAY(HIRE_DATE),(LAST_DAY(HIRE_DATE)-HIRE_DATE + 1) AS "입사한 달의 근무일수"
 FROM EMPLOYEE;
 
 /*
  EXTRACT(YEAR|MONTH|DAY FROM DATE)
  - 특정 날짜에서 연도, 월, 일 정보를 추출해서 반환
    YEAR: 연도만 추출
    MONTH: 월만 추출
    DAY: 일만 추출
 */
--직원명, 입사년도, 입사월, 입사일 조회
 SELECT EMP_NAME, EXTRACT(YEAR FROM HIRE_DATE) AS "입사년도", EXTRACT(MONTH FROM HIRE_DATE) AS "입사월", EXTRACT (DAY FROM HIRE_DATE) AS "입사일"
 FROM EMPLOYEE
-- ORDER BY EXTRACT(YEAR FROM HIRE_DATE), EXTRACT(MONTH FROM HIRE_DATE) ASC;
 ORDER BY 2, 3 ASC, 4 ASC;   -- 2번이 SELECT의 입사년도, 3번 입사월
 
 /*
  형 변환 함수
  TO_CHAR(날짜|숫자, [포맷])
  - 날짜 또는 숫자형 데이터를 문자 타입으로 변환해서 반환
 
 */
 SELECT TO_CHAR(1234, 'L999999') FROM DUAL; -- L...현재 설정된 나라의 화폐단위
 SELECT TO_CHAR(1234, '$999999') FROM DUAL;
 SELECT TO_CHAR(1234, 'L99') FROM DUAL; -- 포맷 자리 수가 안맞아서 오류!
 SELECT TO_CHAR(1234, 'L999,999') FROM DUAL; -- 포맷 자리 수가 안맞아서 오류!
 
 --직원명, 급여, 연봉(위의 TO_CHAR를 이용해서)조회
 SELECT EMP_NAME, TO_CHAR(SALARY,'L999,999,999') AS "급여", TO_CHAR((SALARY*12),'L999,999,999,999') AS "연봉"
 FROM EMPLOYEE
 ORDER BY "연봉";

 
 --날짜 -> 문자
 SELECT TO_CHAR(SYSDATE, 'PM HH:MI:SS') FROM DUAL;
 SELECT TO_CHAR(SYSDATE, 'AM HH24:MI:SS') FROM DUAL;
 --DY, DAY: 요일 / DD: 일
 SELECT TO_CHAR(SYSDATE, 'MON DD"일" DY, YYYY') FROM DUAL;
 
 --년도와 관련된 포맷
 SELECT 
    TO_CHAR(SYSDATE, 'YYYY'), --2023
    TO_CHAR(SYSDATE, 'YY'), --23
    TO_CHAR(SYSDATE, 'RRRR'), --2023
    TO_CHAR(SYSDATE, 'RR'), --23
    TO_CHAR(SYSDATE, 'YEAR') --TWENTY TWETY-THREE
 FROM DUAL;
 
 --월과 관련된 포맷
 SELECT
    TO_CHAR(SYSDATE, 'MM'), --06
    TO_CHAR(SYSDATE, 'MON'), --6월
    TO_CHAR(SYSDATE, 'MONTH'),--6월
    TO_CHAR(SYSDATE, 'RM') --로마기호 6
 FROM DUAL;
 
 --일과 관련된 포맷
 SELECT
    TO_CHAR(SYSDATE, 'D'), --4, 주 기준
    TO_CHAR(SYSDATE, 'DD'), -- 21, 월 기준
    TO_CHAR(SYSDATE, 'DDD') --172, 년 기준
 FROM DUAL;

--요일과 관련된 포맷
 SELECT
    TO_CHAR(SYSDATE, 'DAY'), --수요일
    TO_CHAR(SYSDATE, 'DY') --수
 FROM DUAL;

--직원명과 입사일을 조회하는데 단, 입사일은 포맷을 지정해서 조회(2023년 06월 21일 (수))
 SELECT EMP_NAME, TO_CHAR(HIRE_DATE, 'YYYY"년" MM"월" DD"일" (DY)')
 FROM EMPLOYEE
 ORDER BY HIRE_DATE;

 /*
 TO_DATE(숫자|문자, [포맷])
    - 숫자 또는 문자형 데이터를 날짜 타입으로  변환해서 반환
 */
 
 --날짜 포맷 변경!
 ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
 
 --숫자 -> 날짜
 SELECT TO_DATE(20230621) FROM DUAL;
 SELECT TO_DATE(20230621153410) FROM DUAL; --에러
 SELECT TO_DATE(20230621153410, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;

--문자 -> 날짜
 SELECT TO_DATE('20230621', 'YYYYMMDD') FROM DUAL;
 SELECT TO_DATE('20230621 033823', 'YYYYMMDD HH24MISS') FROM DUAL;

 /*
 TO_NUMBER('문자값', [포맷])
    - 문자형 데이터를 숫자 타입으로 변환해서 반환
 */
 SELECT '1000000' + '550000' FROM DUAL;
 SELECT '1,000,000' + '550,000' FROM DUAL; --에러!
 SELECT TO_NUMBER('1,000,000', '999,999,999') + TO_NUMBER('550,000', '999,999') FROM DUAL;
 
 /*
  NULL 처리 함수
  
 NVL(값1, 값2)
    -값1이 NULL이 아니면 값1을 반환하고 값1이 NULL이면 값2를 반환 
 */
-- 사원명, 보너스 조회
 SELECT EMP_NAME, NVL(BONUS, 0)
 FROM EMPLOYEE;

--사원명, 보너스 포함 연봉(월급 + 월급*보너스)*12 조회
 SELECT EMP_NAME, (SALARY+SALARY*NVL(BONUS,0))*12
 FROM EMPLOYEE
 ORDER BY 2;
 
 --사원명, 부서코드 조회(부서 코드가 NULL이면 "부서없음") 조회
 SELECT EMP_NAME, NVL(DEPT_CODE, '부서없음')
 FROM EMPLOYEE;

 /*
 NVL2(값1, 값2, 값3)
    - 값1이 NULL이 아니면 값2를 반환하고 값1이 NULL이면 값3를 반환
 */
-- 사원명, 부서코드가 있는 경우 "부서있음", 없는 경우는 "부서없음"
 SELECT EMP_NAME, NVL2(DEPT_CODE, '부서있음', '부서없음')
 FROM EMPLOYEE;

 /*
 
 선택 함수: 여러가지 경우에 선택을 할 수 있는 기능을 제공하는 함수
 
 DECODE(컬럼|산술연산|함수식, 조건값1, 결과값1, 조건값2, 결과값2,..., 결과값N)
    - 비교하고자 하는 값이 조건값과 일치할 경우 그에 해당하는 결과값을 반환해주는 함수
 */
 -- 사번, 사원명, 주민번호, 성별(남,여) 조회
 SELECT EMP_ID, EMP_NAME, EMP_NO, DECODE(SUBSTR(EMP_NO, 8, 1), 1, '남', 2,'여') AS "성별" -- SUBSTR(EMP_NO, 8, 1) -> 주민번호 8번째 자리 한 개
 FROM EMPLOYEE;
 
 -- 사원명, 직급코드, 기존 급여, 인상된 급여를 조회
 -- 직급 코드가 J7인 사원은 급여를 10% 인상
 -- 직급 코드가 J6인 사원은 급여를 15% 인상
 -- 직급 코드가 J5인 사원은 급여를 20% 인상
 -- 그 외 직급의 사원은 급여를 5%만 인상
 -- 정렬: 직급 코드 J1부터, 인상된 급여 높은 순서대로
 SELECT EMP_NAME, JOB_CODE, SALARY,
 DECODE(JOB_CODE,'J7', SALARY*1.1, 'J6',SALARY*1.15,'J5',SALARY*1.2, SALARY*1.05 ) AS "인상된 급여" --마지막은 디폴트값과 마찬가지
 FROM EMPLOYEE
 ORDER BY JOB_CODE, "인상된 급여" DESC;
 
 /*
 
  CASE WHEN 조건식1 THEN 결과값1
       WHEN 조건식2 THEN 결과값2
       ...
       ELSE 결과값N
  END      
 
 */
 --사번, 사원명, 주민번호, 성별(남자, 여자) 조회
 SELECT EMP_ID, EMP_NAME, EMP_NO,
 CASE WHEN SUBSTR(EMP_NO, 8, 1) = 1 THEN '남자'
      WHEN SUBSTR(EMP_NO, 8,1) = 2 THEN '여자'
      ELSE '잘못된 주민번호 입니다.'
 END AS "성별"
 FROM EMPLOYEE;
      
 --사원명, 급여, 급여 등급(1~4등급) 조회
 --급여 값이 500만원 초과일 경우 1등급
 --급여 값이 500만원 이하 350만원 초과일 경우 2등급
 --급여 값이 350만원 이하 200만원 초과일 경우 3등급
 --그 외의 경우 4등급
 SELECT EMP_NAME, SALARY, 
 CASE WHEN SALARY > 5000000 THEN '1등급'
      WHEN SALARY > 3500000 THEN '2등급'
      WHEN SALARY > 2000000 THEN '3등급'
      ELSE '4등급'
 END AS "급여등급"
 FROM EMPLOYEE
 ORDER BY "급여등급" ASC;
 
 --그룹 함수------------------------------------------------------------------------------------------------------------------------------------------------
 
 /*
  그룹 함수
    - 대량의 데이터들로 집계나 통계 같은 작업을 처리해야 하는 경우 사용되는 함수들
    - 모든 그룹 함수는 NULL값을 자동으로 제외하고 값이 있는 것들만 계산
    
    SUM(NUMBER)
    - 해당 컬럼 값들의 총 합계를 반환
 */
 -- 전체 사원의 총 급여 합
 SELECT TO_CHAR(SUM(SALARY), 'FML999,999,999') --FM 앞에 공백 제거
 FROM EMPLOYEE;
 
 -- 부서코드가 D5인 사원들의 총 연봉 합
 SELECT TO_CHAR(SUM(SALARY*12), 'FML999,999,999')
 FROM EMPLOYEE
 WHERE DEPT_CODE = 'D5';
 
 /*
 
 AVG(NUMBER)
    - 해당 컬럼값들의 평균값을 반환
    - 모든 그룹 함수는 NULL값을 제외
        -> AVG 함수를 사용할 때 NVL 함수와 사용하는 것을 권장
 
 */
 -- 전체 사원의 평균 급여 조회
 SELECT TO_CHAR(ROUND(AVG(SALARY)), 'FML999,999,999') AS "평균 급여"
 FROM EMPLOYEE;
 
 SELECT AVG(BONUS) FROM EMPLOYEE;
 SELECT AVG(NVL(BONUS, 0)) FROM EMPLOYEE;   --실제로 널값은 0으로 처리해서 나누는 게 맞으니까
     
 /*
 
 MIN/MAX(모든 타입의 컬럼)
    - MIN: 해당 컬럼 값들 중에 가장 작은 값을 반환
    - MAX: 해당 컬럼 값들 중에 가장 큰 값을 반환
 */
 --가장 작은 값에 해당하는 사원명, 급여, 입사일
 --가장 큰 값에 해당하는 사원명, 급여, 입사일

 SELECT MIN(EMP_NAME), MIN(SALARY), MIN(HIRE_DATE),
        MAX(EMP_NAME), MAX(SALARY), MAX(HIRE_DATE)
 FROM EMPLOYEE;
 
 /*
 
 COUNT(*|컬럼|DISTINCT 컬럼)
    - 컬럼 또는 행의 개수를 세서 반환
    
    COUNT(*): 조회 결과에 해당하는 모든 행 개수를 반환
    COUNT(컬럼): 해당 컬럼값이 NULL이 아닌 행의 개수를 반환
    COUNT(DISTINCT 컬럼): 해당 컬럼값의 중복을 제거한 행의 개수를 반환
 
 */
 --전체 사원 수 
 SELECT COUNT(*)
 FROM EMPLOYEE;

-- 보너스를 받는 사원 수
 SELECT COUNT(BONUS)
 FROM EMPLOYEE;
-- 부서가 배치된 사원 수 
 SELECT COUNT(DEPT_CODE)
 FROM EMPLOYEE;
-- 현재 사원들이 속해있는 부서 수 
 SELECT COUNT(DISTINCT DEPT_CODE)
 FROM EMPLOYEE;
-- 현재 사원들이 속해있는 있는 직급 수
 SELECT COUNT(DISTINCT JOB_CODE)
 FROM EMPLOYEE;
-- 퇴사한 직원 수
 SELECT COUNT(ENT_DATE)||'명' AS "퇴사한 직원 수"
 FROM EMPLOYEE;
 
 
 
 
 
 
 
 
 
 
 
 
 